@implementation _UICollectionLayoutItemSolver

- (id)auxillaryHostAuxillaryItems
{
  _UICollectionLayoutItemSolver *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSCollectionLayoutItem *item;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v2 = self;
  if (self)
    self = (_UICollectionLayoutItemSolver *)self->_item;
  -[_UICollectionLayoutItemSolver supplementaryItems](self, "supplementaryItems");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v6 = (void *)v3;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v6;

  if (v2)
    item = v2->_item;
  else
    item = 0;
  -[NSCollectionLayoutItem decorationItems](item, "decorationItems");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v5;
  v12 = v11;

  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)setSolveResult:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (id)itemFrames
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    -[_UICollectionLayoutItemSolverState itemFrames](*(_QWORD **)(a1 + 48));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)v1;
    v3 = (void *)MEMORY[0x1E0C9AA60];
    if (v1)
      v3 = (void *)v1;
    v4 = v3;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (unint64_t)_arrangeSolutionItems:(void *)a3 alongLayoutAxis:(void *)a4 forContainer:(double)a5 additionalLayoutOffset:(double)a6 interItemSpacing:
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  double *v26;
  void *v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  unint64_t result;
  unint64_t i;
  double *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  uint64_t v69;
  double v70;
  void *v71;
  uint64_t v72;
  _QWORD v73[2];
  double (*v74)(uint64_t, double *, uint64_t);
  void *v75;
  double v76;

  if (a2 == 1)
    v12 = 2;
  else
    v12 = a2 == 2;
  v13 = _UIDirectionalEdgeForPreEdgeOnLayoutAxis(a2);
  v14 = _UIDirectionalEdgeForPostEdgeOnLayoutAxis(a2);
  v15 = objc_msgSend(a4, "isFlexibleSpacing");
  objc_msgSend(a3, "contentInsets");
  v17 = v16;
  objc_msgSend(a3, "contentInsets");
  v18 = a5 + v17;
  v20 = a6 + v19;
  objc_msgSend(a4, "spacing");
  v22 = v21;
  if (objc_msgSend(a1, "count"))
  {
    v71 = a3;
    v72 = v12;
    v23 = 0;
    v24 = 0;
    v25 = 0.0;
    do
    {
      v26 = (double *)(id)objc_msgSend(a1, "objectAtIndexedSubscript:", v24);
      -[_UICollectionSolutionGroupArrangementItem item](v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (id)objc_msgSend(v27, "edgeSpacing");

      v29 = 0.0;
      v30 = 0.0;
      if (v26)
      {
        v29 = v26[4];
        v30 = v26[5];
      }
      v31 = v25 + _UISizeValueForAxis(a2, v29, v30);
      objc_msgSend(v28, "spacingForEdge:", v13);
      v33 = v32;
      objc_msgSend(v28, "spacingForEdge:", v14);
      v35 = v31 + v33 + v34;
      v36 = v23 + objc_msgSend(v28, "isSpacingFlexibleForEdge:", v13);
      v37 = v36 + objc_msgSend(v28, "isSpacingFlexibleForEdge:", v14);
      v38 = objc_msgSend(a1, "count");
      v39 = -0.0;
      if (v24 != v38 - 1)
        v39 = v22;
      v25 = v35 + v39;
      if (v24 == v38 - 1)
        v40 = 0;
      else
        v40 = v15;
      v23 = v37 + v40;
      ++v24;
    }
    while (v24 < objc_msgSend(a1, "count"));
    if (v23 <= 0)
    {
      v51 = 0.0;
    }
    else
    {
      objc_msgSend(v71, "contentInsets");
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;
      objc_msgSend(v71, "contentSize");
      v51 = (_UISizeValueForAxis(a2, v49 - (v44 + v48), v50 - (v42 + v46)) - v25) / (double)v23;
      v52 = -0.0;
      if (v15)
        v52 = v51;
      v22 = v22 + v52;
    }
    v12 = v72;
  }
  else
  {
    v51 = 0.0;
  }
  v53 = _UIPointValueForAxis(a2, v18, v20);
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v74 = (double (*)(uint64_t, double *, uint64_t))__124___UICollectionLayoutItemSolver__arrangeSolutionItems_alongLayoutAxis_forContainer_additionalLayoutOffset_interItemSpacing___block_invoke;
  v75 = &__block_descriptor_40_e54_d24__0___UICollectionSolutionGroupArrangementItem_8Q16l;
  v76 = v51;
  result = objc_msgSend(a1, "count");
  if (result)
  {
    for (i = 0; i < result; ++i)
    {
      v56 = (double *)(id)objc_msgSend(a1, "objectAtIndexedSubscript:", i);
      v74((uint64_t)v73, v56, v13);
      v58 = 0.0;
      v59 = 0.0;
      v60 = 0.0;
      if (v56)
      {
        v60 = v56[2];
        v59 = v56[3];
      }
      v61 = v53 + v57;
      v62 = _UIPointValueForAxis(v12, v60, v59);
      v63 = _UISetPointValueForAxis(a2, v18, v20, v61);
      v18 = _UISetPointValueForAxis(v12, v63, v64, v62);
      v20 = v65;
      v66 = 0.0;
      if (v56)
      {
        v66 = v56[4];
        v58 = v56[5];
        v56[2] = v18;
        v56[3] = v65;
      }
      v67 = v61 + _UISizeValueForAxis(a2, v66, v58);
      v68 = v67 + v74((uint64_t)v73, v56, v14);
      v69 = objc_msgSend(a1, "count") - 1;
      v70 = -0.0;
      if (i != v69)
        v70 = v22;
      v53 = v68 + v70;
      result = objc_msgSend(a1, "count");
    }
  }
  return result;
}

- (id)queryFramesWithQueryRect:(uint64_t)a3 additionalFrameOffset:(uint64_t)a4 itemIndexOffset:(CGFloat)a5 supplementaryOffsets:(CGFloat)a6 itemLimit:(CGFloat)a7
{
  if (a1)
  {
    -[_UICollectionLayoutItemSolver _queryFramesWithQueryRect:additionalFrameOffset:itemIndexOffset:supplementaryOffsets:itemLimit:]((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_queryFramesWithQueryRect:(uint64_t)a3 additionalFrameOffset:(uint64_t)a4 itemIndexOffset:(CGFloat)a5 supplementaryOffsets:(CGFloat)a6 itemLimit:(CGFloat)a7
{
  id v20;
  void *v22;
  _QWORD v23[11];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  if (a1)
  {
    if (a4 < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", sel__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_supplementaryOffsets_itemLimit_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemLimit >= 0"));

    }
    if (*(_QWORD *)(a1 + 48))
    {
      v24 = 0;
      v25 = &v24;
      v26 = 0x3032000000;
      v27 = __Block_byref_object_copy__31;
      v28 = __Block_byref_object_dispose__31;
      v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __128___UICollectionLayoutItemSolver__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_supplementaryOffsets_itemLimit___block_invoke;
      v23[3] = &unk_1E16B8F58;
      v23[7] = a2;
      v23[8] = sel__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_supplementaryOffsets_itemLimit_;
      v23[4] = a3;
      v23[5] = a1;
      *(double *)&v23[9] = a9;
      *(double *)&v23[10] = a10;
      v23[6] = &v24;
      -[_UICollectionLayoutItemSolver _enumerateSolutionFramesForQueryRect:itemLimit:withHandler:](a1, a4, (uint64_t)v23, a5, a6, a7, a8);
      v20 = (id)v25[5];
      _Block_object_dispose(&v24, 8);

    }
    else
    {
      v20 = (id)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (void)_enumerateSolutionFramesForQueryRect:(uint64_t)a3 itemLimit:(CGFloat)a4 withHandler:(CGFloat)a5
{
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  float64_t v14;
  _UIRTree *v15;
  void *v16;
  _UIRTree *v17;
  void *v18;
  _UIRTree *v19;
  _QWORD *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  _BOOL4 v24;
  unint64_t v25;
  _QWORD *v26;
  float64x2_t v27;
  float64x2_t v28;
  void *v29;
  void *v30;
  _QWORD v35[2];
  uint64_t (*v36)(uint64_t, uint64_t, float64x2_t *);
  void *v37;
  uint64_t v38;
  _QWORD *v39;
  void *v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  uint64_t v45;
  BOOL v46;
  BOOL v47;
  _QWORD v48[4];
  float64x2_t v49;
  float64x2_t v50;
  _UIRTree *v51;
  char v52[17];
  CGRect v53;
  CGRect v54;
  CGRect v55;

  if (a2 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", sel__enumerateSolutionFramesForQueryRect_itemLimit_withHandler_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1369, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemLimit >= 0"));

    if (a3)
      goto LABEL_3;
  }
  else if (a3)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", sel__enumerateSolutionFramesForQueryRect_itemLimit_withHandler_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1370, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

LABEL_3:
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
  {
    v53.origin.x = a4;
    v53.size.width = a6;
    v53.origin.y = a5;
    v53.size.height = a7;
    v11 = CGRectEqualToRect(v53, *MEMORY[0x1E0C9D648]);
    v12 = *(void **)(v10 + 40);
    v13 = *(void **)(v10 + 48);
    v14 = MEMORY[0x1E0C809B0];
    if (!v12)
    {
      v15 = objc_alloc_init(_UIRTree);
      v16 = *(void **)(v10 + 48);
      v49.f64[0] = v14;
      *(_QWORD *)&v49.f64[1] = 3221225472;
      *(_QWORD *)&v50.f64[0] = __63___UICollectionLayoutItemSolverState__generateGeometricIndexer__block_invoke;
      *(_QWORD *)&v50.f64[1] = &unk_1E16B8FD0;
      v17 = v15;
      v51 = v17;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", &v49);
      v18 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v17;
      v19 = v17;

      v12 = *(void **)(v10 + 40);
    }
    v20 = v12;

    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x2020000000;
    v48[3] = 0;
    *(float64_t *)v35 = v14;
    v35[1] = 3221225472;
    v36 = (uint64_t (*)(uint64_t, uint64_t, float64x2_t *))__92___UICollectionLayoutItemSolver__enumerateSolutionFramesForQueryRect_itemLimit_withHandler___block_invoke;
    v37 = &unk_1E16B8FA8;
    v39 = v48;
    v40 = v13;
    v46 = a2 > 0;
    v47 = v11;
    v41 = a4;
    v42 = a5;
    v43 = a6;
    v44 = a7;
    v38 = a3;
    v45 = a2;
    if (v11)
      goto LABEL_10;
    v55.origin.x = -[_UICollectionLayoutItemSolver contentFrame](a1);
    v55.origin.y = v21;
    v55.size.width = v22;
    v55.size.height = v23;
    v54.origin.x = a4;
    v54.size.width = a6;
    v54.origin.y = a5;
    v54.size.height = a7;
    v24 = !CGRectContainsRect(v54, v55);
    if (a2 >= 1)
      LOBYTE(v24) = 0;
    if (v24)
    {
      if (v20)
      {
        v52[0] = 0;
        v26 = (_QWORD *)v20[1];
        v28.f64[0] = a4;
        v27.f64[0] = a6;
        v28.f64[1] = a5;
        v27.f64[1] = a7;
        v49 = vaddq_f64(v28, vminnmq_f64(v27, (float64x2_t)0));
        v50 = vabsq_f64(v27);
        _UIRTreeContainerNode<unsigned long>::enumerateElementsIntersecting(v26, &v49, v52, (uint64_t)v35);
      }
    }
    else
    {
LABEL_10:
      v25 = 0;
      LOBYTE(v49.f64[0]) = 0;
      do
      {
        if (v25 >= objc_msgSend(v13, "count"))
          break;
        v36((uint64_t)v35, v25++, &v49);
      }
      while (!LOBYTE(v49.f64[0]));
    }
    _Block_object_dispose(v48, 8);
  }
}

- (double)contentFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;

  if (!a1)
    return 0.0;
  v2 = -[_UICollectionLayoutItemSolver layoutFrame](a1);
  objc_msgSend(*(id *)(a1 + 16), "_effectiveContentInsets");
  if (v4 != 0.0 || v3 != 0.0 || v6 != 0.0 || v5 != 0.0)
    return v2 + v4;
  return v2;
}

- (void)_solveForContainer:(uint64_t)a3 layoutAxis:(void *)a4 traitCollection:(uint64_t)a5 maxFrameCount:(char)a6 layoutRTL:(void *)a7 preferredSizes:(uint64_t)a8 largestKnownItemSize:(double)a9 solutionRecursionDepth:(double)a10
{
  _UICollectionPreferredSizes *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id *v24;
  _UICollectionLayoutSupplementaryEnroller *v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _UICollectionLayoutContainer *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double *v40;
  _UICollectionLayoutEnvironment *v41;
  void (**v42)(_QWORD, _QWORD);
  void *v43;
  id v44;
  id *v45;
  void *v46;
  uint64_t v47;
  id v48;
  __int128 v49;
  id v50;
  _UICollectionLayoutItemSolverState *v51;
  void *v52;
  void *v53;
  void *v54;
  id *v55;
  void *v56;
  void *v57;
  id v58;
  char isKindOfClass;
  id v60;
  id v61;
  id v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  unint64_t v81;
  NSObject *v82;
  void *v83;
  int v84;
  unint64_t v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  char v100;
  BOOL v101;
  double v102;
  double *v103;
  void *v105;
  _UICollectionLayoutItemSolver *v106;
  uint64_t v107;
  void *v108;
  BOOL v109;
  id v110;
  void *v111;
  void *v112;
  int v113;
  uint64_t v114;
  _QWORD *v115;
  BOOL v117;
  double v119;
  double v120;
  double v121;
  id *v122;
  id *v123;
  void *v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  char v140;
  uint64_t v141;
  _UICollectionSolutionGroupArrangementItem *v142;
  id *v143;
  id *v144;
  double v145;
  id *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t i;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  void *v157;
  unint64_t v158;
  id *v159;
  double v160;
  double v161;
  id v162;
  int v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  double v168;
  double v169;
  double v170;
  double v171;
  void *v172;
  void *v173;
  void *v174;
  _UICollectionLayoutItemSolverState *v175;
  id *v176;
  id v177;
  double v178;
  double v179;
  id v180;
  void *v181;
  id v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t j;
  void *v186;
  id v187;
  double v188;
  double v189;
  void *v190;
  double v191;
  CGFloat v192;
  uint64_t v193;
  id v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t k;
  _QWORD *v198;
  _QWORD *v199;
  uint64_t v200;
  double x;
  double y;
  double width;
  double height;
  uint64_t v205;
  uint64_t v206;
  id v207;
  double v208;
  double v209;
  void *v210;
  id v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t m;
  uint64_t v215;
  id v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  double v222;
  double v223;
  double v224;
  double v225;
  id v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t n;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  id v234;
  _UICollectionLayoutItemSolverState *v235;
  id *v236;
  void *v237;
  CGFloat v238;
  id v239;
  uint64_t (**v240)(void *, uint64_t);
  id v241;
  void (**v242)(void *, uint64_t);
  uint64_t v243;
  uint64_t v244;
  double v245;
  double v246;
  double v247;
  void *v248;
  double v249;
  double v250;
  void *v251;
  int v252;
  void *v253;
  void *v254;
  double v255;
  void *v256;
  double v257;
  double v258;
  double v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  uint64_t v265;
  double v266;
  double v267;
  double v268;
  double v269;
  double v270;
  double *v271;
  int v272;
  id *v273;
  void *v274;
  id *v275;
  uint64_t v276;
  _QWORD *v277;
  uint64_t v278;
  void *v279;
  char *v280;
  int v281;
  id *v282;
  void *v283;
  id v284;
  void *v285;
  uint64_t v286;
  void *v287;
  id v289;
  id v290;
  void *v291;
  uint64_t v292;
  id *obj;
  id obja;
  double (**objb)(id, uint64_t);
  id v296;
  id v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  objc_super buf;
  uint64_t v319;
  void *v320;
  _OWORD v321[8];
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  double v326;
  uint64_t v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  id *v331;
  void *v332;
  id v333;
  double *v334;
  id v335;
  uint64_t v336;
  id v337;
  _BYTE v338[128];
  CGAffineTransform v339;
  CGAffineTransform v340;
  _BYTE v341[80];
  uint64_t v342;
  uint64_t aBlock;
  uint64_t v344;
  void *v345;
  void *v346;
  id v347;
  double v348;
  double v349;
  _QWORD v350[5];
  id v351;
  objc_super *p_buf;
  uint64_t v353;
  CGSize v354;
  CGSize v355;
  CGSize v356;
  NSDirectionalEdgeInsets v357;
  NSDirectionalEdgeInsets v358;
  CGRect v359;
  CGRect v360;

  v353 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a5 < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__solveForContainer_layoutAxis_traitCollection_maxFrameCount_layoutRTL_preferredSizes_largestKnownItemSize_solutionRecursionDepth_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 552, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maxFrameCount >= 0"));

      if (a7)
        goto LABEL_4;
    }
    else if (a7)
    {
LABEL_4:
      v19 = a7;
      goto LABEL_7;
    }
    v19 = objc_alloc_init(_UICollectionPreferredSizes);
LABEL_7:
    v21 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v19;

    objc_storeStrong((id *)(a1 + 24), a2);
    *(_QWORD *)(a1 + 88) = a3;
    objc_storeStrong((id *)(a1 + 32), a4);
    v22 = a1;
    v24 = (id *)(a1 + 48);
    v23 = *(void **)(a1 + 48);
    *(_BYTE *)(a1 + 8) = a6;
    *(_QWORD *)(a1 + 72) = a8;
    *(_QWORD *)(a1 + 80) = a5;
    *(double *)(a1 + 96) = a9;
    *(double *)(a1 + 104) = a10;
    *(_QWORD *)(a1 + 48) = 0;

    if (!a8)
    {
      v25 = objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
      v26 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v25;

    }
    if (!objc_msgSend(*(id *)(a1 + 16), "isGroup"))
    {
      -[_UICollectionPreferredSizes objectAtIndexedSubscript:](*(_QWORD *)(a1 + 56), 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionLayoutItemSolver _solveSingleItemWithPreferredSize:groupMaxItemSize:](a1, (uint64_t)v57, *(double *)(a1 + 96), *(double *)(a1 + 104));

      v24 = (id *)(a1 + 48);
      goto LABEL_227;
    }
    if (objc_msgSend(*(id *)(a1 + 16), "hasCustomGroupItemProvider"))
    {
      if (!objc_msgSend(*(id *)(a1 + 16), "isGroup"))
        goto LABEL_227;
      v273 = (id *)(a1 + 48);
      v27 = *(id *)(a1 + 16);
      objc_msgSend(*(id *)(a1 + 32), "displayScale");
      v29 = v28;
      objc_msgSend(*(id *)(a1 + 16), "size");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_effectiveSizeForContainer:displayScale:ignoringInsets:", *(_QWORD *)(a1 + 24), 1, v29);
      v32 = v31;
      v34 = v33;

      v35 = [_UICollectionLayoutContainer alloc];
      objc_msgSend(*(id *)(a1 + 16), "_effectiveContentInsets");
      v40 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v35, v32, v34, v36, v37, v38, v39);
      v41 = -[_UICollectionLayoutEnvironment initWithContainer:traitCollection:dataSourceSnapshot:]([_UICollectionLayoutEnvironment alloc], "initWithContainer:traitCollection:dataSourceSnapshot:", v40, *(_QWORD *)(a1 + 32), 0);
      objc_msgSend(v27, "customGroupItemProvider");
      v42 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _UICollectionLayoutEnvironment *))v42)[2](v42, v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v45 = (id *)-[_UICollectionLayoutAuxillaryItemSolver initWithAuxillaryHost:]([_UICollectionLayoutAuxillaryItemSolver alloc], (void *)a1);
      -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = MEMORY[0x1E0C809B0];
      aBlock = MEMORY[0x1E0C809B0];
      v344 = 3221225472;
      v345 = __66___UICollectionLayoutItemSolver__solveWithCustomGroupItemProvider__block_invoke;
      v346 = &unk_1E16B8FD0;
      v48 = v44;
      v347 = v48;
      objc_msgSend(v46, "enumerateObjectsUsingBlock:", &aBlock);

      buf.receiver = 0;
      buf.super_class = (Class)&buf;
      v319 = 0x4010000000;
      v320 = &unk_18685B0AF;
      v49 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      v321[0] = *MEMORY[0x1E0C9D648];
      v321[1] = v49;
      v350[0] = v47;
      v350[1] = 3221225472;
      v350[2] = __66___UICollectionLayoutItemSolver__solveWithCustomGroupItemProvider__block_invoke_2;
      v350[3] = &unk_1E16B8E78;
      p_buf = &buf;
      v350[4] = a1;
      v50 = v48;
      v351 = v50;
      objc_msgSend(v43, "enumerateObjectsUsingBlock:", v350);
      v51 = [_UICollectionLayoutItemSolverState alloc];
      v52 = (void *)objc_msgSend(v43, "count");
      -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](v45);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)objc_msgSend(v53, "count");
      v55 = -[_UICollectionLayoutItemSolverState initWithSolutionFrames:itemFrameCount:supplementaryFrameCount:solvedFittingFrame:preferredSizeGroupingRanges:additionalOffsetForOutermostGroup:errorDescription:](v51, v50, v52, v54, MEMORY[0x1E0C9AA60], 0, *((double *)buf.super_class + 4), *((double *)buf.super_class + 5), *((double *)buf.super_class + 6), *((double *)buf.super_class + 7), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

      v56 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v55;

      _Block_object_dispose(&buf, 8);
      goto LABEL_226;
    }
    v273 = (id *)(a1 + 48);
    v58 = *(id *)(a1 + 16);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = a1;
      objc_msgSend(v261, "handleFailureInMethod:object:file:lineNumber:description:", sel__solveGroup, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 636, CFSTR("Cannot solve for a non-group item."));

    }
    v60 = *(id *)(v22 + 16);
    v61 = *(id *)(v22 + 24);
    v284 = *(id *)(v22 + 32);
    v62 = *(id *)(v22 + 64);
    v296 = *(id *)(v22 + 72);
    objc_msgSend(v61, "contentInsets");
    v274 = v61;
    objc_msgSend(v61, "contentSize");
    v63 = *(char **)(v22 + 88);
    v283 = v60;
    v64 = -[_UICollectionLayoutItemSolver _layoutAxisForGroup:](v22, v60);
    if (v64 == 1)
      v65 = 2;
    else
      v65 = v64 == 2;
    v281 = *(unsigned __int8 *)(v22 + 8);
    v280 = v63;
    v286 = v64;
    if (v64)
    {
      if (v63)
        goto LABEL_21;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v262, "handleFailureInMethod:object:file:lineNumber:description:", sel__solveGroup, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 649, CFSTR("No valid layout axis detected."));

      if (v280)
        goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v263, "handleFailureInMethod:object:file:lineNumber:description:", sel__solveGroup, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 650, CFSTR("No valid layout axis detected."));

LABEL_21:
    objc_msgSend(v60, "size");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v272 = objc_msgSend(v66, "_isEstimatedForAxis:", v286);

    objc_msgSend(v283, "interItemSpacing");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "spacing");
    v270 = v68;

    objc_msgSend(v284, "displayScale");
    v70 = v69;
    objc_msgSend(v283, "size");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "_effectiveSizeForContainer:displayScale:ignoringInsets:", v274, 0, v70);
    v73 = v72;
    v75 = v74;

    if (*(_QWORD *)(a1 + 72))
      goto LABEL_41;
    objc_msgSend(v283, "edgeSpacing");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v76, "_hasSpacing"))
    {
      if (v280 == (char *)2)
      {
        objc_msgSend(v76, "top");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v78, "isFlexibleSpacing"))
        {

        }
        else
        {
          objc_msgSend(v76, "bottom");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = objc_msgSend(v83, "isFlexibleSpacing");

          if (!v84)
            goto LABEL_40;
        }
        v85 = qword_1ECD7CF48;
        if (!qword_1ECD7CF48)
        {
          v85 = __UILogCategoryGetNode("CollectionLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v85, (unint64_t *)&qword_1ECD7CF48);
        }
        v82 = *(NSObject **)(v85 + 8);
        if (!os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
          goto LABEL_40;
        LOWORD(buf.receiver) = 0;
LABEL_39:
        _os_log_impl(&dword_185066000, v82, OS_LOG_TYPE_ERROR, "A NSCollectionLayoutGroup has specified flexible edge spacing along primary layout axis; flexible spacing will"
          " be ignored but any required spacing will be applied.",
          (uint8_t *)&buf,
          2u);
        goto LABEL_40;
      }
      if (v280 == (char *)1)
      {
        objc_msgSend(v76, "leading");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v77, "isFlexibleSpacing"))
        {

LABEL_30:
          v81 = _MergedGlobals_984;
          if (!_MergedGlobals_984)
          {
            v81 = __UILogCategoryGetNode("CollectionLayout", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v81, (unint64_t *)&_MergedGlobals_984);
          }
          v82 = *(NSObject **)(v81 + 8);
          if (!os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            goto LABEL_40;
          LOWORD(buf.receiver) = 0;
          goto LABEL_39;
        }
        objc_msgSend(v76, "trailing");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "isFlexibleSpacing");

        if (v80)
          goto LABEL_30;
      }
    }
LABEL_40:

LABEL_41:
    v278 = objc_msgSend(v283, "count");
    objc_msgSend(v283, "_effectiveContentInsets");
    if (v87 >= 0.5)
      v90 = 1.0;
    else
      v90 = v73;
    v91 = v87 * v90;
    if (v89 >= 0.5)
      v92 = 1.0;
    else
      v92 = v73;
    v93 = v89 * v92;
    if (v86 >= 0.5)
      v94 = 1.0;
    else
      v94 = v75;
    v95 = v86 * v94;
    if (v88 >= 0.5)
      v96 = 1.0;
    else
      v96 = v75;
    v271 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:]([_UICollectionLayoutContainer alloc], v73, v75, v95, v91, v88 * v96, v93);
    objc_msgSend(v271, "effectiveContentSize");
    v268 = v98;
    v269 = v97;
    v99 = _UISizeValueForAxis(v286, v97, v98);
    v100 = v272;
    if (v99 > 0.0)
      v100 = 1;
    v266 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v267 = *MEMORY[0x1E0C9D820];
    v101 = v75 == v266 && v73 == *MEMORY[0x1E0C9D820];
    if (v101 || (v100 & 1) == 0)
    {
      v164 = (void *)MEMORY[0x1E0CB37A0];
      objc_msgSend(v274, "contentInsets");
      NSStringFromDirectionalEdgeInsets(v357);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v274, "contentSize");
      NSStringFromCGSize(v355);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "stringWithFormat:", CFSTR("There is no room for this NSCollectionLayoutGroup to fit into its parent group or section, or it has no room for any subitems itself. Inspect the parent and ensure the contentInsets (%@) do not result in a negative effectiveContentSize when applied to size: %@."), v165, v166);
      v167 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v283, "contentInsets");
      if (v171 != 0.0 || v168 != 0.0 || v170 != 0.0 || v169 != 0.0)
      {
        objc_msgSend(v283, "contentInsets");
        NSStringFromDirectionalEdgeInsets(v358);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        v356.height = v268;
        v356.width = v269;
        NSStringFromCGSize(v356);
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v167, "appendFormat:", CFSTR("\nAlso ensure that the group's contentInsets (%@) leave space for its subitems after being applied to the group's effective size (%@)."), v172, v173);

      }
      objc_msgSend(v283, "_externalDescription");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "appendFormat:", CFSTR("\nGroup: %@"), v174);

      v175 = [_UICollectionLayoutItemSolverState alloc];
      v176 = -[_UICollectionLayoutItemSolverState initWithSolutionFrames:itemFrameCount:supplementaryFrameCount:solvedFittingFrame:preferredSizeGroupingRanges:additionalOffsetForOutermostGroup:errorDescription:](v175, MEMORY[0x1E0C9AA60], 0, 0, MEMORY[0x1E0C9AA60], v167, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      objc_storeStrong(v273, v176);

    }
    else
    {
      v265 = *(_QWORD *)(a1 + 80);
      objc_msgSend(v283, "subitems");
      v285 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = fabs(v270);
      v326 = v99;
      v336 = 0x1000000;
      v327 = v265;
      v328 = 0u;
      v329 = 0u;
      v330 = 0u;
      v331 = (id *)objc_opt_new();
      v332 = (void *)objc_opt_new();
      v333 = (id)objc_opt_new();
      v103 = v271;
      v334 = v103;
      v335 = (id)objc_opt_new();
      v337 = 0;
      do
      {
        if (!BYTE3(v336) || v327 < 1)
          break;
        objc_msgSend(v285, "objectAtIndexedSubscript:", (_QWORD)v330);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = [_UICollectionLayoutItemSolver alloc];
        v291 = v105;
        if (v106)
          obj = -[_UICollectionLayoutItemSolver initWithItem:supplementaryEnroller:container:layoutAxis:traitCollection:maxFrameCount:layoutRTL:preferredSizes:solverResult:solutionRecursionDepth:](v106, v105, v62, 0, 0, 0, 0, 0, 0, 0, 0);
        else
          obj = 0;
        -[_UICollectionPreferredSizes preferredSizesApplyingFrameOffset:supplementaryBaseOffsets:](*(_QWORD **)(a1 + 56), *((uint64_t *)&v330 + 1), v331);
        v107 = objc_claimAutoreleasedReturnValue();
        -[_UICollectionLayoutItemSolver _solveForContainer:layoutAxis:traitCollection:maxFrameCount:layoutRTL:preferredSizes:largestKnownItemSize:solutionRecursionDepth:](obj, v334, v280, v284, v327, v281 != 0, v107, *(_QWORD *)(a1 + 72) + 1, *(double *)(a1 + 96), *(double *)(a1 + 104));
        v289 = (id)v107;
        -[_UICollectionLayoutItemSolver errorDescription](obj);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = v108 == 0;

        if (v109)
        {
          objc_msgSend(v291, "layoutSize");
          v279 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = objc_msgSend(v279, "_containerSizeDependentAxes");
          v115 = obj;
          if (obj)
          {
            v115 = obj[6];
            if (v115)
              v115 = (_QWORD *)v115[7];
          }
          if ((uint64_t)v115 >= v327)
            v115 = (_QWORD *)v327;
          v276 = v114 & v286;
          v277 = v115;
          v117 = (v114 & v286) == v286 && BYTE2(v336) == 0;
          if (v102 >= 2.22044605e-16 && objc_msgSend(v335, "count") && !v117)
            v326 = v326 - v270;
          -[_UICollectionLayoutItemSolver layoutFrame]((uint64_t)obj);
          v121 = _UISizeValueForAxis(v286, v119, v120);
          v326 = v326 - v121;
          v122 = obj;
          if (obj)
            v122 = (id *)obj[2];
          v123 = v122;
          objc_msgSend(v123, "edgeSpacing");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "edgeOutsets");
          v126 = v125;
          v128 = v127;
          v130 = v129;
          v132 = v131;

          v133 = _UITotalEdgeDimensionsForLayoutAxis(v286, v126, v128, v130, v132);
          v134 = v326 - v133;
          v326 = v134;
          if (v278 <= 0)
          {
            if (v134 >= -0.25)
              v140 = 1;
            else
              v140 = v272;
            BYTE3(v336) = v140;
            if ((v140 & 1) == 0)
            {
              v141 = objc_msgSend(v335, "count");
              if (!obj || v141 || !*((_BYTE *)obj + 9))
                goto LABEL_92;
              BYTE3(v336) = 1;
            }
          }
          else
          {
LABEL_92:
            if (!BYTE3(v336))
            {
              if (!objc_msgSend(v335, "count"))
              {
                v135 = (void *)MEMORY[0x1E0CB3940];
                v354.height = v268;
                v354.width = v269;
                NSStringFromCGSize(v354);
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v283, "_externalDescription");
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v135, "stringWithFormat:", CFSTR("NSCollectionLayoutItem created with invalid combination of spacing and size specified. This group cannot fit even a single item. Inspect the spacing and size of the items in this group and ensure that they fit into the group when its effective size is %@.\nGroup: %@"), v136, v137);
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                v139 = v337;
                v337 = v138;

                v113 = 9;
                goto LABEL_135;
              }
LABEL_128:
              v113 = 0;
              if (!WORD1(v336) && BYTE1(v336) && v102 >= 2.22044605e-16)
              {
                if ((unint64_t)objc_msgSend(v335, "count") < 2)
                {
                  v113 = 0;
                }
                else
                {
                  v160 = _UISetSizeValueForAxis(v286, v267, v266, -v270 * (double)(unint64_t)(objc_msgSend(v335, "count") - 1));
                  v136 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:]([_UICollectionLayoutContainer alloc], v269 + v160, v268 + v161, 0.0, 0.0, 0.0, 0.0);
                  v326 = v99;
                  v327 = v265;
                  v328 = 0u;
                  v329 = 0u;
                  v330 = 0u;
                  if (v331)
                    objc_msgSend(v331[1], "removeAllObjects");
                  objc_msgSend(v332, "removeAllObjects");
                  objc_msgSend(v333, "removeAllIndexes");
                  objc_storeStrong((id *)&v334, v136);
                  objc_msgSend(v335, "removeAllObjects");
                  LODWORD(v336) = 0x1000000;
                  v162 = v337;
                  v337 = 0;

                  v113 = 0;
                  BYTE2(v336) = 1;
LABEL_135:

                }
              }

              goto LABEL_142;
            }
          }
          v142 = [_UICollectionSolutionGroupArrangementItem alloc];
          if (v142
            && (buf.receiver = v142,
                buf.super_class = (Class)_UICollectionSolutionGroupArrangementItem,
                v143 = (id *)objc_msgSendSuper2(&buf, sel_init),
                (v144 = v143) != 0))
          {
            objc_storeStrong(v143 + 1, obj);
            v145 = -[_UICollectionLayoutItemSolver layoutFrame]((uint64_t)obj);
            v146 = v144;
            *((double *)v144 + 2) = v145;
            v144[3] = v147;
            v144[4] = v148;
            v144[5] = v149;
          }
          else
          {
            v146 = 0;
          }
          v275 = v146;
          objc_msgSend(v335, "addObject:");
          v324 = 0u;
          v325 = 0u;
          v322 = 0u;
          v323 = 0u;
          -[_UICollectionLayoutItemSolver preferredSizeGroupingRanges](obj);
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v322, v350, 16);
          if (v151)
          {
            v152 = *(_QWORD *)v323;
            do
            {
              for (i = 0; i != v151; ++i)
              {
                if (*(_QWORD *)v323 != v152)
                  objc_enumerationMutation(v150);
                v154 = objc_msgSend(*(id *)(*((_QWORD *)&v322 + 1) + 8 * i), "rangeValue");
                v155 = v332;
                objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", (_QWORD)v328 + v154, v156);
                v157 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v155, "addObject:", v157);

              }
              v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v322, v350, 16);
            }
            while (v151);
          }

          if ((objc_msgSend(v291, "isGroup") & 1) == 0)
          {
            objc_msgSend(v333, "addIndex:", objc_msgSend(v335, "count") - 1);
            if (!(_BYTE)v336)
              LOBYTE(v336) = objc_msgSend(v279, "_axesUniformAcrossSiblings") != 0;
          }
          if (!BYTE1(v336))
            BYTE1(v336) = v276 == v286;
          *(_QWORD *)&v330 = v330 + 1;
          v158 = v330;
          if (v158 >= objc_msgSend(v285, "count"))
          {
            *(_QWORD *)&v330 = 0;
            ++*((_QWORD *)&v329 + 1);
          }
          *((_QWORD *)&v330 + 1) += v277;
          v327 -= (uint64_t)v277;
          *(_QWORD *)&v328 = (char *)v277 + v328;
          v159 = obj;
          if (obj)
          {
            v159 = (id *)obj[6];
            if (v159)
              v159 = (id *)v159[8];
          }
          *((_QWORD *)&v328 + 1) += v159;
          if (v278 < 1)
          {
            v163 = v272;
            if (*((uint64_t *)&v329 + 1) <= 0)
              v163 = 0;
            if (v163 == 1)
LABEL_126:
              BYTE3(v336) = 0;
          }
          else
          {
            *(_QWORD *)&v329 = v329 + 1;
            if ((uint64_t)v329 >= v278)
              goto LABEL_126;
          }

          goto LABEL_128;
        }
        if (!obj)
        {
          v111 = 0;
LABEL_146:
          v112 = 0;
          goto LABEL_71;
        }
        v110 = obj[6];
        v111 = v110;
        if (!v110)
          goto LABEL_146;
        v112 = (void *)*((_QWORD *)v110 + 10);
LABEL_71:
        objc_storeStrong(&v337, v112);

        BYTE3(v336) = 0;
        v113 = 9;
LABEL_142:

      }
      while (!v113);
      if ((_BYTE)v336)
      {
        v177 = v333;
        buf.receiver = (id)MEMORY[0x1E0C809B0];
        buf.super_class = (Class)3254779904;
        v319 = (uint64_t)__44___UICollectionLayoutItemSolver__solveGroup__block_invoke;
        v320 = &__block_descriptor_152_e8_32n41_8_8_t0w64_s64_s72_s80_s88_s96_t104w4_s112_e24_v32__0__NSRange_QQ_8_B24l;
        __copy_constructor_8_8_t0w64_s64_s72_s80_s88_s96_t104w4_s112((uint64_t)v321, (id *)&v326);
        objc_msgSend(v177, "enumerateRangesUsingBlock:", &buf);
        __destructor_8_s64_s72_s80_s88_s96_s112((id *)v321);
      }
      if (v296 || *(_QWORD *)(a1 + 72))
      {
        v179 = *MEMORY[0x1E0C9D538];
        v178 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        goto LABEL_158;
      }
      objc_msgSend(v283, "edgeSpacing");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v237, "_hasSpacing") & 1) != 0 && (unint64_t)(v280 - 1) < 2)
      {
        v238 = MEMORY[0x1E0C809B0];
        aBlock = MEMORY[0x1E0C809B0];
        v344 = 3221225472;
        v345 = __107___UICollectionLayoutItemSolver__outerContainerOffsetForGroup_groupComputedSize_container_outerLayoutAxis___block_invoke;
        v346 = &unk_1E16B8EA0;
        v347 = v274;
        v348 = v73;
        v349 = v75;
        objb = (double (**)(id, uint64_t))_Block_copy(&aBlock);
        *(CGFloat *)v341 = v238;
        *(_QWORD *)&v341[8] = 3221225472;
        *(_QWORD *)&v341[16] = __107___UICollectionLayoutItemSolver__outerContainerOffsetForGroup_groupComputedSize_container_outerLayoutAxis___block_invoke_2;
        *(_QWORD *)&v341[24] = &unk_1E16B8EC8;
        v239 = v237;
        *(_QWORD *)&v341[32] = v239;
        v240 = (uint64_t (**)(void *, uint64_t))_Block_copy(v341);
        v340.a = v238;
        *(_QWORD *)&v340.b = 3221225472;
        *(_QWORD *)&v340.c = __107___UICollectionLayoutItemSolver__outerContainerOffsetForGroup_groupComputedSize_container_outerLayoutAxis___block_invoke_3;
        *(_QWORD *)&v340.d = &unk_1E16B8EF0;
        v241 = v239;
        *(_QWORD *)&v340.tx = v241;
        v242 = (void (**)(void *, uint64_t))_Block_copy(&v340);
        if (v280 == (char *)1)
          v243 = 2;
        else
          v243 = v280 == (char *)2;
        v244 = v240[2](v240, v243);
        v245 = objb[2](objb, v243);
        v242[2](v242, v243);
        if (v244 < 1)
          v247 = 0.0;
        else
          v247 = (v245 - v246) / (double)v244;
        if (v280 == (char *)2)
        {
          objc_msgSend(v241, "top");
          v256 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v256, "spacing");
          v178 = v257;

          objc_msgSend(v241, "leading");
          v254 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v254, "spacing");
          v259 = v258;
          objc_msgSend(v241, "leading");
          v260 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v260, "isFlexibleSpacing"))
            v247 = 0.0;

          v179 = v259 + v247;
LABEL_247:

        }
        else
        {
          if (v280 == (char *)1)
          {
            objc_msgSend(v241, "top");
            v248 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v248, "spacing");
            v250 = v249;
            objc_msgSend(v241, "top");
            v251 = (void *)objc_claimAutoreleasedReturnValue();
            v252 = objc_msgSend(v251, "isFlexibleSpacing");

            objc_msgSend(v241, "leading");
            v253 = (void *)objc_claimAutoreleasedReturnValue();
            v254 = v253;
            if (!v252)
              v247 = 0.0;
            objc_msgSend(v253, "spacing");
            v179 = v255;
            v178 = v250 + v247;
            goto LABEL_247;
          }
          v179 = *MEMORY[0x1E0C9D538];
          v178 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        }

      }
      else
      {
        v179 = *MEMORY[0x1E0C9D538];
        v178 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      }

LABEL_158:
      v180 = v335;
      objc_msgSend(v283, "interItemSpacing");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UICollectionLayoutItemSolver _arrangeSolutionItems:alongLayoutAxis:forContainer:additionalLayoutOffset:interItemSpacing:](v180, v286, v103, v181, v179, v178);

      v316 = 0u;
      v317 = 0u;
      v314 = 0u;
      v315 = 0u;
      v182 = v335;
      v183 = objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v314, &aBlock, 16);
      if (v183)
      {
        v184 = *(_QWORD *)v315;
        do
        {
          for (j = 0; j != v183; ++j)
          {
            if (*(_QWORD *)v315 != v184)
              objc_enumerationMutation(v182);
            v342 = *(_QWORD *)(*((_QWORD *)&v314 + 1) + 8 * j);
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v342, 1);
            v186 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UICollectionLayoutItemSolver _arrangeSolutionItems:alongLayoutAxis:forContainer:additionalLayoutOffset:interItemSpacing:](v186, v65, v103, 0, v179, v178);

          }
          v183 = objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v314, &aBlock, 16);
        }
        while (v183);
      }

      if (v281 && (objc_msgSend(v283, "ignoresRTL") & 1) == 0)
      {
        v187 = v335;
        if ((objc_msgSend(*(id *)(a1 + 16), "isGroup") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v264 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v264, "handleFailureInMethod:object:file:lineNumber:description:", sel__transformGroupArrangementItemsForRTL_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.item.isGroup"));

        }
        if ((objc_msgSend(*(id *)(a1 + 16), "ignoresRTL") & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "displayScale");
          v189 = v188;
          objc_msgSend(*(id *)(a1 + 16), "size");
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v190, "_effectiveSizeForContainer:displayScale:ignoringInsets:", *(_QWORD *)(a1 + 24), 0, v189);
          v192 = v191;

          memset(&v340, 0, sizeof(v340));
          CGAffineTransformMakeTranslation(&v340, v192, 0.0);
          memset(&v339, 0, sizeof(v339));
          *(CGAffineTransform *)v341 = v340;
          CGAffineTransformScale(&v339, (CGAffineTransform *)v341, -1.0, 1.0);
          objc_msgSend(*(id *)(a1 + 16), "isCustomGroup");
          *(_QWORD *)v341 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&v341[8] = 3221225472;
          *(_QWORD *)&v341[16] = __71___UICollectionLayoutItemSolver__transformGroupArrangementItemsForRTL___block_invoke;
          *(_QWORD *)&v341[24] = &__block_descriptor_80_e58_v32__0___UICollectionSolutionGroupArrangementItem_8Q16_B24l;
          *(CGAffineTransform *)&v341[32] = v339;
          objc_msgSend(v187, "enumerateObjectsUsingBlock:", v341);
        }
      }
      v282 = (id *)-[_UICollectionLayoutAuxillaryItemSolver initWithAuxillaryHost:]([_UICollectionLayoutAuxillaryItemSolver alloc], (void *)a1);
      -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](v282);
      v287 = (void *)objc_claimAutoreleasedReturnValue();
      v193 = objc_msgSend(v287, "count");
      *((_QWORD *)&v328 + 1) += v193;
      if (!v296)
      {
        v312 = 0u;
        v313 = 0u;
        v310 = 0u;
        v311 = 0u;
        v194 = v287;
        v195 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v310, v341, 16);
        if (v195)
        {
          v196 = *(_QWORD *)v311;
          do
          {
            for (k = 0; k != v195; ++k)
            {
              if (*(_QWORD *)v311 != v196)
                objc_enumerationMutation(v194);
              v198 = *(_QWORD **)(*((_QWORD *)&v310 + 1) + 8 * k);
              if (v198)
                v198 = (_QWORD *)v198[6];
              v199 = v198;
              -[_UICollectionLayoutSupplementaryEnroller commitEnrollment:]((uint64_t)v62, (uint64_t)v199);

            }
            v195 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v310, v341, 16);
          }
          while (v195);
        }

      }
      obja = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v287);
      v308 = 0u;
      v309 = 0u;
      v306 = 0u;
      v307 = 0u;
      v290 = v335;
      v200 = objc_msgSend(v290, "countByEnumeratingWithState:objects:count:", &v306, &v340, 16);
      x = *MEMORY[0x1E0C9D648];
      y = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
      if (v200)
      {
        v292 = *(_QWORD *)v307;
        do
        {
          v205 = 0;
          do
          {
            if (*(_QWORD *)v307 != v292)
              objc_enumerationMutation(v290);
            v206 = *(_QWORD *)(*((_QWORD *)&v306 + 1) + 8 * v205);
            if (v206)
            {
              v207 = *(id *)(v206 + 8);
              v208 = *(double *)(v206 + 16);
              v209 = *(double *)(v206 + 24);
            }
            else
            {
              v207 = 0;
              v209 = 0.0;
              v208 = 0.0;
            }
            -[_UICollectionLayoutItemSolver queryFramesApplyingFrameOffset:]((uint64_t)v207, v208, v209);
            v210 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(obja, "addObjectsFromArray:", v210);
            if (!v296)
            {
              v304 = 0u;
              v305 = 0u;
              v302 = 0u;
              v303 = 0u;
              v211 = v210;
              v212 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v302, &v339, 16);
              if (v212)
              {
                v213 = *(_QWORD *)v303;
                do
                {
                  for (m = 0; m != v212; ++m)
                  {
                    if (*(_QWORD *)v303 != v213)
                      objc_enumerationMutation(v211);
                    v215 = *(_QWORD *)(*((_QWORD *)&v302 + 1) + 8 * m);
                    if (v215 && (*(_QWORD *)(v215 + 32) & 0xFFFFFFFFFFFFFFFELL) == 2)
                    {
                      v216 = *(id *)(v215 + 48);
                      -[_UICollectionLayoutSupplementaryEnroller commitEnrollment:]((uint64_t)v62, (uint64_t)v216);

                    }
                  }
                  v212 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v302, &v339, 16);
                }
                while (v212);
              }

            }
            if (v206)
            {
              v217 = *(_QWORD *)(v206 + 16);
              v218 = *(_QWORD *)(v206 + 24);
              v219 = *(_QWORD *)(v206 + 32);
              v220 = *(_QWORD *)(v206 + 40);
            }
            else
            {
              v218 = 0;
              v219 = 0;
              v220 = 0;
              v217 = 0;
            }
            v359.origin.x = x;
            v359.origin.y = y;
            v359.size.width = width;
            v359.size.height = height;
            v360 = CGRectUnion(v359, *(CGRect *)&v217);
            x = v360.origin.x;
            y = v360.origin.y;
            width = v360.size.width;
            height = v360.size.height;

            ++v205;
          }
          while (v205 != v200);
          v221 = objc_msgSend(v290, "countByEnumeratingWithState:objects:count:", &v306, &v340, 16);
          v200 = v221;
        }
        while (v221);
      }

      if (!v296)
      {
        v222 = -[_UICollectionLayoutItemSolver _additionalDimensionForRequiredEdgeSpacingAlongAxis:group:trailingEdgeOnly:](*(_QWORD *)(a1 + 72), v280, v283, 1);
        v223 = _UISetSizeValueForAxis((uint64_t)v280, v267, v266, v222);
        v225 = v224;
        -[_UICollectionLayoutSupplementaryEnroller pruneUncommittedEnrollments]((uint64_t)v62);
        width = width + v223;
        height = height + v225;
      }
      v300 = 0u;
      v301 = 0u;
      v298 = 0u;
      v299 = 0u;
      v226 = obja;
      v227 = objc_msgSend(v226, "countByEnumeratingWithState:objects:count:", &v298, v338, 16);
      if (v227)
      {
        v228 = 0;
        v229 = *(_QWORD *)v299;
        do
        {
          for (n = 0; n != v227; ++n)
          {
            if (*(_QWORD *)v299 != v229)
              objc_enumerationMutation(v226);
            v231 = *(_QWORD *)(*((_QWORD *)&v298 + 1) + 8 * n);
            if (v231)
            {
              v232 = *(_QWORD *)(v231 + 32);
              if (v232 == 1)
              {
                v233 = v228++;
LABEL_221:
                *(_QWORD *)(v231 + 16) = v233;
                continue;
              }
              if (!v296 && (v232 & 0xFFFFFFFFFFFFFFFELL) == 2)
              {
                v234 = *(id *)(v231 + 48);
                v233 = -[_UICollectionLayoutSupplementaryEnroller kindIndexForEnrollmentIdentifier:]((uint64_t)v62, (uint64_t)v234);

                goto LABEL_221;
              }
            }
          }
          v227 = objc_msgSend(v226, "countByEnumeratingWithState:objects:count:", &v298, v338, 16);
        }
        while (v227);
      }

      v235 = [_UICollectionLayoutItemSolverState alloc];
      v236 = -[_UICollectionLayoutItemSolverState initWithSolutionFrames:itemFrameCount:supplementaryFrameCount:solvedFittingFrame:preferredSizeGroupingRanges:additionalOffsetForOutermostGroup:errorDescription:](v235, v226, (void *)v328, *((void **)&v328 + 1), v332, v337, x, y, width, height, v179, v178);
      -[_UICollectionLayoutItemSolver setSolveResult:](a1, v236);

      __destructor_8_s64_s72_s80_s88_s96_s112((id *)&v326);
    }

LABEL_226:
    v24 = v273;
LABEL_227:
    if (*v24)
    {
      objc_msgSend(*(id *)(a1 + 16), "size");
      v297 = (id)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(a1 + 40) = objc_msgSend(v297, "_containerSizeDependentAxes");

    }
  }
}

- (double)layoutFrame
{
  void *v2;
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  double *v11;
  double v12;
  void *v13;
  double v14;
  void *v16;
  void *v17;

  if (a1)
  {
    v2 = *(void **)(a1 + 16);
    v3 = (id)objc_msgSend(v2, "size");
    v4 = *(_QWORD *)(a1 + 24);
    objc_msgSend(*(id *)(a1 + 32), "displayScale");
    objc_msgSend(v3, "_effectiveSizeForContainer:displayScale:ignoringInsets:", v4, 0);
    v6 = v5;
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 48);
    if (v9 && objc_msgSend(v3, "isEstimated"))
    {
      if (objc_msgSend(v2, "isGroup"))
      {
        +[_UICollectionPreferredSize preferredSizeForOriginalSize:fittingSize:layoutSize:](v6, v8, *(double *)(v9 + 120), (uint64_t)_UICollectionPreferredSize, v3);
      }
      else
      {
        -[_UICollectionLayoutItemSolverState itemFrames]((_QWORD *)v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count") != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "_externalDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel_layoutFrame, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 411, CFSTR("Compositional Layout internal error: Unexpectedly found more than one item frame when computing the layout frame for item %@. Solve result: %@"), v17, v9);

        }
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v11 = (double *)objc_claimAutoreleasedReturnValue();
        if (v11)
          v12 = v11[10];
        else
          v12 = 0.0;
        +[_UICollectionPreferredSize preferredSizeForOriginalSize:fittingSize:layoutSize:](v6, v8, v12, (uint64_t)_UICollectionPreferredSize, v3);

      }
    }
    if (!*(_QWORD *)(a1 + 72))
    {
      if (objc_msgSend(v2, "isGroup"))
      {
        v13 = *(void **)(a1 + 88);
        v14 = -[_UICollectionLayoutItemSolver _additionalDimensionForRequiredEdgeSpacingAlongAxis:group:trailingEdgeOnly:](*(_QWORD *)(a1 + 72), v13, v2, 0);
        if (fabs(v14) >= 2.22044605e-16)
          _UISetSizeValueForAxis((uint64_t)v13, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v14);
      }
    }
  }
  return 0.0;
}

- (double)_additionalDimensionForRequiredEdgeSpacingAlongAxis:(void *)a3 group:(char)a4 trailingEdgeOnly:
{
  double v4;
  id v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;

  v4 = 0.0;
  if (!a1)
  {
    v7 = (id)objc_msgSend(a3, "edgeSpacing");
    if (objc_msgSend(v7, "_hasSpacing"))
    {
      if (a2 == (void *)2)
      {
        if ((a4 & 1) == 0)
        {
          objc_msgSend(v7, "top");
          a2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a2, "spacing");
          v4 = v10;
        }
        objc_msgSend(v7, "bottom");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a2 != (void *)1)
          return v4;
        if ((a4 & 1) == 0)
        {
          objc_msgSend(v7, "leading");
          a2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a2, "spacing");
          v4 = v8;
        }
        objc_msgSend(v7, "trailing");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v11 = v9;
      objc_msgSend(v9, "spacing");
      v4 = v4 + v12;

      if ((a4 & 1) == 0)
    }
  }
  return v4;
}

- (id)initWithItem:(void *)a3 supplementaryEnroller:(void *)a4 container:(void *)a5 layoutAxis:(void *)a6 traitCollection:(void *)a7 maxFrameCount:(char)a8 layoutRTL:(void *)a9 preferredSizes:(void *)a10 solverResult:(void *)a11 solutionRecursionDepth:
{
  id *v18;
  id *v19;
  __int128 v20;
  objc_super v22;

  if (!a1)
    return 0;
  v22.receiver = a1;
  v22.super_class = (Class)_UICollectionLayoutItemSolver;
  v18 = (id *)objc_msgSendSuper2(&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong(v18 + 2, a2);
    objc_storeStrong(v19 + 8, a3);
    objc_storeStrong(v19 + 3, a4);
    v19[11] = a5;
    objc_storeStrong(v19 + 4, a6);
    v19[10] = a7;
    *((_BYTE *)v19 + 8) = a8;
    objc_storeStrong(v19 + 7, a9);
    objc_storeStrong(v19 + 6, a10);
    v19[9] = a11;
    v20 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *((_OWORD *)v19 + 7) = *MEMORY[0x1E0C9D628];
    *((_OWORD *)v19 + 8) = v20;
  }
  return v19;
}

- (_QWORD)errorDescription
{
  _QWORD *v1;

  if (a1)
  {
    v1 = (_QWORD *)a1[6];
    if (v1)
      v1 = (_QWORD *)v1[10];
    a1 = v1;
  }
  return a1;
}

- (id)queryFramesApplyingFrameOffset:(double)a3
{
  uint64_t v4;
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
    {
      if (*MEMORY[0x1E0C9D538] == a2 && *(double *)(MEMORY[0x1E0C9D538] + 8) == a3)
      {
        v8 = *(id *)(v4 + 48);
      }
      else
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v9 = *(_QWORD **)(a1 + 48);
        if (v9)
          v9 = (_QWORD *)v9[6];
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14);
              if (v15)
              {
                v16 = *(void **)(v15 + 16);
                v17 = *(void **)(v15 + 48);
              }
              else
              {
                v16 = 0;
                v17 = 0;
              }
              v18 = v17;
              v19 = -[_UICollectionLayoutFramesQueryResult copyWithOffset:index:supplementaryEnrollmentIdentifier:]((id *)v15, v16, v18, a2, a3);

              objc_msgSend(v8, "addObject:", v19, (_QWORD)v22);
              ++v14;
            }
            while (v12 != v14);
            v20 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
            v12 = v20;
          }
          while (v20);
        }

      }
    }
    else
    {
      v8 = (id)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (int64_t)auxillaryHostAuxillaryKind
{
  if (self)
    self = (_UICollectionLayoutItemSolver *)self->_item;
  if (-[_UICollectionLayoutItemSolver isGroup](self, "isGroup"))
    return 3;
  else
    return 4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryEnroller, 0);
  objc_storeStrong((id *)&self->_preferredSizes, 0);
  objc_storeStrong((id *)&self->_solveResult, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (uint64_t)_layoutAxisForGroup:(uint64_t)a1
{
  uint64_t v2;
  id v4;
  void *v6;

  v2 = a1;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel__layoutAxisForGroup_, v2, CFSTR("_UICollectionLayoutItemSolver.m"), 1131, CFSTR("Must be an item group."));

    }
    if (objc_msgSend(a2, "isGroup"))
    {
      v4 = a2;
      if ((objc_msgSend(v4, "isVerticalGroup") & 1) != 0)
      {
        v2 = 2;
      }
      else if ((objc_msgSend(v4, "isHorizontalGroup") & 1) != 0)
      {
        v2 = 1;
      }
      else if (objc_msgSend(v4, "isCustomGroup"))
      {
        v2 = 2;
      }
      else
      {
        v2 = 0;
      }

    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (void)_solveSingleItemWithPreferredSize:(double)a3 groupMaxItemSize:(double)a4
{
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
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
  double v28;
  double v29;
  double v30;
  BOOL v31;
  void *v32;
  void *v33;
  id *v34;
  void *v35;
  id v36;
  _UICollectionLayoutFramesQueryResult *v37;
  id *v38;
  _UICollectionLayoutItemSolverState *v39;
  void *v40;
  id *v41;
  void *v42;
  id v43;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "displayScale");
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 16), "size");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_effectiveSizeForContainer:displayScale:ignoringInsets:", *(_QWORD *)(a1 + 24), 0, v9);
    v12 = v11;
    v14 = v13;

    if (a2)
    {
      v15 = -[_UICollectionPreferredSize fittingSize](a2);
      objc_msgSend(*(id *)(a1 + 16), "size");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = +[_UICollectionPreferredSize preferredSizeForOriginalSize:fittingSize:layoutSize:](v12, v14, v15, (uint64_t)_UICollectionPreferredSize, v16);
      v14 = v17;

    }
    objc_msgSend(*(id *)(a1 + 16), "layoutSize");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "_axesUniformAcrossSiblings");

    if ((v19 & (a3 > 0.0)) != 0)
      v20 = a3;
    else
      v20 = v12;
    if (((a4 > 0.0) & (v19 >> 1)) != 0)
      v21 = a4;
    else
      v21 = v14;
    if (v19)
    {
      v14 = v21;
      v22 = v20;
    }
    else
    {
      v22 = v12;
    }
    objc_msgSend(*(id *)(a1 + 16), "_effectiveContentInsets", v20, v21);
    v24 = v23 + 0.0;
    v26 = v22 - (v25 + v23);
    v28 = v27 + 0.0;
    *(double *)(a1 + 112) = v23 + 0.0;
    *(double *)(a1 + 120) = v27 + 0.0;
    v30 = v14 - (v27 + v29);
    *(double *)(a1 + 128) = v26;
    *(double *)(a1 + 136) = v30;
    if (a2)
      v31 = *(_BYTE *)(a2 + 48) != 0;
    else
      v31 = 0;
    *(_BYTE *)(a1 + 9) = v31;
    v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend((id)a1, "auxillaryHostAuxillaryItems");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "count");

    if (v33)
    {
      v34 = (id *)-[_UICollectionLayoutAuxillaryItemSolver initWithAuxillaryHost:]([_UICollectionLayoutAuxillaryItemSolver alloc], (void *)a1);
      -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](v34);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v35 = (void *)MEMORY[0x1E0C9AA60];
    if (v33)
      v35 = v33;
    v36 = v35;

    objc_msgSend(v43, "addObjectsFromArray:", v36);
    v37 = [_UICollectionLayoutFramesQueryResult alloc];
    if (v37)
      v38 = -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)&v37->super.isa, 0, 0, (void *)0x7FFFFFFFFFFFFFFFLL, (void *)1, *(void **)(a1 + 16), 0, 0, v24, v28, v26, v30);
    else
      v38 = 0;
    objc_msgSend(v43, "addObject:", v38);
    v39 = [_UICollectionLayoutItemSolverState alloc];
    v40 = (void *)objc_msgSend(v36, "count");
    v41 = -[_UICollectionLayoutItemSolverState initWithSolutionFrames:itemFrameCount:supplementaryFrameCount:solvedFittingFrame:preferredSizeGroupingRanges:additionalOffsetForOutermostGroup:errorDescription:](v39, v43, (void *)1, v40, MEMORY[0x1E0C9AA60], 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    v42 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v41;

  }
}

- (unint64_t)auxillaryHostLayoutAxis
{
  NSCollectionLayoutItem *item;
  char v5;

  if (self)
  {
    if (-[NSCollectionLayoutItem isGroup](self->_item, "isGroup"))
    {
      item = self->_item;
      return -[_UICollectionLayoutItemSolver _layoutAxisForGroup:]((uint64_t)self, item);
    }
  }
  else
  {
    v5 = objc_msgSend(0, "isGroup");
    item = 0;
    if ((v5 & 1) != 0)
      return -[_UICollectionLayoutItemSolver _layoutAxisForGroup:]((uint64_t)self, item);
  }
  return 0;
}

- (id)auxillaryHostTraitCollection
{
  if (self)
    self = (_UICollectionLayoutItemSolver *)self->_traitCollection;
  return self;
}

- (id)auxillaryHostSupplementaryEnroller
{
  _UICollectionLayoutSupplementaryEnroller *supplementaryEnroller;
  void *v6;
  void *v7;

  if (!self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("_UICollectionLayoutItemSolver.m"), 1594, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.supplementaryEnroller"));

    goto LABEL_7;
  }
  supplementaryEnroller = self->_supplementaryEnroller;
  if (!supplementaryEnroller)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutItemSolver.m"), 1594, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.supplementaryEnroller"));

    if (self)
    {
      supplementaryEnroller = self->_supplementaryEnroller;
      return supplementaryEnroller;
    }
LABEL_7:
    supplementaryEnroller = 0;
  }
  return supplementaryEnroller;
}

- (BOOL)auxillaryHostShouldLayoutRTL
{
  if (self)
    LOBYTE(self) = self->_layoutRTL;
  return (char)self;
}

- (id)auxillaryHostPreferredSizes
{
  if (self)
    self = (_UICollectionLayoutItemSolver *)self->_preferredSizes;
  return self;
}

- (CGSize)auxillaryHostContentSize
{
  _UICollectionLayoutItemSolver *v2;
  double v3;
  double width;
  double v5;
  double height;
  unint64_t v7;
  NSObject *v8;
  NSCollectionLayoutItem *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  NSCollectionLayoutItem *item;
  NSCollectionLayoutContainer *container;
  NSCollectionLayoutItem *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  void *v25;
  uint64_t v26;
  CGSize result;

  v2 = self;
  v26 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (_UICollectionLayoutItemSolver *)self->_item;
  if (-[_UICollectionLayoutItemSolver isGroup](self, "isGroup"))
  {
    -[_UICollectionLayoutItemSolver contentFrame]((uint64_t)v2);
    width = v3;
    height = v5;
    goto LABEL_17;
  }
  if (!CGRectIsNull(v2->_uncommittedSolvedItemFrame))
  {
    width = v2->_uncommittedSolvedItemFrame.size.width;
    height = v2->_uncommittedSolvedItemFrame.size.height;
    goto LABEL_17;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      goto LABEL_12;
    v9 = v2->_item;
    -[NSCollectionLayoutItem _externalDescription](v9, "_externalDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v11;
    _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "UIKit internal bug: Solver for item %@ queried for auxiliary host content size without having solved the item. Using fallback behavior.", (uint8_t *)&v24, 0xCu);
  }
  else
  {
    v7 = auxillaryHostContentSize___s_category;
    if (!auxillaryHostContentSize___s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&auxillaryHostContentSize___s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v9 = v2->_item;
    v10 = v8;
    -[NSCollectionLayoutItem _externalDescription](v9, "_externalDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v11;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "UIKit internal bug: Solver for item %@ queried for auxiliary host content size without having solved the item. Using fallback behavior.", (uint8_t *)&v24, 0xCu);
  }

LABEL_12:
LABEL_13:
  -[_UICollectionPreferredSizes objectAtIndexedSubscript:]((uint64_t)v2->_preferredSizes, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)-[NSCollectionLayoutItem size](v2->_item, "size");
  -[UITraitCollection displayScale](v2->_traitCollection, "displayScale");
  v15 = v14;
  item = v2->_item;
  container = v2->_container;
  v18 = item;
  -[NSCollectionLayoutItem _insetSizeForContainer:displayScale:](v18, "_insetSizeForContainer:displayScale:", container, v15);
  width = v19;
  height = v20;

  if (v12)
  {
    width = -[_UICollectionPreferredSize preferredSizeForOriginalSize:layoutSize:]((uint64_t)v12, v13, width, height);
    height = v21;
  }

LABEL_17:
  v22 = width;
  v23 = height;
  result.height = v23;
  result.width = v22;
  return result;
}

- (id)auxillaryHostContainer
{
  NSCollectionLayoutContainer *v3;
  double *v4;
  char v5;
  unint64_t v6;
  NSObject *v7;
  NSCollectionLayoutItem *v8;
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  NSCollectionLayoutContainer *container;
  NSCollectionLayoutItem *v14;
  double v15;
  double width;
  double v17;
  double height;
  void *v19;
  void *v20;
  double v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!self)
  {
    v5 = objc_msgSend(0, "isGroup");
    v3 = 0;
    if ((v5 & 1) != 0)
      goto LABEL_4;
LABEL_6:
    if (!CGRectIsNull(self->_uncommittedSolvedItemFrame))
    {
      width = self->_uncommittedSolvedItemFrame.size.width;
      height = self->_uncommittedSolvedItemFrame.size.height;
LABEL_18:
      v4 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:]([_UICollectionLayoutContainer alloc], width, height, 0.0, 0.0, 0.0, 0.0);
      return v4;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        goto LABEL_13;
      v8 = self->_item;
      -[NSCollectionLayoutItem _externalDescription](v8, "_externalDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v10;
      _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "UIKit internal bug: Solver for item %@ queried for auxiliary host container without having solved the item. Using fallback behavior.", (uint8_t *)&v23, 0xCu);
    }
    else
    {
      v6 = auxillaryHostContainer___s_category;
      if (!auxillaryHostContainer___s_category)
      {
        v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v6, (unint64_t *)&auxillaryHostContainer___s_category);
      }
      v7 = *(NSObject **)(v6 + 8);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      v8 = self->_item;
      v9 = v7;
      -[NSCollectionLayoutItem _externalDescription](v8, "_externalDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v10;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "UIKit internal bug: Solver for item %@ queried for auxiliary host container without having solved the item. Using fallback behavior.", (uint8_t *)&v23, 0xCu);
    }

LABEL_13:
LABEL_14:
    -[UITraitCollection displayScale](self->_traitCollection, "displayScale");
    v12 = v11;
    container = self->_container;
    v14 = self->_item;
    -[NSCollectionLayoutItem _insetSizeForContainer:displayScale:](v14, "_insetSizeForContainer:displayScale:", container, v12);
    width = v15;
    height = v17;

    -[_UICollectionPreferredSizes objectAtIndexedSubscript:]((uint64_t)self->_preferredSizes, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[NSCollectionLayoutItem size](self->_item, "size");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      width = -[_UICollectionPreferredSize preferredSizeForOriginalSize:layoutSize:]((uint64_t)v19, v20, width, height);
      height = v21;

    }
    goto LABEL_18;
  }
  if (!-[NSCollectionLayoutItem isGroup](self->_item, "isGroup"))
    goto LABEL_6;
  v3 = self->_container;
LABEL_4:
  v4 = v3;
  return v4;
}

- (CGPoint)auxillaryHostAdditionalFrameOffset
{
  double v2;
  double v3;
  NSCollectionLayoutItem *item;
  double v6;
  double v7;
  double v8;
  double v9;
  char v10;
  CGPoint result;

  v3 = *MEMORY[0x1E0C9D538];
  v2 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (!self)
  {
    v10 = objc_msgSend(0, "isGroup");
    item = 0;
    if ((v10 & 1) != 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  if ((-[NSCollectionLayoutItem isGroup](self->_item, "isGroup") & 1) == 0)
  {
    item = self->_item;
LABEL_4:
    -[NSCollectionLayoutItem _effectiveContentInsets](item, "_effectiveContentInsets");
    v2 = v6;
    v3 = v7;
  }
LABEL_5:
  v8 = v3;
  v9 = v2;
  result.y = v9;
  result.x = v8;
  return result;
}

- (double)contentSizeForFrameCount:(uint64_t)a3 layoutAxis:
{
  uint64_t v5;
  double v7;
  double v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  double *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  unint64_t v23;
  double v25;
  double MaxX;
  double MaxY;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  if (!a1)
    return 0.0;
  if (a2 < 1)
    return *MEMORY[0x1E0C9D820];
  v5 = *(_QWORD *)(a1 + 48);
  if (!v5)
    return *MEMORY[0x1E0C9D820];
  if (*(_QWORD *)(v5 + 56) <= a2)
  {
    -[_UICollectionLayoutItemSolver contentFrame](a1);
    return v25;
  }
  else
  {
    if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", sel_contentSizeForFrameCount_layoutAxis_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 237, CFSTR("Unknown layout axis."));

    }
    -[_UICollectionLayoutItemSolver contentFrame](a1);
    v34 = v7;
    v35 = v8;
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    -[_UICollectionLayoutItemSolver itemFrames](a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v15 = 0;
      v36 = x;
      v37 = y;
      v38 = height;
      v39 = width;
      do
      {
        -[_UICollectionLayoutItemSolver itemFrames](a1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
        v17 = (double *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = v17[8];
          v19 = v17[9];
          v21 = v17[10];
          v20 = v17[11];
        }
        else
        {
          v19 = 0.0;
          v21 = 0.0;
          v20 = 0.0;
          v18 = 0.0;
        }
        v40.origin.x = x;
        v40.origin.y = y;
        v40.size.width = width;
        v40.size.height = height;
        v48.origin.x = v18;
        v48.origin.y = v19;
        v48.size.width = v21;
        v48.size.height = v20;
        v41 = CGRectUnion(v40, v48);
        x = v41.origin.x;
        y = v41.origin.y;
        width = v41.size.width;
        height = v41.size.height;
        if ((uint64_t)v15 < a2)
        {
          v42.origin.x = v36;
          v42.origin.y = v37;
          v42.size.height = v38;
          v42.size.width = v39;
          v49.origin.x = v18;
          v49.origin.y = v19;
          v49.size.width = v21;
          v49.size.height = v20;
          v43 = CGRectUnion(v42, v49);
          v36 = v43.origin.x;
          v37 = v43.origin.y;
          v38 = v43.size.height;
          v39 = v43.size.width;
        }

        ++v15;
        -[_UICollectionLayoutItemSolver itemFrames](a1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

      }
      while (v15 < v23);
    }
    else
    {
      v38 = height;
      v39 = width;
      v36 = x;
      v37 = y;
    }
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    MaxX = CGRectGetMaxX(v44);
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    MaxY = CGRectGetMaxY(v45);
    v46.origin.x = v36;
    v46.origin.y = v37;
    v46.size.width = v39;
    v46.size.height = v38;
    v28 = CGRectGetMaxX(v46);
    v47.origin.x = v36;
    v47.origin.y = v37;
    v47.size.width = v39;
    v47.size.height = v38;
    v29 = CGRectGetMaxY(v47);
    v30 = _UISizeValueForAxis(a3, MaxX, MaxY);
    v31 = _UISizeValueForAxis(a3, v28, v29) - v30;
    v32 = _UISizeValueForAxis(a3, v34, v35);
    return _UISetSizeValueForAxis(a3, v34, v35, v32 + v31);
  }
}

- (id)frameForAbsoluteIndex:(uint64_t)a3 additionalFrameOffset:(double)a4 interSolutionSpacing:(double)a5 repeatAxis:(double)a6
{
  if (a1)
  {
    -[_UICollectionLayoutItemSolver _frameForAbsoluteIndex:additionalFrameOffset:interSolutionSpacing:repeatAxis:]((uint64_t)a1, a2, a3, a4, a5, a6);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)initWithItem:(void *)a1
{
  _UICollectionLayoutSupplementaryEnroller *v4;
  id *v5;

  if (!a1)
    return 0;
  v4 = objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
  v5 = -[_UICollectionLayoutItemSolver initWithItem:supplementaryEnroller:container:layoutAxis:traitCollection:maxFrameCount:layoutRTL:preferredSizes:solverResult:solutionRecursionDepth:](a1, a2, v4, 0, 0, 0, 0, 0, 0, 0, 0);

  return v5;
}

- (id)auxillaryFrames
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    -[_UICollectionLayoutItemSolverState auxillaryFrames](*(_QWORD **)(a1 + 48));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)v1;
    v3 = (void *)MEMORY[0x1E0C9AA60];
    if (v1)
      v3 = (void *)v1;
    v4 = v3;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (_QWORD)supplementaryOffsets
{
  if (a1)
  {
    -[_UICollectionLayoutItemSolverState supplementaryFrameOffsets](a1[6]);
    a1 = (_QWORD **)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)preferredSizeGroupingRanges
{
  _QWORD *v1;

  if (a1)
  {
    v1 = (_QWORD *)a1[6];
    if (v1)
      v1 = (_QWORD *)v1[9];
    if (!v1)
      v1 = (_QWORD *)MEMORY[0x1E0C9AA60];
    a1 = v1;
  }
  return a1;
}

- (double)offsetForEdgeSpacing
{
  double *v2;
  double *v3;
  double v4;
  void *v6;
  id v7;
  void *v8;

  if (!a1)
    return 0.0;
  v2 = (double *)*(id *)(a1 + 48);
  v3 = v2;
  if (v2)
  {
    v4 = v2[11];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(id *)(a1 + 16);
    objc_msgSend(v7, "_externalDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_offsetForEdgeSpacing, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 455, CFSTR("Compositional layout internal bug: Attempting to access edge spacing offset before solving. Item: %@"), v8);

    v4 = 0.0;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSCollectionLayoutItem *v4;
  _UICollectionLayoutSupplementaryEnroller *v5;
  NSCollectionLayoutContainer *v6;
  void *layoutAxis;
  UITraitCollection *v8;
  void *maxFrameCount;
  char layoutRTL;
  _UICollectionPreferredSizes *v11;
  _UICollectionLayoutItemSolverState *v12;
  void *solutionRecursionDepth;
  id *v14;
  CGSize size;
  _UICollectionLayoutItemSolver *v17;

  v17 = +[_UICollectionLayoutItemSolver allocWithZone:](_UICollectionLayoutItemSolver, "allocWithZone:", a3);
  if (self)
  {
    v4 = self->_item;
    v5 = self->_supplementaryEnroller;
    v6 = self->_container;
    layoutAxis = (void *)self->_layoutAxis;
    v8 = self->_traitCollection;
    maxFrameCount = (void *)self->_maxFrameCount;
    layoutRTL = self->_layoutRTL;
    v11 = self->_preferredSizes;
    v12 = self->_solveResult;
    solutionRecursionDepth = (void *)self->_solutionRecursionDepth;
  }
  else
  {
    v12 = 0;
    layoutRTL = 0;
    v8 = 0;
    v6 = 0;
    v4 = 0;
    v5 = 0;
    layoutAxis = 0;
    maxFrameCount = 0;
    v11 = 0;
    solutionRecursionDepth = 0;
  }
  v14 = -[_UICollectionLayoutItemSolver initWithItem:supplementaryEnroller:container:layoutAxis:traitCollection:maxFrameCount:layoutRTL:preferredSizes:solverResult:solutionRecursionDepth:](v17, v4, v5, v6, layoutAxis, v8, maxFrameCount, layoutRTL, v11, v12, solutionRecursionDepth);

  *((_OWORD *)v14 + 6) = self->_largestKnownItemSize;
  size = self->_uncommittedSolvedItemFrame.size;
  *((_OWORD *)v14 + 7) = self->_uncommittedSolvedItemFrame.origin;
  *((CGSize *)v14 + 8) = size;
  return v14;
}

- (id)queryFramesWithItemLimit:(void *)a1
{
  if (a1)
  {
    -[_UICollectionLayoutItemSolver _queryFramesWithQueryRect:additionalFrameOffset:itemIndexOffset:supplementaryOffsets:itemLimit:]((uint64_t)a1, 0, 0, a2, *MEMORY[0x1E0C9D648], *(CGFloat *)(MEMORY[0x1E0C9D648] + 8), *(CGFloat *)(MEMORY[0x1E0C9D648] + 16), *(CGFloat *)(MEMORY[0x1E0C9D648] + 24), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)queryFramesWithQueryRect:(uint64_t)a3 additionalFrameOffset:(uint64_t)a4 itemIndexOffset:(CGFloat)a5 itemLimit:(CGFloat)a6 supplementaryRepeatOffset:(CGFloat)a7
{
  if (a1)
  {
    -[_UICollectionLayoutItemSolver _queryFramesWithQueryRect:additionalFrameOffset:itemIndexOffset:itemLimit:supplementaryRepeatOffset:]((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_queryFramesWithQueryRect:(uint64_t)a3 additionalFrameOffset:(uint64_t)a4 itemIndexOffset:(CGFloat)a5 itemLimit:(CGFloat)a6 supplementaryRepeatOffset:(CGFloat)a7
{
  id v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  double v30;
  double v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  if (!a1)
  {
    v21 = 0;
    return v21;
  }
  v20 = *(id *)(a1 + 64);
  if (v20)
  {
    if ((a3 & 0x8000000000000000) == 0)
      goto LABEL_4;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", sel__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_itemLimit_supplementaryRepeatOffset_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1323, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemLimit >= 0"));

    if ((a4 & 0x8000000000000000) == 0)
      goto LABEL_5;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_itemLimit_supplementaryRepeatOffset_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1324, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("supplementaryRepeatOffset >= 0"));

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_itemLimit_supplementaryRepeatOffset_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1322, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("supplementaryEnroller"));

  if (a3 < 0)
    goto LABEL_11;
LABEL_4:
  if (a4 < 0)
    goto LABEL_12;
LABEL_5:
  if (*(_QWORD *)(a1 + 48))
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__31;
    v38 = __Block_byref_object_dispose__31;
    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __133___UICollectionLayoutItemSolver__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_itemLimit_supplementaryRepeatOffset___block_invoke;
    v26[3] = &unk_1E16B8F80;
    v30 = a9;
    v31 = a10;
    v32 = sel__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_itemLimit_supplementaryRepeatOffset_;
    v29 = a2;
    v26[4] = a1;
    v33 = a4;
    v27 = v20;
    v28 = &v34;
    -[_UICollectionLayoutItemSolver _enumerateSolutionFramesForQueryRect:itemLimit:withHandler:](a1, a3, (uint64_t)v26, a5, a6, a7, a8);
    v21 = (id)v35[5];

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    v21 = (id)MEMORY[0x1E0C9AA60];
  }

  return v21;
}

- (id)_frameForAbsoluteIndex:(uint64_t)a3 additionalFrameOffset:(double)a4 interSolutionSpacing:(double)a5 repeatAxis:(double)a6
{
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id *v18;
  id *v19;
  void *v21;
  void *v22;

  if (!a1)
  {
    v19 = 0;
    return v19;
  }
  v12 = *(_QWORD *)(a1 + 48);
  if (!v12 || (v13 = *(_QWORD *)(v12 + 56)) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__frameForAbsoluteIndex_additionalFrameOffset_interSolutionSpacing_repeatAxis_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1436, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemCount"));

    v13 = 0;
    if ((a2 & 0x8000000000000000) == 0)
      goto LABEL_5;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", sel__frameForAbsoluteIndex_additionalFrameOffset_interSolutionSpacing_repeatAxis_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1437, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("absoluteIndex>=0"));

    goto LABEL_5;
  }
  if (a2 < 0)
    goto LABEL_8;
LABEL_5:
  v14 = -[_UICollectionLayoutItemSolver _frameOffsetForAdditionalFrameOffset:repeatOffset:repeatAxis:interSolutionSpacing:](a1, a2 / v13, a3, a4, a5, a6);
  v16 = v15;
  -[_UICollectionLayoutItemSolver itemFrames](a1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", a2 % v13);
  v18 = (id *)objc_claimAutoreleasedReturnValue();

  v19 = -[_UICollectionLayoutFramesQueryResult copyWithOffset:index:supplementaryEnrollmentIdentifier:](v18, (void *)a2, 0, v14, v16);
  return v19;
}

- (double)_frameOffsetForAdditionalFrameOffset:(uint64_t)a3 repeatOffset:(double)a4 repeatAxis:(double)a5 interSolutionSpacing:(double)a6
{
  double v10;
  double v11;
  double v12;

  if (a2)
  {
    -[_UICollectionLayoutItemSolver layoutFrame](a1);
    v12 = _UISizeValueForAxis(a3, v10, v11);
    return a4
         + _UISetPointValueForAxis(a3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), (v12 + a6) * (double)a2);
  }
  return a4;
}

- (NSString)description
{
  _UICollectionLayoutItemSolverState *solveResult;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  _UICollectionLayoutItemSolverState *v8;
  NSCollectionLayoutItem *v9;
  NSArray *solutionFrames;
  NSArray *v11;
  void *v12;
  NSCollectionLayoutItem *v13;
  NSCollectionLayoutContainer *v14;
  void *v15;
  _UICollectionLayoutItemSolverState *v16;
  int64_t itemFrameCount;
  void *v18;
  _UICollectionLayoutItemSolverState *v19;
  int64_t supplementaryFrameCount;
  void *v21;
  int64_t maxFrameCount;
  void *v23;
  void *v24;
  NSCollectionLayoutContainer *container;
  void *v27;

  if (self)
    solveResult = self->_solveResult;
  else
    solveResult = 0;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (solveResult)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    if (self)
    {
      v8 = self->_solveResult;
      v9 = (NSCollectionLayoutItem *)v8;
      if (v8)
      {
        solutionFrames = v8->_solutionFrames;
LABEL_7:
        v11 = solutionFrames;
        objc_msgSend(v7, "numberWithUnsignedInteger:", -[NSArray count](v11, "count"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v4;
        if (self)
        {
          v13 = self->_item;
          v14 = self->_container;
          v15 = (void *)MEMORY[0x1E0CB37E8];
          v16 = self->_solveResult;
          if (v16)
            itemFrameCount = v16->_itemFrameCount;
          else
            itemFrameCount = 0;
        }
        else
        {
          v14 = 0;
          v13 = 0;
          itemFrameCount = 0;
          v15 = (void *)MEMORY[0x1E0CB37E8];
        }
        objc_msgSend(v15, "numberWithInteger:", itemFrameCount);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (self && (v19 = self->_solveResult) != 0)
          supplementaryFrameCount = v19->_supplementaryFrameCount;
        else
          supplementaryFrameCount = 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", supplementaryFrameCount);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (self)
          maxFrameCount = self->_maxFrameCount;
        else
          maxFrameCount = 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", maxFrameCount);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("<%@: %p: solutionFrames=%@; item=%p; container:%@; itemCount=%@; supplementaryCount=%@; maxFrameCount:%@>"),
          v6,
          self,
          v12,
          v13,
          v14,
          v18,
          v21,
          v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      }
    }
    else
    {
      v9 = 0;
    }
    solutionFrames = 0;
    goto LABEL_7;
  }
  if (self)
  {
    v9 = self->_item;
    container = self->_container;
  }
  else
  {
    v9 = 0;
    container = 0;
  }
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p: item=%p; container=%@ (yet to be solved)>"),
    v6,
    self,
    v9,
    container);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return (NSString *)v24;
}

- (id)supplementaryFrameWithKind:(uint64_t)a3 index:(double)a4 additionalFrameOffset:(double)a5
{
  if (a1)
  {
    -[_UICollectionLayoutItemSolver _supplementaryFrameWithKind:index:additionalFrameOffset:]((uint64_t)a1, a2, a3, a4, a5);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_supplementaryFrameWithKind:(uint64_t)a3 index:(double)a4 additionalFrameOffset:(double)a5
{
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  if (!a1)
  {
    v15 = 0;
    return v15;
  }
  if (!objc_msgSend(a2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel__supplementaryFrameWithKind_index_additionalFrameOffset_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1451, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind.length"));

    if ((a3 & 0x8000000000000000) == 0)
      goto LABEL_4;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel__supplementaryFrameWithKind_index_additionalFrameOffset_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1452, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index >= 0"));

    goto LABEL_4;
  }
  if (a3 < 0)
    goto LABEL_11;
LABEL_4:
  if (!*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__supplementaryFrameWithKind_index_additionalFrameOffset_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1453, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.solveResult"));

  }
  +[_UICollectionLayoutFramesQueryResult kindIndexKeyForKind:index:]((uint64_t)_UICollectionLayoutFramesQueryResult, a2, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionLayoutItemSolverState supplementaryDictByKindIndex](*(_QWORD **)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = *(void **)(v12 + 48);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__supplementaryFrameWithKind_index_additionalFrameOffset_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1457, CFSTR("Failed to retrieve the supplementary frame for kind+index key."));

    v13 = 0;
  }
  v14 = v13;
  v15 = -[_UICollectionLayoutFramesQueryResult copyWithOffset:index:supplementaryEnrollmentIdentifier:]((id *)v12, (void *)a3, v14, a4, a5);

  return v15;
}

- (id)supplementaryFrameWithKind:(uint64_t)a3 absoluteIndex:(uint64_t)a4 additionalFrameOffset:(double)a5 interSolutionSpacing:(double)a6 repeatAxis:(double)a7
{
  if (a1)
  {
    -[_UICollectionLayoutItemSolver _supplementaryFrameWithKind:absoluteIndex:additionalFrameOffset:interSolutionSpacing:repeatAxis:]((uint64_t)a1, a2, a3, a4, a5, a6, a7);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_supplementaryFrameWithKind:(uint64_t)a3 absoluteIndex:(uint64_t)a4 additionalFrameOffset:(double)a5 interSolutionSpacing:(double)a6 repeatAxis:(double)a7
{
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  if (!a1)
  {
    v26 = 0;
    return v26;
  }
  v14 = *(_QWORD **)(a1 + 48);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", sel__supplementaryFrameWithKind_absoluteIndex_additionalFrameOffset_interSolutionSpacing_repeatAxis_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1469, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.solveResult"));

    v14 = *(_QWORD **)(a1 + 48);
  }
  -[_UICollectionLayoutItemSolverState supplementaryFrameOffsets](v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(a2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", sel__supplementaryFrameWithKind_absoluteIndex_additionalFrameOffset_interSolutionSpacing_repeatAxis_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1473, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind.length"));

  }
  objc_msgSend(v15, "rangeForElementKind:", a2);
  v17 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", sel__supplementaryFrameWithKind_absoluteIndex_additionalFrameOffset_interSolutionSpacing_repeatAxis_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1475, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kindCount"));

    if ((a3 & 0x8000000000000000) == 0)
      goto LABEL_8;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", sel__supplementaryFrameWithKind_absoluteIndex_additionalFrameOffset_interSolutionSpacing_repeatAxis_, a1, CFSTR("_UICollectionLayoutItemSolver.m"), 1476, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("absoluteIndex>=0"));

    goto LABEL_8;
  }
  if (a3 < 0)
    goto LABEL_13;
LABEL_8:
  v18 = -[_UICollectionLayoutItemSolver _frameOffsetForAdditionalFrameOffset:repeatOffset:repeatAxis:interSolutionSpacing:](a1, a3 / v17, a4, a5, a6, a7);
  v20 = v19;
  +[_UICollectionLayoutFramesQueryResult kindIndexKeyForKind:index:]((uint64_t)_UICollectionLayoutFramesQueryResult, a2, a3 % v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionLayoutItemSolverState supplementaryDictByKindIndex](*(_QWORD **)(a1 + 48));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v21);
  v23 = objc_claimAutoreleasedReturnValue();

  if (v23)
    v24 = *(void **)(v23 + 48);
  else
    v24 = 0;
  v25 = v24;
  v26 = -[_UICollectionLayoutFramesQueryResult copyWithOffset:index:supplementaryEnrollmentIdentifier:]((id *)v23, (void *)a3, v25, v18, v20);

  return v26;
}

- (CGRect)auxillaryHostPinningRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[_UICollectionLayoutItemSolver auxillaryHostContentSize](self, "auxillaryHostContentSize");
  v5 = v4;
  v7 = v6;
  v8 = v2;
  v9 = v3;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (BOOL)auxillaryHostWantsOverlapAdjustmentForMatchingAlignmentsOnly
{
  return 0;
}

@end
