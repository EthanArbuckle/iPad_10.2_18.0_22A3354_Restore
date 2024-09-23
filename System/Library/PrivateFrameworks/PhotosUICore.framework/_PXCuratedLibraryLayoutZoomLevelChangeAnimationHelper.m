@implementation _PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper

- (_PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper)initWithLayout:(id)a3
{
  id v4;
  _PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper *v5;
  PXCuratedLibraryLayoutSnapshotGeometryDescriptor *v6;
  PXCuratedLibraryLayoutSnapshotGeometryDescriptor *fromLayoutSnapshotGeometryDescriptor;
  PXCuratedLibrarySectionGeometryDescriptor *v8;
  PXCuratedLibrarySectionGeometryDescriptor *nullSectionGeometryDescriptor;
  UICoordinateSpace *v10;
  UICoordinateSpace *coordinateSpace;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper;
  v5 = -[PXCuratedLibraryLayoutAnimationHelper initWithLayout:](&v13, sel_initWithLayout_, v4);
  if (v5)
  {
    v5->_userInterfaceDirection = objc_msgSend(v4, "userInterfaceDirection");
    v6 = -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor initWithLayout:]([PXCuratedLibraryLayoutSnapshotGeometryDescriptor alloc], "initWithLayout:", v4);
    fromLayoutSnapshotGeometryDescriptor = v5->_fromLayoutSnapshotGeometryDescriptor;
    v5->_fromLayoutSnapshotGeometryDescriptor = v6;

    v8 = objc_alloc_init(PXCuratedLibrarySectionGeometryDescriptor);
    nullSectionGeometryDescriptor = v5->_nullSectionGeometryDescriptor;
    v5->_nullSectionGeometryDescriptor = v8;

    v10 = (UICoordinateSpace *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    coordinateSpace = v5->_coordinateSpace;
    v5->_coordinateSpace = v10;

  }
  return v5;
}

- (double)animationDuration
{
  void *v2;
  double v3;
  double v4;

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultZoomLevelTransitionAnimationDuration");
  v4 = v3;

  return v4;
}

- (BOOL)wantsDoubleSidedAnimations
{
  return 1;
}

- (BOOL)wantsPresentationAdjustment
{
  return 1;
}

- (unsigned)highFrameRateReason
{
  return 2228227;
}

- (id)animation:(id)a3 doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes:(id)a4 rootLayout:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8
{
  objc_class *v10;
  id v11;
  id v12;
  int64_t v13;
  id v14;
  _QWORD v16[4];
  id v17;
  const $786F7D2F4E5B3A0CBB66DF574B7D98CF *v18;
  int64_t v19;

  v10 = (objc_class *)MEMORY[0x1E0CB3788];
  v11 = a4;
  v12 = objc_alloc_init(v10);
  v13 = -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor dataSourceIdentifier](self->_fromLayoutSnapshotGeometryDescriptor, "dataSourceIdentifier");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __168___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper_animation_doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes_rootLayout_presentedGeometries_styles_infos___block_invoke;
  v16[3] = &unk_1E5120968;
  v18 = a8;
  v19 = v13;
  v14 = v12;
  v17 = v14;
  objc_msgSend(v11, "enumerateIndexesUsingBlock:", v16);

  return v14;
}

- (void)animation:(id)a3 adjustPresentedGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 count:(unsigned int)a7
{
  uint64_t v7;
  float *p_var2;
  $786F7D2F4E5B3A0CBB66DF574B7D98CF *v12;

  LODWORD(v7) = a7;
  -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor dataSourceIdentifier](self->_fromLayoutSnapshotGeometryDescriptor, "dataSourceIdentifier", a3, a4);
  -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor visibleRect](self->_fromLayoutSnapshotGeometryDescriptor, "visibleRect");
  if ((_DWORD)v7)
  {
    v7 = v7;
    p_var2 = &a5->var2;
    v12 = a6 + 1;
    do
    {
      v12 = ($786F7D2F4E5B3A0CBB66DF574B7D98CF *)((char *)v12 + 40);
      PXGSectionedSpriteTagDecompose();
      p_var2 += 40;
      --v7;
    }
    while (v7);
  }
}

- (void)animation:(id)a3 prepareWithRootLayout:(id)a4 viewportShift:(CGPoint)a5
{
  double y;
  double x;
  id v10;
  id v11;
  PXCuratedLibraryLayoutSnapshotGeometryDescriptor *v12;
  PXCuratedLibraryLayoutSnapshotGeometryDescriptor *toLayoutSnapshotGeometryDescriptor;
  void *v14;
  void *v15;
  int64_t v16;
  int64_t v17;
  void *v18;
  NSArray *v19;
  NSArray *changeDetails;
  PXVisualPositionsChangeDetails *v21;
  PXVisualPositionsChangeDetails *visualPositionsChangeDetails;
  void *v23;
  void *v24;
  void *v25;
  int64_t v26;
  PXVisualPositionsChangeDetails *v27;
  uint64_t v28;
  PXVisualPositionsChangeDetails *v29;
  uint64_t v30;
  uint64_t v31;
  PXVisualPositionsChangeDetails *v32;
  uint64_t v33;
  PXVisualPositionsChangeDetails *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  objc_class *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  int64_t v42;
  id v43;
  int64_t v44;
  uint64_t v45;
  PXVisualPositionsChangeDetails *v46;
  uint64_t v47;
  PXVisualPositionsChangeDetails *v48;

  y = a5.y;
  x = a5.x;
  v10 = a3;
  v11 = a4;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayoutAnimationHelper.m"), 385, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("rootLayout"), v39, v41);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryLayoutAnimationHelper.m"), 385, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("rootLayout"), v39);
  }

LABEL_3:
  -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor setOffset:](self->_fromLayoutSnapshotGeometryDescriptor, "setOffset:", x, y);
  v12 = -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor initWithLayout:]([PXCuratedLibraryLayoutSnapshotGeometryDescriptor alloc], "initWithLayout:", v11);
  toLayoutSnapshotGeometryDescriptor = self->_toLayoutSnapshotGeometryDescriptor;
  self->_toLayoutSnapshotGeometryDescriptor = v12;

  objc_msgSend(v11, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assetsDataSourceManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor dataSourceIdentifier](self->_fromLayoutSnapshotGeometryDescriptor, "dataSourceIdentifier");
  v17 = -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor dataSourceIdentifier](self->_toLayoutSnapshotGeometryDescriptor, "dataSourceIdentifier");
  objc_msgSend(v15, "changeHistory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v16, v17);
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  changeDetails = self->_changeDetails;
  self->_changeDetails = v19;

  objc_msgSend(v15, "visualPositionsChangeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v16, v17);
  v21 = (PXVisualPositionsChangeDetails *)objc_claimAutoreleasedReturnValue();
  visualPositionsChangeDetails = self->_visualPositionsChangeDetails;
  self->_visualPositionsChangeDetails = v21;

  self->_transitionType = objc_msgSend(v15, "transitionTypeFromDataSourceIdentifier:toDataSourceIdentifier:", v16, v17);
  objc_msgSend(v11, "spec");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  self->_shouldAlwaysFadeDecoration = objc_msgSend(v23, "userInterfaceIdiom") == 4;

  if (self->_visualPositionsChangeDetails)
  {
    -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor sections](self->_fromLayoutSnapshotGeometryDescriptor, "sections");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor sections](self->_toLayoutSnapshotGeometryDescriptor, "sections");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PXVisualPositionsChangeDetails anchorIndexBeforeChanges](self->_visualPositionsChangeDetails, "anchorIndexBeforeChanges");
    v44 = -[PXVisualPositionsChangeDetails anchorIndexAfterChanges](self->_visualPositionsChangeDetails, "anchorIndexAfterChanges");
    v42 = v26;
    v43 = v10;
    if (objc_msgSend(v24, "count"))
    {
      v27 = self->_visualPositionsChangeDetails;
      v28 = objc_msgSend(v24, "firstIndex");
      if (v27)
      {
        -[PXVisualPositionsChangeDetails visualPositionAfterApplyingChangesToIndex:](v27, "visualPositionAfterApplyingChangesToIndex:", v28);
        v27 = v48;
      }
      v29 = self->_visualPositionsChangeDetails;
      v30 = objc_msgSend(v24, "lastIndex");
      if (v29)
      {
        -[PXVisualPositionsChangeDetails visualPositionAfterApplyingChangesToIndex:](v29, "visualPositionAfterApplyingChangesToIndex:", v30);
        v31 = v47;
      }
      else
      {
        v31 = 0;
      }
      v26 = v42;
      -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor extrapolateSectionsBetween:and:withAnchorSection:](self->_toLayoutSnapshotGeometryDescriptor, "extrapolateSectionsBetween:and:withAnchorSection:", v27, v31, v44);
      v10 = v43;
    }
    if (objc_msgSend(v25, "count"))
    {
      v32 = self->_visualPositionsChangeDetails;
      v33 = objc_msgSend(v25, "firstIndex");
      if (v32)
      {
        -[PXVisualPositionsChangeDetails visualPositionAfterRevertingChangesFromIndex:](v32, "visualPositionAfterRevertingChangesFromIndex:", v33);
        v32 = v46;
      }
      v34 = self->_visualPositionsChangeDetails;
      v35 = objc_msgSend(v25, "lastIndex");
      if (v34)
      {
        -[PXVisualPositionsChangeDetails visualPositionAfterRevertingChangesFromIndex:](v34, "visualPositionAfterRevertingChangesFromIndex:", v35);
        v36 = v45;
      }
      else
      {
        v36 = 0;
      }
      v26 = v42;
      -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor extrapolateSectionsBetween:and:withAnchorSection:](self->_fromLayoutSnapshotGeometryDescriptor, "extrapolateSectionsBetween:and:withAnchorSection:", v32, v36, v42);
      v10 = v43;
    }
    -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor compactifySectionsBeyondVisibleRectWithAnchorSection:](self->_fromLayoutSnapshotGeometryDescriptor, "compactifySectionsBeyondVisibleRectWithAnchorSection:", v26);
    -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor compactifySectionsBeyondVisibleRectWithAnchorSection:](self->_toLayoutSnapshotGeometryDescriptor, "compactifySectionsBeyondVisibleRectWithAnchorSection:", v44);

  }
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7
{
  -[_PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper _adjustGeometries:styles:infos:spriteIndexRange:appearing:](self, "_adjustGeometries:styles:infos:spriteIndexRange:appearing:", a4, a5, a6, a7, 1);
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7
{
  -[_PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper _adjustGeometries:styles:infos:spriteIndexRange:appearing:](self, "_adjustGeometries:styles:infos:spriteIndexRange:appearing:", a4, a5, a6, a7, 0);
}

- (void)_adjustGeometries:(id *)a3 styles:(id *)a4 infos:(id *)a5 spriteIndexRange:(_PXGSpriteIndexRange)a6 appearing:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v11;
  PXCuratedLibraryLayoutSnapshotGeometryDescriptor *v12;
  PXCuratedLibraryLayoutSnapshotGeometryDescriptor *v13;
  unint64_t v14;
  double v15;
  PXCuratedLibraryLayoutSnapshotGeometryDescriptor *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  float v46;
  float v47;
  float *v48;
  CGFloat v49;
  _PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper *v50;
  CGFloat v51;
  PXCuratedLibrarySectionGeometryDescriptor *v52;
  PXCuratedLibrarySectionGeometryDescriptor *nullSectionGeometryDescriptor;
  PXCuratedLibraryLayoutSnapshotGeometryDescriptor *v54;
  PXCuratedLibrarySectionGeometryDescriptor *v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  _BOOL4 v68;
  PXCuratedLibrarySectionGeometryDescriptor *v69;
  CGFloat b;
  _BOOL4 v71;
  CGFloat d;
  CGFloat c;
  CGFloat v74;
  float v75;
  void (*v76)(CGAffineTransform *__return_ptr);
  PXCuratedLibrarySectionGeometryDescriptor *v77;
  PXCuratedLibrarySectionGeometryDescriptor *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  __n128 v87;
  int v88;
  double x;
  CGFloat v90;
  double v91;
  CGFloat v92;
  int v93;
  PXCuratedLibrarySectionGeometryDescriptor *v94;
  void *v95;
  float v96;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v100;
  double v101;
  CGFloat v102;
  double v103;
  CGFloat v104;
  double v105;
  CGFloat v106;
  double v107;
  CGFloat v108;
  int v109;
  int v110;
  NSObject *v111;
  float Width;
  float v113;
  double v114;
  float v115;
  double v116;
  float v117;
  double v118;
  CGFloat MaxY;
  float64x2_t v120;
  float64x2_t v121;
  float v122;
  double v123;
  CGFloat v124;
  double v125;
  CGFloat v126;
  double v127;
  CGFloat v128;
  double v129;
  CGFloat v130;
  CGFloat v131;
  char v132;
  CGFloat v133;
  float v134;
  double y;
  float v136;
  float v137;
  uint64_t v139;
  uint64_t v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  uint64_t v148;
  float v149;
  double v150;
  CGFloat v151;
  double v152;
  CGFloat v153;
  double v154;
  CGFloat v155;
  double v156;
  CGFloat v157;
  double v158;
  double v159;
  double v160;
  double v161;
  CGFloat v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  float64x2_t v174;
  float64x2_t v175;
  void *v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  CGFloat v182;
  double v183;
  CGFloat v184;
  double v185;
  CGFloat v186;
  double v187;
  CGFloat v188;
  double v189;
  double v190;
  CGFloat v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  char v202;
  double v203;
  _DWORD *v204;
  int v205;
  int v206;
  int v207;
  double v208;
  double v209;
  double v210;
  double v211;
  void *v212;
  double v213;
  float64x2_t v214;
  float64_t v215;
  float64x2_t v216;
  float64_t v217;
  _DWORD *v218;
  int v219;
  int v220;
  int v221;
  int v222;
  double v223;
  CGFloat v224;
  double v225;
  CGFloat v226;
  double v227;
  CGFloat v228;
  double v229;
  CGFloat v230;
  CGFloat v231;
  CGFloat v232;
  CGFloat v233;
  CGFloat v234;
  _BOOL4 v235;
  float v236;
  float v237;
  float v238;
  double v239;
  double v240;
  double v241;
  double v242;
  __int128 v243;
  CGFloat v244;
  NSObject *v245;
  float64x2_t v246;
  float64x2_t v247;
  _DWORD *v248;
  int v249;
  int v250;
  int v251;
  int v252;
  double v253;
  double v254;
  double v255;
  double v256;
  void *v257;
  CGRect v258;
  CGFloat v259;
  CGFloat v260;
  CGFloat v261;
  CGFloat v262;
  CGFloat v263;
  CGFloat v264;
  CGFloat v265;
  CGFloat sx;
  double sxb;
  CGFloat sxc;
  CGFloat sxa;
  CGFloat v270;
  double v271;
  CGFloat v272;
  CGFloat v273;
  CGFloat v274;
  CGFloat v275;
  double v276;
  CGFloat v277;
  CGFloat v278;
  CGFloat v279;
  _BOOL4 v281;
  uint64_t v282;
  CGFloat v283;
  void *v284;
  void *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  float32x4_t v290;
  float v291;
  double a;
  double v293;
  _QWORD *v294;
  double v295;
  double v296;
  double v297;
  double v298;
  void (**v299)(_QWORD *__return_ptr);
  uint64_t v300;
  uint64_t v301;
  _BOOL4 v302;
  CGFloat v303;
  double v304;
  CGFloat v305;
  double v306;
  CGFloat v307;
  CGFloat v308;
  PXCuratedLibraryLayoutSnapshotGeometryDescriptor *v309;
  PXCuratedLibraryLayoutSnapshotGeometryDescriptor *v310;
  uint64_t v311;
  int64x2_t v312;
  CGFloat v313;
  CGFloat v314;
  uint64_t v315;
  float v316;
  uint64_t v317;
  double v318;
  __int128 v319;
  __int128 v320;
  char *v321;
  float32x4_t v322;
  _PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper *v323;
  CGFloat v324;
  PXCuratedLibrarySectionGeometryDescriptor *v325;
  float v326;
  float v327;
  double MinY;
  CGFloat v329;
  float v330;
  void *rect;
  CGFloat recta;
  CGFloat rectb;
  float64_t rectc;
  CGFloat v335;
  double MinX;
  int64x2_t v337;
  void *v338;
  PXCuratedLibrarySectionGeometryDescriptor *v340;
  _QWORD v342[2];
  int64x2_t v343;
  CGAffineTransform v344;
  CGAffineTransform v345;
  _QWORD v346[5];
  _QWORD v347[4];
  PXCuratedLibrarySectionGeometryDescriptor *v348;
  CGFloat v349;
  unsigned __int8 v350;
  __int128 v351;
  __int128 v352;
  CGFloat v353;
  _QWORD v354[2];
  int64x2_t v355;
  _QWORD v356[2];
  int64x2_t v357;
  __int128 v358;
  __int128 v359;
  CGFloat ty;
  _QWORD v361[5];
  _QWORD v362[5];
  _QWORD v363[5];
  _QWORD aBlock[5];
  CGAffineTransform v365;
  double v366;
  uint64_t v367;
  CGRect v368;
  CGRect v369;
  CGRect v370;
  CGRect v371;
  CGRect v372;
  CGRect v373;
  CGRect v374;
  CGRect v375;
  CGRect v376;
  CGRect v377;
  CGRect v378;
  CGRect v379;
  CGRect v380;
  CGRect v381;
  CGRect v382;
  CGRect v383;
  CGRect v384;
  CGRect v385;
  CGRect v386;
  CGRect v387;
  CGRect v388;
  CGRect v389;
  CGRect v390;
  CGRect v391;
  CGRect v392;
  CGRect v393;
  CGRect v394;
  CGRect v395;
  CGRect v396;
  CGRect v397;
  CGRect v398;
  CGRect v399;
  CGRect v400;
  CGRect v401;
  CGRect v402;

  v7 = a7;
  v367 = *MEMORY[0x1E0C80C00];
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v281 = v7;
  if (v7)
  {
    v12 = self->_toLayoutSnapshotGeometryDescriptor;
    v13 = self->_fromLayoutSnapshotGeometryDescriptor;
    aBlock[0] = v11;
    aBlock[1] = 3221225472;
    aBlock[2] = __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke;
    aBlock[3] = &unk_1E5116CE8;
    aBlock[4] = self;
    v294 = _Block_copy(aBlock);
    v363[0] = v11;
    v363[1] = 3221225472;
    v363[2] = __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_2;
    v363[3] = &unk_1E5116D10;
    v363[4] = self;
    v299 = (void (**)(_QWORD *__return_ptr))_Block_copy(v363);
    v286 = -[PXVisualPositionsChangeDetails anchorIndexAfterChanges](self->_visualPositionsChangeDetails, "anchorIndexAfterChanges");
    v282 = -[PXVisualPositionsChangeDetails anchorIndexBeforeChanges](self->_visualPositionsChangeDetails, "anchorIndexBeforeChanges");
  }
  else
  {
    v12 = self->_fromLayoutSnapshotGeometryDescriptor;
    v13 = self->_toLayoutSnapshotGeometryDescriptor;
    v362[0] = v11;
    v362[1] = 3221225472;
    v362[2] = __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_3;
    v362[3] = &unk_1E5116CE8;
    v362[4] = self;
    v294 = _Block_copy(v362);
    v361[0] = v11;
    v361[1] = 3221225472;
    v361[2] = __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_4;
    v361[3] = &unk_1E5116D10;
    v361[4] = self;
    v299 = (void (**)(_QWORD *__return_ptr))_Block_copy(v361);
    v286 = -[PXVisualPositionsChangeDetails anchorIndexBeforeChanges](self->_visualPositionsChangeDetails, "anchorIndexBeforeChanges");
    v282 = -[PXVisualPositionsChangeDetails anchorIndexAfterChanges](self->_visualPositionsChangeDetails, "anchorIndexAfterChanges");
  }
  v14 = HIDWORD(*(unint64_t *)&a6);
  *(double *)&v317 = COERCE_DOUBLE(-[PXCuratedLibraryLayoutSnapshotGeometryDescriptor dataSourceIdentifier](v12, "dataSourceIdentifier"));
  *(double *)&v300 = COERCE_DOUBLE(-[PXCuratedLibraryLayoutSnapshotGeometryDescriptor skimmingDataSourceIdentifier](v12, "skimmingDataSourceIdentifier"));
  v310 = v13;
  *(double *)&v287 = COERCE_DOUBLE(-[PXCuratedLibraryLayoutSnapshotGeometryDescriptor dataSourceIdentifier](v13, "dataSourceIdentifier"));
  v15 = *MEMORY[0x1E0C9BAA8];
  v319 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 24);
  v320 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 8);
  v358 = v320;
  v359 = v319;
  v318 = *(double *)(MEMORY[0x1E0C9BAA8] + 40);
  ty = v318;
  v323 = self;
  v16 = v12;
  v293 = v15;
  if (self->_transitionType == 2)
  {
    if (-[PXCuratedLibraryLayoutSnapshotGeometryDescriptor zoomLevel](v12, "zoomLevel") == 1)
    {
      objc_msgSend(v285, "nonAnchorYearsFadeSpeed");
      v18 = v17;
      +[PXNonuniformTransform identityTransform](PXNonuniformTransform, "identityTransform");
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      v311 = 2;
      a = v293;
    }
    else
    {
      v356[0] = -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor dataSourceIdentifier](v12, "dataSourceIdentifier");
      v356[1] = v286;
      v337 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      v357 = v337;
      -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor geometryDescriptorForSectionAtIndexPath:](v12, "geometryDescriptorForSectionAtIndexPath:", v356);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v354[0] = -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor dataSourceIdentifier](v13, "dataSourceIdentifier");
      v354[1] = v282;
      v355 = v337;
      -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor geometryDescriptorForSectionAtIndexPath:](v13, "geometryDescriptorForSectionAtIndexPath:", v354);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v18 = 1.0;
      if (v19)
      {
        a = v293;
        v311 = 0;
        if (v20)
        {
          memset(&v345, 0, 24);
          objc_msgSend(v19, "visualPosition");
          ((void (**)(CGAffineTransform *__return_ptr))v299)[2](&v345);
          if (*(_QWORD *)&v345.b == 1)
          {
            objc_msgSend(v285, "transitionScaleForDayNotMatchingMonths");
            v22 = -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor zoomLevel](v13, "zoomLevel");
            if (v22 <= -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor zoomLevel](v12, "zoomLevel"))
              objc_msgSend(v285, "nonAnchorDaysFadeSpeed");
            else
              objc_msgSend(v285, "nonAnchorMonthsFadeSpeed");
            v18 = v23;
            -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor visibleRect](v13, "visibleRect");
            PXRectGetCenter();
            PXAffineTransformMakeScaleFromPoint();
            v21 = 0;
            a = v365.a;
            v358 = *(_OWORD *)&v365.b;
            v359 = *(_OWORD *)&v365.d;
            ty = v365.ty;
            v311 = 1;
          }
          else
          {
            objc_msgSend(v285, "nonAnchorMonthsFadeSpeed");
            v18 = v24;
            objc_msgSend(v285, "defaultZoomLevelTransitionMaximumScaleAroundAnchor");
            v26 = v25;
            objc_msgSend(v19, "sectionRect");
            v28 = v27;
            v30 = v29;
            v32 = v31;
            v34 = v33;
            objc_msgSend(v20, "sectionRect");
            +[PXNonuniformTransform horizontallyDominantTransformWithSourceRect:targetRect:coordinateSpace:minimumScale:maximumScale:](PXNonuniformTransform, "horizontallyDominantTransformWithSourceRect:targetRect:coordinateSpace:minimumScale:maximumScale:", self->_coordinateSpace, v28, v30, v32, v34, v35, v36, v37, v38, 1.0 / v26, *(_QWORD *)&v26);
            v21 = objc_claimAutoreleasedReturnValue();
            v311 = 2;
            a = v293;
          }
        }
      }
      else
      {
        a = v293;
        v311 = 0;
      }
      v284 = (void *)v21;

    }
  }
  else
  {
    v284 = 0;
    v311 = 0;
    v18 = 1.0;
    a = v15;
  }
  v39 = -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor zoomLevel](v12, "zoomLevel");
  v40 = -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor zoomLevel](v13, "zoomLevel");
  if (v39 >= v40)
    v41 = v40;
  else
    v41 = v39;
  v289 = v41;
  v42 = -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor zoomLevel](v12, "zoomLevel");
  v43 = -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor zoomLevel](v13, "zoomLevel");
  if (v42 <= v43)
    v44 = v43;
  else
    v44 = v42;
  v288 = v44;
  if (v14)
  {
    v45 = 0;
    v297 = *((double *)off_1E50B8778 + 1);
    v298 = *(double *)off_1E50B8778;
    v295 = *((double *)off_1E50B8778 + 3);
    v296 = *((double *)off_1E50B8778 + 2);
    v301 = *(_QWORD *)off_1E50B7E98;
    v46 = 9.0;
    if (a >= 0.0)
      v46 = 0.0;
    v291 = v46;
    v290 = *(float32x4_t *)off_1E50B81E8;
    v47 = 1.0 - v18;
    v316 = v47;
    v315 = 160 * v14;
    v48 = (float *)&a3[1].var0.var0 + 1;
    v312 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v309 = v12;
    while (1)
    {
      v351 = v320;
      v352 = v319;
      v49 = *(double *)&v317;
      v353 = v318;
      v350 = 0;
      v349 = 0.0;
      PXGSectionedSpriteTagDecompose();
      if (v349 == NAN)
      {
        v49 = *(double *)&v300;
        PXGSectionedSpriteTagDecompose();
      }
      v50 = v323;
      if (v350)
        break;
      v75 = 0.0;
LABEL_62:
      if (v50->_shouldAlwaysFadeDecoration && a5->var1 == 8)
        v75 = 0.0;
      v122 = v316;
      if (v75 != 0.0)
        v122 = v75;
      *(float *)((char *)&a4->var0 + v45) = *(float *)((char *)&a4->var0 + v45) * v122;
      v45 += 160;
      a5 = ($786F7D2F4E5B3A0CBB66DF574B7D98CF *)((char *)a5 + 40);
      v48 += 8;
      if (v315 == v45)
        goto LABEL_25;
    }
    v51 = v349;
    v365.a = v49;
    v365.b = v349;
    *(int64x2_t *)&v365.c = v312;
    -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor geometryDescriptorForSectionAtIndexPath:](v16, "geometryDescriptorForSectionAtIndexPath:", &v365);
    v52 = (PXCuratedLibrarySectionGeometryDescriptor *)objc_claimAutoreleasedReturnValue();
    nullSectionGeometryDescriptor = v52;
    v54 = v16;
    if (!v52)
      nullSectionGeometryDescriptor = v323->_nullSectionGeometryDescriptor;
    v55 = nullSectionGeometryDescriptor;

    -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor visibleRect](v54, "visibleRect");
    v57 = v56;
    v59 = v58;
    v61 = v60;
    v63 = v62;
    -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](v55, "sectionRect");
    v401.origin.x = v64;
    v401.origin.y = v65;
    v401.size.width = v66;
    v401.size.height = v67;
    v368.origin.x = v57;
    v368.origin.y = v59;
    v368.size.width = v61;
    v368.size.height = v63;
    v68 = CGRectIntersectsRect(v368, v401);
    v347[0] = MEMORY[0x1E0C809B0];
    v347[1] = 3221225472;
    v347[2] = __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_5;
    v347[3] = &unk_1E51282E8;
    v69 = v55;
    v348 = v69;
    rect = _Block_copy(v347);
    v325 = v69;
    v302 = v68;
    if (v323->_visualPositionsChangeDetails
      && (memset(&v365, 0, 24),
          -[PXCuratedLibrarySectionGeometryDescriptor visualPosition](v69, "visualPosition"),
          ((void (**)(CGAffineTransform *__return_ptr))v299)[2](&v365),
          b = v365.a,
          *(_QWORD *)&v365.a != 0x7FFFFFFFFFFFFFFFLL))
    {
      v71 = *(_QWORD *)&v365.b == 1;
      d = NAN;
      c = NAN;
      v74 = *(double *)&v287;
    }
    else
    {
      v71 = 0;
      d = v295;
      c = v296;
      b = v297;
      v74 = v298;
    }
    if (*(_QWORD *)&v74 == v301)
    {
      v76 = (void (*)(CGAffineTransform *__return_ptr))v294[2];
      v345.a = v49;
      v345.b = v51;
      *(int64x2_t *)&v345.c = v312;
      v76(&v365);
      v74 = v365.a;
      b = v365.b;
      c = v365.c;
      d = v365.d;
    }
    v365.a = v74;
    v365.b = b;
    v365.c = c;
    v365.d = d;
    -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor geometryDescriptorForSectionAtIndexPath:](v310, "geometryDescriptorForSectionAtIndexPath:", &v365);
    v77 = (PXCuratedLibrarySectionGeometryDescriptor *)objc_claimAutoreleasedReturnValue();
    v78 = v77;
    if (!v77)
      v78 = v323->_nullSectionGeometryDescriptor;
    v340 = v78;

    PXRectWithCenterAndSize();
    v80 = v79;
    v82 = v81;
    v84 = v83;
    v86 = v85;
    v322 = *(float32x4_t *)((char *)&a4->var2 + v45);
    v346[0] = MEMORY[0x1E0C809B0];
    v346[1] = 3221225472;
    v346[2] = __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_6;
    v346[3] = &unk_1E5116D38;
    v346[4] = v323;
    v338 = _Block_copy(v346);
    v321 = (char *)a4 + v45;
    v335 = v86;
    v313 = v84;
    v314 = v82;
    v324 = v80;
    if (v311 == 1)
    {
      v88 = 0;
      v353 = ty;
      v351 = v358;
      v352 = v359;
      v350 = -1;
      x = v80;
      v90 = v82;
      v326 = 0.0;
      v91 = v86;
      v327 = v291;
      v92 = a;
LABEL_49:
      v94 = v325;
      v95 = rect;
LABEL_50:
      v96 = *(double *)(v48 - 3);
      v369.origin.x = x;
      v369.origin.y = v90;
      v369.size.width = v84;
      v369.size.height = v91;
      MidX = CGRectGetMidX(v369);
      v370.origin.x = x;
      v370.origin.y = v90;
      v370.size.width = v84;
      v370.size.height = v91;
      MidY = CGRectGetMidY(v370);
      v371.origin.x = x;
      v371.origin.y = v90;
      v371.size.width = v84;
      v371.size.height = v91;
      recta = CGRectGetWidth(v371);
      v372.origin.x = x;
      v372.origin.y = v90;
      v372.size.width = v84;
      v372.size.height = v91;
      Height = CGRectGetHeight(v372);
      v100.f64[0] = recta;
      v100.f64[1] = Height;
      *(CGFloat *)(v48 - 7) = MidX;
      *(CGFloat *)(v48 - 5) = MidY;
      *(double *)(v48 - 3) = v96;
      *(float32x2_t *)(v48 - 1) = vcvt_f32_f64(v100);
      *(_OWORD *)&v365.b = v351;
      *(_OWORD *)&v365.d = v352;
      v365.ty = v353;
      v365.a = v92;
      v366 = v327;
      PXGSpriteApplyTransform();
      v16 = v309;
      if (v88)
      {
        -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor visibleRect](v309, "visibleRect");
        v102 = v101;
        v104 = v103;
        v106 = v105;
        v108 = v107;
        rectb = v107;
        v373.origin.x = v324;
        v373.origin.y = v314;
        v373.size.width = v313;
        v373.size.height = v335;
        CGRectGetMinX(v373);
        v374.origin.x = v102;
        v374.origin.y = v104;
        v374.size.width = v106;
        v374.size.height = v108;
        CGRectGetMinX(v374);
        v109 = PXFloatEqualToFloatWithTolerance();
        v375.origin.x = v324;
        v375.origin.y = v314;
        v375.size.width = v313;
        v375.size.height = v335;
        CGRectGetMaxX(v375);
        v376.origin.x = v102;
        v376.origin.y = v104;
        v376.size.width = v106;
        v376.size.height = rectb;
        CGRectGetMaxX(v376);
        v110 = PXFloatEqualToFloatWithTolerance();
        if (v109 != v110)
        {
          PXAssertGetLog();
          v111 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v365.a) = 0;
            _os_log_error_impl(&dword_1A6789000, v111, OS_LOG_TYPE_ERROR, "we currently only support a floating gradient sprite extending to either both or neither lateral visible edges", (uint8_t *)&v365, 2u);
          }

        }
        if ((v109 | v110) == 1)
        {
          v377.origin.x = v324;
          v377.origin.y = v314;
          v377.size.width = v313;
          v377.size.height = v335;
          *(CGFloat *)(v48 - 7) = CGRectGetMidX(v377);
          v378.origin.x = v324;
          v378.origin.y = v314;
          v378.size.width = v313;
          v378.size.height = v335;
          Width = CGRectGetWidth(v378);
          *(v48 - 1) = Width;
        }
        v379.origin.x = v324;
        v379.origin.y = v314;
        v379.size.width = v313;
        v379.size.height = v335;
        *(CGFloat *)(v48 - 5) = CGRectGetMidY(v379);
        v380.origin.x = v324;
        v380.origin.y = v314;
        v380.size.width = v313;
        v380.size.height = v335;
        v113 = CGRectGetHeight(v380);
        *v48 = v113;
        if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(v322, v290)), 0xFuLL))) & 1) == 0)
        {
          v114 = *((float *)v321 + 5);
          v115 = *(float *)((char *)&a4->var3 + v45);
          v116 = *(float *)((char *)&a4->var4 + v45);
          v117 = *(float *)((char *)&a4->var5 + v45);
          MinX = v114;
          v118 = v116;
          if (v109 | v110)
          {
            v381.origin.x = v322.f32[0];
            v381.origin.y = v322.f32[1];
            v381.size.width = v322.f32[2];
            v381.size.height = v322.f32[3];
            MinX = CGRectGetMinX(v381);
            v382.origin.x = v322.f32[0];
            v382.origin.y = v322.f32[1];
            v382.size.width = v322.f32[2];
            v382.size.height = v322.f32[3];
            v118 = CGRectGetWidth(v382);
          }
          rectc = v118;
          v383.origin.x = v322.f32[0];
          v383.origin.y = v322.f32[1];
          v383.size.width = v322.f32[2];
          v383.size.height = v322.f32[3];
          MinY = CGRectGetMinY(v383);
          v384.origin.x = v114;
          v384.origin.y = v115;
          v384.size.width = v116;
          v384.size.height = v117;
          MaxY = CGRectGetMaxY(v384);
          v120.f64[0] = rectc;
          v120.f64[1] = MaxY - MinY;
          v121.f64[0] = MinX;
          v121.f64[1] = MinY;
          *(float32x4_t *)(v321 + 20) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v121), v120);
        }
      }

      v75 = v326;
      goto LABEL_62;
    }
    v93 = v350;
    v87.n128_f64[0] = v293;
    if (v350 == 24 && v289 == 1 && v288 == 2)
    {
      v88 = 0;
      v350 = -1;
      v327 = 0.0;
      x = v80;
      v90 = v82;
      v91 = v86;
      v326 = 0.0;
      v92 = v293;
      goto LABEL_49;
    }
    if (v311 != 2 || *(_QWORD *)&v349 == v286)
    {
      if (v71)
      {
        if (*(_QWORD *)&v349 == v286)
        {
          if (v350 != 16 || (v132 = (*((uint64_t (**)(__n128))rect + 2))(v87), v133 = v293, (v132 & 1) == 0))
          {
            objc_msgSend(v285, "transitionScaleForDayNotMatchingMonths");
            -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor visibleRect](v310, "visibleRect");
            PXRectGetCenter();
            PXAffineTransformMakeScaleFromPoint();
            v133 = v365.a;
            v87 = *(__n128 *)&v365.b;
            v351 = *(_OWORD *)&v365.b;
            v352 = *(_OWORD *)&v365.d;
            v353 = v365.ty;
          }
          v283 = v133;
          v93 = 255;
          v350 = -1;
          v134 = 0.0;
        }
        else
        {
          if (v350 == 23 || v350 == 18)
            v134 = 0.0;
          else
            v134 = 1.0;
          -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](v340, "sectionRect");
          PXRectGetCenter();
          PXAffineTransformMakeScaleFromPoint();
          v283 = v365.a;
          v87 = *(__n128 *)&v365.b;
          v351 = *(_OWORD *)&v365.b;
          v352 = *(_OWORD *)&v365.d;
          v353 = v365.ty;
          v93 = v350;
        }
        if (v93 == 24)
          v136 = 0.0;
        else
          v136 = 9.0;
        if (v93 == 24)
          v87.n128_f32[0] = 0.0;
        else
          v87.n128_f32[0] = v134;
        if (a5->var1 == 10)
          v137 = -3.0;
        else
          v137 = v87.n128_f32[0];
        v86 = v335;
      }
      else
      {
        v136 = 0.0;
        v137 = 0.0;
        v283 = v293;
      }
      v88 = 0;
      v326 = v137;
      v139 = 36;
      v140 = 2;
      switch(v93)
      {
        case 0:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v87.n128_f64[0]);
          v257 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v257, "handleFailureInMethod:object:file:lineNumber:description:", a2, v323, CFSTR("PXCuratedLibraryLayoutAnimationHelper.m"), 656, CFSTR("Code which should be unreachable has been reached"));

          abort();
        case 1:
          v327 = v136;
          if (!v302)
            goto LABEL_139;
          v94 = v325;
          -[PXCuratedLibrarySectionGeometryDescriptor keyAssetRect](v325, "keyAssetRect", v87.n128_f64[0]);
          v151 = v150;
          v153 = v152;
          v155 = v154;
          v157 = v156;
          -[PXCuratedLibrarySectionGeometryDescriptor keyAssetRect](v340, "keyAssetRect");
          v275 = v158;
          v270 = v159;
          v303 = v160;
          v162 = v161;
          v386.origin.x = v151;
          v386.origin.y = v153;
          v386.size.width = v155;
          v386.size.height = v157;
          v50 = v323;
          if (CGRectIsNull(v386)
            || (v387.origin.x = v275,
                v387.origin.y = v270,
                v387.size.width = v303,
                v387.size.height = v162,
                CGRectIsNull(v387)))
          {
            v88 = 0;
            x = v80;
            v84 = v313;
            v90 = v314;
            v91 = v86;
          }
          else
          {
            PXRectNormalize();
            PXRectDenormalize();
            x = v208;
            v90 = v209;
            v84 = v210;
            v91 = v211;
            -[PXCuratedLibrarySectionGeometryDescriptor headerAsset](v325, "headerAsset");
            v212 = (void *)objc_claimAutoreleasedReturnValue();
            PXSizeGetAspectRatio();
            v214.f64[0] = PXCuratedLibraryBestCropRectForAssetInZoomLevel(v212, -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor zoomLevel](v310, "zoomLevel"), 0, v213);
            v216.f64[1] = v215;
            v214.f64[1] = v217;
            v218 = (_DWORD *)((char *)&a4->var0 + v45);
            *(float32x4_t *)((char *)&a4->var1 + v45) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v214), v216);

            -[PXCuratedLibrarySectionGeometryDescriptor headerCornerRadius](v340, "headerCornerRadius");
            v218[9] = v219;
            v218[10] = v220;
            v218[11] = v221;
            v218[12] = v222;
            PXGSpriteStyleUnionClippingRect();
            -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor visibleRect](v310, "visibleRect");
            v224 = v223;
            v226 = v225;
            v228 = v227;
            v230 = v229;
            -[PXCuratedLibrarySectionGeometryDescriptor keyAssetRect](v340, "keyAssetRect");
            v402.origin.x = v231;
            v402.origin.y = v232;
            v402.size.width = v233;
            v402.size.height = v234;
            v395.origin.x = v224;
            v395.origin.y = v226;
            v395.size.width = v228;
            v395.size.height = v230;
            v235 = CGRectIntersectsRect(v395, v402);
            v88 = 0;
            v236 = v327;
            if (v235 && v281)
            {
              v237 = v327 + 0.3;
              v236 = v237;
            }
            v327 = v236;
            v238 = v326;
            if (v281)
              v238 = 1.0;
            if (!v235)
              v238 = 1.0;
            v326 = v238;
          }
          v95 = rect;
          goto LABEL_104;
        case 2:
          v327 = v136;
          if (!v302)
          {
LABEL_139:
            v88 = 0;
            x = v80;
LABEL_141:
            v90 = v82;
            v91 = v86;
            v50 = v323;
            v94 = v325;
            goto LABEL_103;
          }
          v163 = __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_7(v325);
          v165 = v164;
          v167 = v166;
          v169 = v168;
          v304 = __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_7(v340);
          v171 = v170;
          v276 = v172;
          v271 = v173;
          v388.origin.x = v163;
          v388.origin.y = v165;
          v388.size.width = v167;
          v388.size.height = v169;
          v50 = v323;
          if (CGRectIsNull(v388)
            || (v389.origin.x = v304,
                v389.origin.y = v171,
                v389.size.width = v276,
                v389.size.height = v271,
                CGRectIsNull(v389)))
          {
            v88 = 0;
            v91 = v86;
            v84 = v313;
            y = v314;
            x = v80;
          }
          else
          {
            v396.origin.x = v304;
            v396.origin.y = v171;
            v396.size.width = v276;
            v396.size.height = v271;
            sxb = CGRectGetWidth(v396);
            v397.origin.x = v163;
            v397.origin.y = v165;
            v397.size.width = v167;
            v397.size.height = v169;
            sxc = sxb / CGRectGetWidth(v397);
            v239 = __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_8(*(uint64_t *)&v51, v286, v163, v165, v167, v169);
            v241 = v240;
            v242 = __115___PXCuratedLibraryLayoutZoomLevelChangeAnimationHelper__adjustGeometries_styles_infos_spriteIndexRange_appearing___block_invoke_8(*(uint64_t *)&b, v282, v304, v171, v276, v271);
            v243 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
            *(_OWORD *)&v365.a = *MEMORY[0x1E0C9BAA8];
            *(_OWORD *)&v365.c = v243;
            *(_OWORD *)&v365.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
            *(_OWORD *)&v345.a = *(_OWORD *)&v365.a;
            *(_OWORD *)&v345.c = v243;
            *(_OWORD *)&v345.tx = *(_OWORD *)&v365.tx;
            CGAffineTransformTranslate(&v365, &v345, v242, v244);
            v344 = v365;
            CGAffineTransformScale(&v345, &v344, sxc, sxc);
            v365 = v345;
            v344 = v345;
            CGAffineTransformTranslate(&v345, &v344, -v239, -v241);
            v365 = v345;
            v398.origin.x = v80;
            v398.size.width = v313;
            v398.origin.y = v314;
            v398.size.height = v86;
            v399 = CGRectApplyAffineTransform(v398, &v345);
            x = v399.origin.x;
            y = v399.origin.y;
            v84 = v399.size.width;
            v91 = v399.size.height;
            v88 = 1;
          }
          v94 = v325;
          -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](v340, "sectionRect");
          v274 = v400.origin.y;
          v279 = v400.origin.x;
          v308 = v400.size.width;
          sxa = v400.size.height;
          v95 = rect;
          if (CGRectIsNull(v400))
          {
            PLCuratedLibraryGetLog();
            v245 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v365.a) = 138412290;
              *(_QWORD *)((char *)&v365.a + 4) = v340;
              _os_log_impl(&dword_1A6789000, v245, OS_LOG_TYPE_DEFAULT, "missing section rect for %@, some sprites might not get clipped correctly", (uint8_t *)&v365, 0xCu);
            }

          }
          else
          {
            v246.f64[0] = v308;
            v246.f64[1] = sxa;
            v247.f64[0] = v279;
            v247.f64[1] = v274;
            *(float32x4_t *)(v321 + 20) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v247), v246);
            v137 = 1.0;
          }
          v326 = v137;
          if (v88)
          {
            v248 = (_DWORD *)((char *)&a4->var0 + v45);
            v90 = y;
            -[PXCuratedLibrarySectionGeometryDescriptor cornerRadiusForRect:](v340, "cornerRadiusForRect:", x, y, v84, v91);
            v88 = 0;
            v248[9] = v249;
            v248[10] = v250;
            v248[11] = v251;
            v248[12] = v252;
            goto LABEL_104;
          }
          v92 = v283;
          goto LABEL_115;
        case 3:
        case 4:
          goto LABEL_102;
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 12:
        case 13:
        case 14:
        case 15:
        case 17:
          v88 = 0;
          v139 = 33;
          goto LABEL_101;
        case 11:
          v88 = 0;
          v139 = 12;
          goto LABEL_101;
        case 16:
          v95 = rect;
          if ((*((unsigned int (**)(void *, __n128))rect + 2))(rect, v87))
          {
            -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](v340, "sectionRect");
            v305 = v390.origin.x;
            v272 = v390.size.height;
            v277 = v390.origin.y;
            v329 = v390.size.width;
            if (!CGRectIsNull(v390))
            {
              v174.f64[0] = v329;
              v174.f64[1] = v272;
              v175.f64[0] = v305;
              v175.f64[1] = v277;
              v87 = (__n128)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v175), v174);
              *(__n128 *)(v321 + 20) = v87;
            }
            v87.n128_f64[0] = v136 + 0.3;
            v136 = v87.n128_f64[0];
            v88 = 1;
LABEL_117:
            v139 = 18;
            v140 = 1;
          }
          else
          {
            v330 = v136;
            v94 = v325;
            -[PXCuratedLibrarySectionGeometryDescriptor keyAssetRect](v325, "keyAssetRect");
            v182 = v181;
            v184 = v183;
            v186 = v185;
            v188 = v187;
            -[PXCuratedLibrarySectionGeometryDescriptor headerRect](v325, "headerRect");
            v307 = v189;
            v191 = v190;
            v278 = v192;
            v273 = v193;
            -[PXCuratedLibrarySectionGeometryDescriptor keyAssetRect](v340, "keyAssetRect");
            v265 = v195;
            sx = v194;
            v263 = v197;
            v264 = v196;
            -[PXCuratedLibrarySectionGeometryDescriptor headerRect](v340, "headerRect");
            v259 = v198;
            v260 = v199;
            v261 = v201;
            v262 = v200;
            v391.origin.x = v182;
            v391.origin.y = v184;
            v391.size.width = v186;
            v391.size.height = v188;
            if (CGRectIsNull(v391))
              goto LABEL_146;
            v392.origin.x = v307;
            v392.origin.y = v191;
            v392.size.width = v278;
            v392.size.height = v273;
            if (CGRectIsNull(v392))
              goto LABEL_146;
            v393.origin.y = v265;
            v393.origin.x = sx;
            v393.size.height = v263;
            v393.size.width = v264;
            if (CGRectIsNull(v393)
              || (v394.size.height = v260,
                  v394.origin.x = v259,
                  v394.size.width = v261,
                  v394.origin.y = v262,
                  CGRectIsNull(v394)))
            {
LABEL_146:
              v202 = 0;
              v139 = 34;
              v91 = v86;
              v84 = v313;
              v203 = v314;
              x = v80;
            }
            else
            {
              (*((void (**)(void *, uint64_t))v338 + 2))(v338, 34);
              PXGResizeRect();
              v203 = v253;
              v91 = v254;
              (*((void (**)(void *, uint64_t))v338 + 2))(v338, 34);
              v258.size.height = v260;
              v258.size.width = v261;
              v258.origin.x = v259;
              v258.origin.y = v262;
              v86 = v335;
              PXGResizeRect();
              x = v255;
              v84 = v256;
              v139 = 0;
              v202 = 1;
            }
            v204 = (_DWORD *)((char *)&a4->var0 + v45);
            -[PXCuratedLibrarySectionGeometryDescriptor headerCornerRadius](v340, "headerCornerRadius", *(_QWORD *)&v258.origin.x, *(_QWORD *)&v258.origin.y);
            v88 = 0;
            v204[9] = v87.n128_u32[0];
            v204[10] = v205;
            v204[11] = v206;
            v204[12] = v207;
            v87.n128_f64[0] = v330 + 0.3;
            v136 = v87.n128_f64[0];
            if ((v202 & 1) != 0)
            {
              v50 = v323;
              v92 = v283;
              v327 = v87.n128_f64[0];
              v90 = v203;
              goto LABEL_50;
            }
            v140 = 2;
            v84 = v313;
            v82 = v314;
          }
LABEL_102:
          v327 = v136;
          v94 = v325;
          -[PXCuratedLibrarySectionGeometryDescriptor resizeRect:fromGeometryDesciptor:inContainer:resizing:](v340, "resizeRect:fromGeometryDesciptor:inContainer:resizing:", v325, v140, (*((uint64_t (**)(void *, uint64_t, __n128))v338 + 2))(v338, v139, v87), v80, v82, v84, v86);
          x = v141;
          v90 = v142;
          v84 = v143;
          v91 = v144;
          v50 = v323;
LABEL_103:
          v95 = rect;
LABEL_104:
          v92 = v283;
          break;
        case 18:
        case 19:
          v88 = 0;
          v136 = 0.0;
          goto LABEL_117;
        case 20:
          v88 = 0;
          v139 = 9;
LABEL_101:
          v140 = 2;
          goto LABEL_102;
        case 21:
          v88 = 0;
          v139 = 10;
          goto LABEL_134;
        case 22:
          v88 = 0;
          v139 = 13;
LABEL_134:
          v140 = 3;
          goto LABEL_102;
        case 23:
          *(CGFloat *)v342 = v49;
          v342[1] = *(_QWORD *)&v51 + 1;
          v343 = v312;
          -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor geometryDescriptorForSectionAtIndexPath:](v309, "geometryDescriptorForSectionAtIndexPath:", v342);
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = v86;
          v306 = v82;
          x = v80;
          if (v176)
          {
            -[PXCuratedLibrarySectionGeometryDescriptor resizeRect:fromGeometryDesciptor:inContainer:resizing:](v340, "resizeRect:fromGeometryDesciptor:inContainer:resizing:", v176, 1, 36, v80, v82, v84, v86);
            x = v177;
            v306 = v178;
            v84 = v179;
            v91 = v180;
          }

          v88 = 0;
          v50 = v323;
          v94 = v325;
          v95 = rect;
          v92 = v283;
          v327 = v136;
          v90 = v306;
          goto LABEL_50;
        case 24:
          CGAffineTransformMakeTranslation(&v365, 0.0, -100.0);
          v88 = 0;
          v92 = v365.a;
          v351 = *(_OWORD *)&v365.b;
          v352 = *(_OWORD *)&v365.d;
          v353 = v365.ty;
          x = v80;
          v327 = v136;
          v90 = v82;
          v91 = v86;
          v50 = v323;
          v94 = v325;
          v95 = rect;
          goto LABEL_50;
        default:
          x = v80;
          v327 = v136;
          goto LABEL_141;
      }
      goto LABEL_50;
    }
    if (!v302)
    {
      v88 = 0;
      v91 = v86;
      y = v82;
      x = v80;
      v92 = v293;
      v94 = v325;
      v95 = rect;
      goto LABEL_112;
    }
    v94 = v325;
    -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](v325, "sectionRect", v293);
    v124 = v123;
    v126 = v125;
    v128 = v127;
    v130 = v129;
    -[PXCuratedLibrarySectionGeometryDescriptor sectionRect](v325, "sectionRect");
    v95 = rect;
    if (v284)
    {
      objc_msgSend(v284, "affineTransformForRect:inCoordinateSpace:", v323->_coordinateSpace);
      v131 = v365.a;
    }
    else
    {
      v131 = 0.0;
      memset(&v365, 0, sizeof(v365));
    }
    v87.n128_u64[0] = *(_QWORD *)&v365.b;
    v351 = *(_OWORD *)&v365.b;
    v352 = *(_OWORD *)&v365.d;
    v353 = v365.ty;
    if (v350 == 16)
    {
      v92 = v131;
      v88 = (*((uint64_t (**)(void *))rect + 2))(rect);
    }
    else
    {
      if (v350 == 18)
      {
        v365.a = v131;
        *(_OWORD *)&v365.b = v351;
        *(_OWORD *)&v365.d = v352;
        v365.ty = v353;
        v385.origin.x = v124;
        v385.origin.y = v126;
        v385.size.width = v128;
        v385.size.height = v130;
        v258 = CGRectApplyAffineTransform(v385, &v365);
        PXGResizeRect();
        x = v87.n128_f64[0];
        y = v145;
        v84 = v146;
        v91 = v147;
        v88 = 0;
        v351 = v320;
        v87.n128_u64[0] = v319;
        v352 = v319;
        v353 = v318;
        v92 = v293;
        goto LABEL_112;
      }
      v92 = v131;
      v88 = 0;
    }
    v91 = v86;
    v84 = v313;
    y = v82;
    x = v80;
LABEL_112:
    v148 = -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor zoomLevel](v309, "zoomLevel", v87.n128_f64[0], *(_QWORD *)&v258.origin.x, *(_QWORD *)&v258.origin.y, *(_QWORD *)&v258.size.width, *(_QWORD *)&v258.size.height);
    v149 = 9.0;
    v326 = 0.0;
    if (v148 != 1)
      v149 = 0.0;
    v327 = v149;
    v350 = -1;
LABEL_115:
    v90 = y;
    goto LABEL_50;
  }
LABEL_25:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
  objc_storeStrong((id *)&self->_nullSectionGeometryDescriptor, 0);
  objc_storeStrong((id *)&self->_visualPositionsChangeDetails, 0);
  objc_storeStrong((id *)&self->_changeDetails, 0);
  objc_storeStrong((id *)&self->_toLayoutSnapshotGeometryDescriptor, 0);
  objc_storeStrong((id *)&self->_fromLayoutSnapshotGeometryDescriptor, 0);
}

@end
