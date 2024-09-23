@implementation PXGAnimator

void __36__PXGAnimator_hasCriticalAnimations__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;

  objc_msgSend(*(id *)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "groupInfos") + 76 * a2 + 44), "springAnimation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __34__PXGAnimator_highFrameRateReason__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v5;

  v5 = *(id *)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "groupInfos") + 76 * a2 + 44);
  if (objc_msgSend(v5, "highFrameRateReason"))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "highFrameRateReason");
    *a3 = 1;
  }

}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (BOOL)hasCriticalAnimations
{
  PXGAnimator *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PXGAnimationDataStore activeGroupIndexes](self->_animationDataStore, "activeGroupIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__PXGAnimator_hasCriticalAnimations__block_invoke;
  v5[3] = &unk_1E5136440;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (unsigned)highFrameRateReason
{
  PXGAnimator *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PXGAnimationDataStore activeGroupIndexes](self->_animationDataStore, "activeGroupIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PXGAnimator_highFrameRateReason__block_invoke;
  v5[3] = &unk_1E5136440;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  self->_preferredFramesPerSecond = a3;
}

- (id)_dequeueSpriteDataStore
{
  void *v2;

  -[NSMutableArray px_popFirst](self->_reusableSnapshotSpriteDataStores, "px_popFirst");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = (void *)objc_msgSend(off_1E50B2CF8, "newSpriteDataStore");
  return v2;
}

- (void)retargetAnimationsAfterStartTime:(double)a3 newStartTime:(double)a4
{
  double v6;
  void *v7;
  _QWORD v8[7];

  v6 = a3 + -0.0001;
  -[PXGAnimationDataStore activeGroupIndexes](self->_animationDataStore, "activeGroupIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__PXGAnimator_retargetAnimationsAfterStartTime_newStartTime___block_invoke;
  v8[3] = &unk_1E5120968;
  v8[4] = self;
  *(double *)&v8[5] = v6;
  *(double *)&v8[6] = a4;
  objc_msgSend(v7, "enumerateIndexesUsingBlock:", v8);

}

- (void)computeAnimationStateForTime:(double)a3 inputSpriteDataStore:(id)a4 inputChangeDetails:(id)a5 inputLayout:(id)a6 viewportShift:(CGPoint)a7 animationPresentationSpriteDataStore:(id)a8 animationTargetSpriteDataStore:(id)a9 animationChangeDetails:(id *)a10 animationLayout:(id *)a11
{
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  PXGLayoutSnapshot *v26;
  PXGLayoutSnapshot *v27;
  _BOOL4 isSkippingAnimations;
  unsigned int v29;
  id *v30;
  uint64_t v31;
  unsigned int v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  double v41;
  double v42;
  id *v43;
  double lastUpdateTime;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  void *v53;
  void *v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _WORD *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t m;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  id v74;
  PXGAnimator *v75;
  void *v76;
  uint64_t numberOfProlongatedSprites;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  void *v81;
  void *v82;
  id v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  void *v87;
  unsigned int v88;
  PXGAnimator *v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  PXGAnimator *v94;
  id v95;
  float64x2_t *v96;
  uint64_t v97;
  uint64_t v98;
  float64x2_t v99;
  float32x2_t v100;
  float64x2_t v101;
  float32x2_t *v102;
  unsigned int v103;
  __int128 v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  float64x2_t *v110;
  float64x2_t v111;
  float32x2_t *v112;
  __int128 v113;
  PXGAnimator *v114;
  PXGAnimator *v115;
  unsigned int v116;
  id v117;
  void *v118;
  id v119;
  id v120;
  void *v121;
  id v122;
  uint64_t v123;
  id v124;
  void *v125;
  id v126;
  PXGAnimator *v127;
  id *v128;
  uint64_t v129;
  double v130;
  double v131;
  float v132;
  void *v133;
  id *v134;
  uint64_t v135;
  id *v136;
  id v137;
  uint64_t v138;
  id v139;
  id v140;
  id v141;
  id v142;
  uint64_t v143;
  id v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  void *v148;
  id *v149;
  id *v150;
  uint64_t v151;
  uint64_t v152;
  id v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  _BYTE *v157;
  uint64_t v158;
  id *v159;
  id *v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  id v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  double v170;
  uint64_t v171;
  uint64_t v172;
  __int128 v173;
  __int128 v174;
  float *v175;
  float v176;
  float v177;
  float v178;
  uint64_t v179;
  float v180;
  float v181;
  __int128 v182;
  __int128 v183;
  double v184;
  double v185;
  double v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  id *v190;
  id *v191;
  id v192;
  uint64_t v193;
  id v194;
  uint64_t v195;
  id v196;
  uint64_t v197;
  id v198;
  uint64_t v199;
  uint64_t v200;
  unsigned int v201;
  double v202;
  double v203;
  float v204;
  uint64_t v205;
  uint64_t v206;
  float v207;
  float v208;
  double v209;
  double v210;
  float v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  id v217;
  void *v218;
  id v219;
  id *v220;
  uint64_t v221;
  unsigned __int16 *v222;
  void *v223;
  _BOOL8 v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  uint64_t v238;
  void (**v240)(void);
  PXGLayoutSnapshot *v241;
  uint64_t v243;
  PXGLayoutSnapshot *v244;
  id v245;
  double y;
  uint64_t v247;
  id *v248;
  double x;
  id v250;
  void *v251;
  id v252;
  id v253;
  uint64_t v254;
  id v255;
  PXGAnimator *v256;
  PXGAnimator *v257;
  id obj;
  id obja;
  uint64_t v260;
  unsigned int v261;
  id v262;
  id v263;
  id v264;
  void (**v265)(void);
  void *v266;
  float32x2_t v267;
  id v268;
  void *v269;
  id v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  id v274;
  id v275;
  _QWORD v276[5];
  _QWORD v277[4];
  id v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  _QWORD v282[13];
  _QWORD v283[15];
  _QWORD v284[4];
  id v285;
  id v286;
  id *v287;
  _QWORD v288[4];
  id v289;
  id *v290;
  id v291;
  double v292;
  double v293;
  double v294;
  double v295;
  uint64_t v296;
  _QWORD v297[5];
  id v298;
  id v299;
  _QWORD v300[6];
  _QWORD v301[6];
  _QWORD v302[3];
  unsigned int v303;
  _QWORD v304[4];
  id v305;
  PXGAnimator *v306;
  id v307;
  id v308;
  void **v309;
  uint64_t *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t *v313;
  uint64_t v314;
  uint64_t (*v315)(uint64_t, uint64_t);
  void (*v316)(uint64_t);
  id v317;
  _QWORD v318[6];
  void *__b;
  void **p_b;
  uint64_t v321;
  uint64_t (*v322)(uint64_t, uint64_t);
  void (*v323)(uint64_t);
  id v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  _QWORD aBlock[4];
  id v330;
  uint64_t *v331;
  uint64_t v332;
  uint64_t *v333;
  uint64_t v334;
  uint64_t (*v335)(uint64_t, uint64_t);
  void (*v336)(uint64_t);
  id v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  _OWORD v342[2];
  uint64_t v343;
  __int128 v344;
  __int128 v345;
  uint64_t v346;
  __int128 v347;
  __int128 v348;
  uint64_t v349;
  __int128 v350;
  __int128 v351;
  uint64_t v352;
  _QWORD v353[4];
  PXGLayoutSnapshot *v354;
  PXGLayoutSnapshot *v355;
  _OWORD v356[2];
  uint64_t v357;
  __int128 v358;
  __int128 v359;
  uint64_t v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  _BYTE v365[128];
  _BYTE v366[128];
  _QWORD v367[2];
  _BYTE v368[128];
  uint64_t v369;

  y = a7.y;
  x = a7.x;
  v369 = *MEMORY[0x1E0C80C00];
  v253 = a4;
  v245 = a5;
  v17 = a6;
  v255 = a8;
  v252 = a9;
  v256 = self;
  ++self->_computeCount;
  v274 = v17;
  v275 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v17, "animations");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v17, "animations");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v275, "addObjectsFromArray:", v19);

  }
  v364 = 0u;
  v363 = 0u;
  v362 = 0u;
  v361 = 0u;
  objc_msgSend(v17, "transitions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v361, v368, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v362;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v362 != v22)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v361 + 1) + 8 * i), "animations");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "allObjects");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v275, "addObjectsFromArray:", v25);

      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v361, v368, 16);
    }
    while (v21);
  }

  -[PXGAnimator _animationByAnimationIndexForAnimations:](v256, "_animationByAnimationIndexForAnimations:", v275);
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  v254 = objc_msgSend(v273, "count");
  -[PXGAnimator _dequeueSpriteDataStore](v256, "_dequeueSpriteDataStore");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  if (v253)
  {
    objc_msgSend(v253, "sprites");
  }
  else
  {
    v360 = 0;
    v359 = 0u;
    v358 = 0u;
  }
  v356[0] = v358;
  v356[1] = v359;
  v357 = v360;
  objc_msgSend(v251, "setSprites:", v356);
  v26 = v256->_previousLayoutSnapshot;
  -[PXGLayoutSnapshot applyViewportShift:](v26, "applyViewportShift:", x, y);
  v27 = -[PXGLayoutSnapshot initWithLayout:spriteDataStore:]([PXGLayoutSnapshot alloc], "initWithLayout:spriteDataStore:", v274, v251);
  v353[0] = MEMORY[0x1E0C809B0];
  v353[1] = 3221225472;
  v353[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke;
  v353[3] = &unk_1E5117368;
  v241 = v26;
  v354 = v241;
  v244 = v27;
  v355 = v244;
  objc_msgSend(v275, "enumerateObjectsUsingBlock:", v353);
  isSkippingAnimations = v256->_isSkippingAnimations;
  v29 = (v254 == 0) & ~-[PXGAnimator isAnimating](v256, "isAnimating");
  v256->_isSkippingAnimations = v29;
  if (v29 == 1)
  {
    kdebug_trace();
    if (v253)
    {
      objc_msgSend(v253, "sprites");
      v347 = v350;
      v348 = v351;
      v349 = v352;
      objc_msgSend(v255, "setSprites:", &v347);
      objc_msgSend(v253, "sprites");
    }
    else
    {
      v352 = 0;
      v351 = 0u;
      v350 = 0u;
      v347 = 0u;
      v348 = 0u;
      v349 = 0;
      objc_msgSend(v255, "setSprites:", &v347);
      v346 = 0;
      v345 = 0u;
      v344 = 0u;
    }
    v342[0] = v344;
    v342[1] = v345;
    v343 = v346;
    objc_msgSend(v252, "setSprites:", v342);
    kdebug_trace();
    *a10 = objc_retainAutorelease(v245);
    *a11 = objc_retainAutorelease(v274);
    goto LABEL_163;
  }
  if (isSkippingAnimations)
  {
    v30 = v256;
    kdebug_trace();

    v31 = objc_msgSend(v255, "count");
    v32 = objc_msgSend(v30[1], "spriteCount");
    v33 = objc_alloc_init((Class)off_1E50B28A8);
    if (v31 >= v32)
      objc_msgSend(off_1E50B1608, "changeDetailsWithInsertedIndexRange:", 0, v31 - v32);
    else
      objc_msgSend(off_1E50B1608, "changeDetailsWithRemovedIndexRange:", 0, v32 - v31);
    v34 = (id)objc_claimAutoreleasedReturnValue();

    v367[0] = v34;
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoIncrementalChanges");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v367[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v367, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "configureWithNumberOfSpritesAfterChange:changeDetails:", v31, v36);

    objc_msgSend(v30[1], "applySpriteChangeDetails:", v33);
    v37 = objc_retainAutorelease(v255);
    v38 = objc_msgSend(v37, "geometries");
    v39 = objc_msgSend(objc_retainAutorelease(v37), "styles");
    for (j = objc_msgSend(v30[1], "spriteInfos"); (_DWORD)v31; LODWORD(v31) = v31 - 1)
    {
      v41 = *(double *)v38;
      *(_QWORD *)j = *(_QWORD *)v38;
      *(double *)(j + 8) = v41 - v41;
      *(_DWORD *)(j + 16) = 0;
      v42 = *(double *)(v38 + 8);
      *(double *)(j + 20) = v42;
      *(double *)(j + 28) = v42 - v42;
      *(_DWORD *)(j + 36) = 0;
      *(float *)&v42 = *(double *)(v38 + 16);
      *(_DWORD *)(j + 40) = LODWORD(v42);
      *(float *)(j + 44) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 48) = 0;
      *(int32x2_t *)(j + 52) = vzip1_s32(*(int32x2_t *)(v38 + 24), (int32x2_t)vsub_f32(*(float32x2_t *)(v38 + 24), *(float32x2_t *)(v38 + 24)));
      *(_DWORD *)(j + 60) = 0;
      LODWORD(v42) = *(_DWORD *)(v38 + 28);
      *(_DWORD *)(j + 64) = LODWORD(v42);
      *(float *)(j + 68) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 72) = 0;
      LODWORD(v42) = *(_DWORD *)v39;
      *(_DWORD *)(j + 76) = *(_DWORD *)v39;
      *(float *)(j + 80) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 84) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 56);
      *(_DWORD *)(j + 88) = LODWORD(v42);
      *(float *)(j + 92) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 96) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 60);
      *(_DWORD *)(j + 100) = LODWORD(v42);
      *(float *)(j + 104) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 108) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 64);
      *(_DWORD *)(j + 112) = LODWORD(v42);
      *(float *)(j + 116) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 120) = 0;
      *(int32x2_t *)(j + 124) = vzip1_s32(*(int32x2_t *)(v39 + 72), (int32x2_t)vsub_f32(*(float32x2_t *)(v39 + 72), *(float32x2_t *)(v39 + 72)));
      *(_DWORD *)(j + 132) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 76);
      *(_DWORD *)(j + 136) = LODWORD(v42);
      *(float *)(j + 140) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 144) = 0;
      *(int32x2_t *)(j + 148) = vzip1_s32(*(int32x2_t *)(v39 + 4), (int32x2_t)vsub_f32(*(float32x2_t *)(v39 + 4), *(float32x2_t *)(v39 + 4)));
      *(_DWORD *)(j + 156) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 8);
      *(_DWORD *)(j + 160) = LODWORD(v42);
      *(float *)(j + 164) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 168) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 12);
      *(_DWORD *)(j + 172) = LODWORD(v42);
      *(float *)(j + 176) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 180) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 16);
      *(_DWORD *)(j + 184) = LODWORD(v42);
      *(float *)(j + 188) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 192) = 0;
      *(int32x2_t *)(j + 196) = vzip1_s32(*(int32x2_t *)(v39 + 20), (int32x2_t)vsub_f32(*(float32x2_t *)(v39 + 20), *(float32x2_t *)(v39 + 20)));
      *(_DWORD *)(j + 204) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 24);
      *(_DWORD *)(j + 208) = LODWORD(v42);
      *(float *)(j + 212) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 216) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 28);
      *(_DWORD *)(j + 220) = LODWORD(v42);
      *(float *)(j + 224) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 228) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 32);
      *(_DWORD *)(j + 232) = LODWORD(v42);
      *(float *)(j + 236) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 240) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 36);
      *(_DWORD *)(j + 244) = LODWORD(v42);
      *(float *)(j + 248) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 252) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 40);
      *(_DWORD *)(j + 256) = LODWORD(v42);
      *(float *)(j + 260) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 264) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 44);
      *(_DWORD *)(j + 268) = LODWORD(v42);
      *(float *)(j + 272) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 276) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 48);
      *(_DWORD *)(j + 280) = LODWORD(v42);
      *(float *)(j + 284) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 288) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 80);
      *(_DWORD *)(j + 292) = LODWORD(v42);
      *(float *)(j + 296) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 300) = 0;
      v38 += 32;
      j += 307;
      v39 += 160;
    }
    v43 = v30;
    kdebug_trace();

  }
  lastUpdateTime = v256->_lastUpdateTime;
  if (lastUpdateTime > a3)
  {
    if (lastUpdateTime + -0.1 <= a3)
    {
      if (lastUpdateTime >= a3)
        a3 = v256->_lastUpdateTime;
    }
    else
    {
      -[PXGAnimator _stopAllAnimations](v256, "_stopAllAnimations");
    }
  }
  v257 = v256;
  kdebug_trace();

  objc_msgSend(v274, "removeAllAnimations");
  objc_msgSend(v274, "removeAllTransitions");
  if (v254)
  {
    -[PXGAnimationDataStore setMappedSpriteCount:](v257->_animationDataStore, "setMappedSpriteCount:", 0);
    -[PXGAnimationDataStore increaseMappedSpriteCountBy:usingAnimationIndex:](v257->_animationDataStore, "increaseMappedSpriteCountBy:usingAnimationIndex:", objc_msgSend(v274, "numberOfSprites"), 0);
    v45 = -[PXGAnimationDataStore animationIndexBySpriteIndex](v257->_animationDataStore, "animationIndexBySpriteIndex");
    objc_msgSend(v273, "allKeys");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "sortedArrayUsingComparator:", &__block_literal_global_6635);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v341 = 0u;
    v340 = 0u;
    v339 = 0u;
    v338 = 0u;
    v48 = v47;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v338, v366, 16);
    if (v49)
    {
      v50 = *(_QWORD *)v339;
      while (2)
      {
        for (k = 0; k != v49; ++k)
        {
          if (*(_QWORD *)v339 != v50)
            objc_enumerationMutation(v48);
          v52 = *(void **)(*((_QWORD *)&v338 + 1) + 8 * k);
          objc_msgSend(v273, "objectForKeyedSubscript:", v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "layout");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v54)
          {

            goto LABEL_47;
          }
          v55 = objc_msgSend(v52, "integerValue");
          if (objc_msgSend(v53, "scope") == 2)
            v56 = objc_msgSend(v54, "localNumberOfSprites");
          else
            v56 = objc_msgSend(v54, "numberOfSprites");
          v57 = objc_msgSend(v274, "convertSpriteIndexRange:fromDescendantLayout:", v56 << 32, v54);
          v58 = (HIDWORD(v57) + v57);
          if (v58 > v57)
          {
            v59 = v58 - v57;
            v60 = (_WORD *)(v45 + 2 * v57);
            do
            {
              *v60++ = v55;
              --v59;
            }
            while (v59);
          }

        }
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v338, v366, 16);
        if (v49)
          continue;
        break;
      }
    }
LABEL_47:

  }
  v332 = 0;
  v333 = &v332;
  v334 = 0x3032000000;
  v335 = __Block_byref_object_copy__6636;
  v336 = __Block_byref_object_dispose__6637;
  v337 = v245;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_14;
  aBlock[3] = &unk_1E5148AA8;
  v331 = &v332;
  v330 = v337;
  v240 = (void (**)(void))_Block_copy(aBlock);
  if (v254)
  {
    objc_msgSend((id)v333[5], "removedSpriteIndexes");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v333[5], "insertedSpriteIndexes");
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v269, "count") && objc_msgSend(v266, "count"))
    {
      objc_msgSend(v273, "allValues");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      PXFilter();
      v237 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v237, "count"))
      {
        __b = 0;
        v62 = objc_msgSend(v269, "count");
        _PXGArrayResize();
        if (v62)
          memset(__b, 255, 4 * v62);
        v264 = v255;
        v262 = v253;
        v325 = 0u;
        v326 = 0u;
        v327 = 0u;
        v328 = 0u;
        obj = v237;
        v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v325, v365, 16);
        if (v63)
        {
          v260 = *(_QWORD *)v326;
          do
          {
            v271 = v63;
            for (m = 0; m != v271; ++m)
            {
              if (*(_QWORD *)v326 != v260)
                objc_enumerationMutation(obj);
              v65 = *(void **)(*((_QWORD *)&v325 + 1) + 8 * m);
              objc_msgSend(v65, "delegate");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = objc_retainAutorelease(v264);
              v68 = objc_msgSend(v67, "geometries");
              v69 = objc_retainAutorelease(v67);
              v70 = objc_msgSend(v69, "styles");
              v71 = objc_msgSend(objc_retainAutorelease(v69), "infos");
              v72 = objc_retainAutorelease(v262);
              v73 = objc_msgSend(v72, "geometries");
              v74 = objc_retainAutorelease(v72);
              objc_msgSend(v66, "animation:updateSpriteTransferMap:forSpritesRemovedFromIndexes:presentedGeometries:styles:infos:spritesInsertedToIndexes:targetGeometries:styles:infos:rootLayout:", v65, __b, v269, v68, v70, v71, v266, v73, objc_msgSend(v74, "styles"), objc_msgSend(objc_retainAutorelease(v74), "infos"), v274);

            }
            v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v325, v365, 16);
          }
          while (v63);
        }

        v240[2]();
        objc_msgSend((id)v333[5], "applySpriteTransferMap:", __b);
        free(__b);

      }
    }

  }
  __b = 0;
  p_b = &__b;
  v321 = 0x3032000000;
  v322 = __Block_byref_object_copy__6636;
  v323 = __Block_byref_object_dispose__6637;
  v324 = (id)v333[5];
  v318[0] = MEMORY[0x1E0C809B0];
  v318[1] = 3221225472;
  v318[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_3;
  v318[3] = &unk_1E51173F0;
  v318[4] = &__b;
  v318[5] = &v332;
  v265 = (void (**)(void))_Block_copy(v318);
  v75 = v257;
  if (v257->_numberOfProlongatedSprites)
  {
    v265[2]();
    objc_msgSend(p_b[5], "increaseNumberOfSpritesBy:", v257->_numberOfProlongatedSprites);
    -[PXGAnimationDataStore spriteIndexesExpiringAtTime:](v257->_animationDataStore, "spriteIndexesExpiringAtTime:", a3);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v76, "count"))
    {
      objc_msgSend(p_b[5], "removeSpritesAtIndexes:", v76);
      v257->_numberOfProlongatedSprites -= objc_msgSend(v76, "count");
    }

    v75 = v257;
    numberOfProlongatedSprites = v257->_numberOfProlongatedSprites;
  }
  else
  {
    numberOfProlongatedSprites = 0;
  }
  -[PXGAnimationDataStore increaseMappedSpriteCountBy:usingAnimationIndex:](v75->_animationDataStore, "increaseMappedSpriteCountBy:usingAnimationIndex:", numberOfProlongatedSprites, 0);
  v78 = -[PXGAnimationDataStore animationIndexBySpriteIndex](v75->_animationDataStore, "animationIndexBySpriteIndex");
  LODWORD(v79) = *(_DWORD *)off_1E50B8378;
  v80 = *((unsigned int *)off_1E50B8378 + 1);
  if (v254)
  {
    objc_msgSend((id)v333[5], "removedSpriteIndexes");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v81, "count"))
    {
      v265[2]();
      v79 = objc_msgSend(p_b[5], "replaceRemovalsWithMovesToEndForIndexes:", v81);
      v80 = HIDWORD(v79);
      if (objc_msgSend(v81, "count") != HIDWORD(v79))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v230 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v230, "handleFailureInMethod:object:file:lineNumber:description:", a2, v257, CFSTR("PXGAnimator.m"), 325, CFSTR("unexpected number of prolongated sprites"));

      }
      v257->_numberOfProlongatedSprites += HIDWORD(v79);
    }
    -[PXGAnimationDataStore increaseMappedSpriteCountBy:usingAnimationIndex:](v257->_animationDataStore, "increaseMappedSpriteCountBy:usingAnimationIndex:", v80, 0);
    v272 = -[PXGAnimationDataStore animationIndexBySpriteIndex](v257->_animationDataStore, "animationIndexBySpriteIndex");
    v312 = 0;
    v313 = &v312;
    v314 = 0x3032000000;
    v315 = __Block_byref_object_copy__6636;
    v316 = __Block_byref_object_dispose__6637;
    v317 = 0;
    objc_msgSend((id)v333[5], "modifiedSpriteIndexes");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v304[0] = MEMORY[0x1E0C809B0];
    v304[1] = 3221225472;
    v304[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_4;
    v304[3] = &unk_1E5117438;
    v83 = v82;
    v311 = v272;
    v305 = v83;
    v306 = v257;
    v307 = v255;
    v309 = &__b;
    v308 = v274;
    v310 = &v312;
    objc_msgSend(v273, "enumerateKeysAndObjectsUsingBlock:", v304);
    -[PXGSpriteDataStore setCount:](v257->_doubleSidedSpriteDataStore, "setCount:", 0);
    -[PXGSpriteDataStore setCount:](v257->_oldAnimationPresentationSpriteDataStore, "setCount:", 0);
    if (objc_msgSend((id)v313[5], "count"))
    {
      v265[2]();
      v84 = objc_msgSend(p_b[5], "splitIndexesIntoMovesToEndAndReinsertions:", v313[5]);
      v85 = HIDWORD(v84);
      if (objc_msgSend((id)v313[5], "count") != HIDWORD(v84))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v231, "handleFailureInMethod:object:file:lineNumber:description:", a2, v257, CFSTR("PXGAnimator.m"), 415, CFSTR("unexpected number of prolongated sprites"));

      }
      v257->_numberOfProlongatedSprites += HIDWORD(v84);
      if ((_DWORD)v79 == -1)
      {
        LODWORD(v79) = v84;
        v80 = HIDWORD(v84);
      }
      else
      {
        if ((_DWORD)v80 + (_DWORD)v79 != (_DWORD)v84)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromPXGSpriteIndexRange();
          v233 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromPXGSpriteIndexRange();
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v232, "handleFailureInMethod:object:file:lineNumber:description:", a2, v257, CFSTR("PXGAnimator.m"), 420, CFSTR("prolongated sprite ranges are disjoint %@ %@"), v233, v234);

        }
        LODWORD(v80) = v80 + v85;
      }
      v302[0] = 0;
      v302[1] = v302;
      v302[2] = 0x2020000000;
      v303 = 0;
      v303 = -[PXGAnimationDataStore mappedSpriteCount](v257->_animationDataStore, "mappedSpriteCount");
      -[PXGAnimationDataStore setMappedSpriteCount:](v257->_animationDataStore, "setMappedSpriteCount:", (v80 + v79));
      v86 = -[PXGAnimationDataStore animationIndexBySpriteIndex](v257->_animationDataStore, "animationIndexBySpriteIndex");
      v87 = (void *)v313[5];
      v301[0] = MEMORY[0x1E0C809B0];
      v301[1] = 3221225472;
      v301[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_6;
      v301[3] = &unk_1E51209B0;
      v301[5] = v86;
      v301[4] = v302;
      objc_msgSend(v87, "enumerateIndexesUsingBlock:", v301);
      v261 = v80;
      v272 = v86;
      _Block_object_dispose(v302, 8);
    }
    else
    {
      v261 = v80;
    }

    _Block_object_dispose(&v312, 8);
  }
  else
  {
    v261 = *((_DWORD *)off_1E50B8378 + 1);
    v272 = v78;
  }
  *a10 = objc_retainAutorelease(p_b[5]);
  -[PXGAnimationDataStore applySpriteChangeDetails:](v257->_animationDataStore, "applySpriteChangeDetails:", p_b[5]);
  objc_msgSend(v255, "applyChangeDetails:", p_b[5]);
  objc_msgSend(v252, "applyChangeDetails:", p_b[5]);
  v88 = objc_msgSend(v255, "count");
  if (objc_msgSend(v252, "count") != v88)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v225, "handleFailureInMethod:object:file:lineNumber:description:", a2, v257, CFSTR("PXGAnimator.m"), 441, CFSTR("unexpected animation target sprite data store count %li (expected: %li)"), objc_msgSend(v252, "count"), v88);

  }
  if (-[PXGAnimationDataStore spriteCount](v257->_animationDataStore, "spriteCount") != v88)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v226, "handleFailureInMethod:object:file:lineNumber:description:", a2, v257, CFSTR("PXGAnimator.m"), 442, CFSTR("unexpected animation data store sprite count %li (expected: %li)"), -[PXGAnimationDataStore spriteCount](v257->_animationDataStore, "spriteCount"), v88);

  }
  if (v254 && -[PXGAnimationDataStore mappedSpriteCount](v257->_animationDataStore, "mappedSpriteCount") != v88)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v227, "handleFailureInMethod:object:file:lineNumber:description:", a2, v257, CFSTR("PXGAnimator.m"), 444, CFSTR("unexpected animation data store mapped sprite count %li (expected: %li)"), -[PXGAnimationDataStore mappedSpriteCount](v257->_animationDataStore, "mappedSpriteCount"), v88);

  }
  v89 = v257;
  kdebug_trace();

  v300[0] = MEMORY[0x1E0C809B0];
  v300[1] = 3221225472;
  v300[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_7;
  v300[3] = &unk_1E5117460;
  *(double *)&v300[5] = a3;
  v300[4] = v89;
  v90 = _Block_copy(v300);
  v91 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[PXGAnimationDataStore activeGroupIndexes](v257->_animationDataStore, "activeGroupIndexes");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v297[0] = MEMORY[0x1E0C809B0];
  v297[1] = 3221225472;
  v297[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_8;
  v297[3] = &unk_1E5121628;
  v297[4] = v89;
  v93 = v90;
  v299 = v93;
  v270 = v91;
  v298 = v270;
  objc_msgSend(v92, "enumerateIndexesUsingBlock:", v297);

  if (x != *MEMORY[0x1E0C9D538] || y != *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    v94 = v89;
    kdebug_trace();

    v95 = objc_retainAutorelease(v255);
    v96 = (float64x2_t *)objc_msgSend(v95, "geometries");
    v97 = objc_msgSend(objc_retainAutorelease(v95), "styles");
    v98 = -[PXGAnimationDataStore spriteInfos](v257->_animationDataStore, "spriteInfos");
    v99.f64[0] = x;
    v99.f64[1] = y;
    v100 = vcvt_f32_f64(v99);
    if (v88)
    {
      v101 = vcvtq_f64_f32(v100);
      v102 = (float32x2_t *)(v97 + 20);
      v103 = v88;
      do
      {
        *v96 = vaddq_f64(*v96, v101);
        v96 += 2;
        *(float32x2_t *)&v104 = vadd_f32(*v102, v100);
        *((_QWORD *)&v104 + 1) = vextq_s8(*(int8x16_t *)v102->f32, *(int8x16_t *)v102->f32, 8uLL).u64[0];
        *(_OWORD *)v102->f32 = v104;
        v102 += 20;
        *(double *)v98 = *(double *)v98 + v101.f64[0];
        *(double *)(v98 + 20) = *(double *)(v98 + 20) + v101.f64[1];
        *(float *)(v98 + 196) = *(float *)(v98 + 196) + v100.f32[0];
        *(float *)(v98 + 208) = *(float *)(v98 + 208) + v100.f32[1];
        v98 += 307;
        --v103;
      }
      while (v103);
    }
    v267 = v100;
    v105 = v257->_numberOfProlongatedSprites;
    v106 = objc_retainAutorelease(v252);
    v107 = objc_msgSend(v106, "geometries");
    v108 = objc_msgSend(objc_retainAutorelease(v106), "styles");
    if ((_DWORD)v105)
    {
      v109 = v88 - v105;
      v110 = (float64x2_t *)(v107 + 32 * v109);
      v111 = vcvtq_f64_f32(v267);
      v112 = (float32x2_t *)(v108 + 160 * v109 + 20);
      do
      {
        *v110 = vaddq_f64(*v110, v111);
        v110 += 2;
        *(float32x2_t *)&v113 = vadd_f32(*v112, v267);
        *((_QWORD *)&v113 + 1) = vextq_s8(*(int8x16_t *)v112->f32, *(int8x16_t *)v112->f32, 8uLL).u64[0];
        *(_OWORD *)v112->f32 = v113;
        v112 += 20;
        --v105;
      }
      while (v105);
    }
    v114 = v94;
    kdebug_trace();

  }
  v115 = v89;
  kdebug_trace();

  v116 = objc_msgSend(v253, "count");
  v117 = objc_retainAutorelease(v252);
  v118 = (void *)objc_msgSend(v117, "entities");
  v119 = objc_retainAutorelease(v253);
  memcpy(v118, (const void *)objc_msgSend(v119, "entities"), 4 * v116);
  v120 = objc_retainAutorelease(v117);
  v121 = (void *)objc_msgSend(v120, "geometries");
  v122 = objc_retainAutorelease(v119);
  v123 = v116;
  memcpy(v121, (const void *)objc_msgSend(v122, "geometries"), 32 * v116);
  v124 = objc_retainAutorelease(v120);
  v125 = (void *)objc_msgSend(v124, "styles");
  v126 = objc_retainAutorelease(v122);
  memcpy(v125, (const void *)objc_msgSend(v126, "styles"), 160 * v123);
  v268 = objc_retainAutorelease(v124);
  memcpy((void *)objc_msgSend(v268, "infos"), (const void *)objc_msgSend(objc_retainAutorelease(v126), "infos"), 40 * v123);
  v127 = v115;
  kdebug_trace();

  v128 = v127;
  kdebug_trace();

  -[PXGAnimationDataStore setMappedAnimationCount:](v257->_animationDataStore, "setMappedAnimationCount:", 0);
  -[PXGAnimationDataStore setMappedAnimationCount:](v257->_animationDataStore, "setMappedAnimationCount:", 2 * (v254 & 0x7FFF));
  v129 = -[PXGAnimationDataStore groupIndexByAnimationIndex](v257->_animationDataStore, "groupIndexByAnimationIndex");
  objc_msgSend(v128, "speed");
  v131 = v130;
  UIAnimationDragCoefficient();
  v288[0] = MEMORY[0x1E0C809B0];
  v288[1] = 3221225472;
  v288[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_9;
  v288[3] = &unk_1E5117488;
  v292 = x;
  v293 = y;
  v294 = v131 * v132;
  v295 = a3;
  obja = v274;
  v289 = obja;
  v290 = v128;
  v250 = v93;
  v291 = v250;
  v296 = v129;
  objc_msgSend(v273, "enumerateKeysAndObjectsUsingBlock:", v288);
  -[PXGAnimationDataStore activeGroupIndexes](v257->_animationDataStore, "activeGroupIndexes");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v133, "count"))
    objc_msgSend(v128[5], "setCount:", objc_msgSend(v133, "lastIndex") + 1);
  v134 = v128;
  kdebug_trace();
  v263 = v133;

  v135 = -[PXGAnimationDataStore groupInfos](v257->_animationDataStore, "groupInfos");
  v136 = v134;
  kdebug_trace();

  if (v254)
  {
    objc_msgSend(v136[5], "removeAllIndexes");
    v247 = objc_msgSend(v136[5], "indexSetReferences");
    v137 = objc_retainAutorelease(v268);
    v138 = objc_msgSend(v137, "entities");
    v139 = objc_retainAutorelease(v137);
    v243 = objc_msgSend(v139, "geometries");
    v140 = objc_retainAutorelease(v139);
    v238 = objc_msgSend(v140, "styles");
    v236 = objc_msgSend(objc_retainAutorelease(v140), "infos");
    v141 = objc_retainAutorelease(v255);
    v235 = objc_msgSend(v141, "entities");
    v142 = objc_retainAutorelease(v141);
    v143 = objc_msgSend(v142, "geometries");
    v144 = objc_retainAutorelease(v142);
    v145 = objc_msgSend(v144, "styles");
    v146 = objc_msgSend(objc_retainAutorelease(v144), "infos");
    objc_msgSend(p_b[5], "insertedSpriteIndexes");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v283[0] = MEMORY[0x1E0C809B0];
    v283[1] = 3221225472;
    v283[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_11;
    v283[3] = &__block_descriptor_120_e24_v32__0__NSRange_QQ_8_B24l;
    v283[4] = v235;
    v283[5] = v138;
    v283[6] = v143;
    v283[7] = v243;
    v283[8] = v145;
    v283[9] = v238;
    v283[10] = v146;
    v283[11] = v236;
    v283[12] = v129;
    v283[13] = v272;
    v283[14] = v247;
    objc_msgSend(v147, "enumerateRangesUsingBlock:", v283);

    v282[0] = MEMORY[0x1E0C809B0];
    v282[1] = 3221225472;
    v282[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_12;
    v282[3] = &unk_1E51174D0;
    v282[6] = v247;
    v282[7] = v143;
    v282[8] = v145;
    v282[9] = v146;
    v282[10] = v243;
    v282[11] = v238;
    v282[12] = v236;
    v282[4] = v136;
    v282[5] = v135;
    objc_msgSend(v263, "enumerateIndexesUsingBlock:", v282);
  }
  else
  {
    objc_msgSend(p_b[5], "insertedSpriteIndexes");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v284[0] = MEMORY[0x1E0C809B0];
    v284[1] = 3221225472;
    v284[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_10;
    v284[3] = &unk_1E5118B68;
    v285 = v268;
    v286 = v255;
    v287 = v136;
    objc_msgSend(v148, "enumerateRangesUsingBlock:", v284);

  }
  v149 = v136;
  kdebug_trace();

  if (v261)
  {
    v150 = v149;
    kdebug_trace();

    objc_msgSend(v150[5], "removeAllIndexes");
    v151 = objc_msgSend(v150[5], "indexSetReferences");
    v152 = objc_msgSend(objc_retainAutorelease(p_b[5]), "spriteIndexAfterChangeBySpriteIndexBeforeChange");
    objc_msgSend(p_b[5], "inverse");
    v153 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v154 = objc_msgSend(v153, "spriteIndexAfterChangeBySpriteIndexBeforeChange");

    if (!v152)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v228, "handleFailureInMethod:object:file:lineNumber:description:", a2, v150, CFSTR("PXGAnimator.m"), 823, CFSTR("missing forward sprite index map"));

    }
    if (!v154)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v229, "handleFailureInMethod:object:file:lineNumber:description:", a2, v150, CFSTR("PXGAnimator.m"), 824, CFSTR("missing reverse sprite index map"));

    }
    v248 = v149;
    v155 = v152;
    v156 = v261;
    v157 = -[PXGAnimationDataStore spriteInfos](v257->_animationDataStore, "spriteInfos")
         + 307 * v79
         + 306;
    v158 = v272;
    do
    {
      *v157 |= 1u;
      objc_msgSend(*(id *)(v151 + 8 * *(unsigned __int16 *)(v129 + 2 * *(unsigned __int16 *)(v158 + 2 * v79))), "addIndex:", *(unsigned int *)(v154 + 4 * v79));
      LODWORD(v79) = v79 + 1;
      v157 += 307;
      --v156;
      v158 = v272;
    }
    while (v156);
    v277[0] = MEMORY[0x1E0C809B0];
    v277[1] = 3221225472;
    v277[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_14;
    v277[3] = &unk_1E5117520;
    v279 = v135;
    v280 = v151;
    v281 = v155;
    v278 = v268;
    objc_msgSend(v263, "enumerateIndexesUsingBlock:", v277);
    v159 = v150;
    kdebug_trace();

    v149 = v248;
  }
  if (v254)
  {
    v160 = v149;
    kdebug_trace();

    v161 = objc_retainAutorelease(v255);
    v162 = objc_msgSend(v161, "geometries");
    v163 = objc_msgSend(objc_retainAutorelease(v161), "styles");
    v164 = objc_retainAutorelease(v268);
    v165 = objc_msgSend(v164, "geometries");
    v166 = objc_msgSend(objc_retainAutorelease(v164), "styles");
    v167 = -[PXGAnimationDataStore spriteInfos](v257->_animationDataStore, "spriteInfos");
    v168 = v272;
    if (v88)
    {
      v169 = 0;
      do
      {
        if (*(double *)v165 == *(double *)v167)
        {
          v170 = *(double *)(v167 + 20);
          if (*(double *)(v165 + 8) == v170 && *(double *)(v165 + 16) == *(float *)(v167 + 40))
          {
            v171 = *(_QWORD *)(v165 + 24);
            if (*(float *)&v171 == *(float *)(v167 + 52)
              && *((float *)&v171 + 1) == *(float *)(v167 + 64)
              && *(float *)v166 == *(float *)(v167 + 76)
              && *(float *)(v166 + 56) == *(float *)(v167 + 88)
              && *(float *)(v166 + 60) == *(float *)(v167 + 100)
              && *(float *)(v166 + 64) == *(float *)(v167 + 112))
            {
              v172 = *(_QWORD *)(v166 + 72);
              if (*(float *)&v172 == *(float *)(v167 + 124) && *((float *)&v172 + 1) == *(float *)(v167 + 136))
              {
                v173 = *(_OWORD *)(v166 + 4);
                if (*(float *)&v173 == *(float *)(v167 + 148))
                {
                  if (*((float *)&v173 + 1) == *(float *)(v167 + 160)
                    && *((float *)&v173 + 2) == *(float *)(v167 + 172)
                    && *((float *)&v173 + 3) == *(float *)(v167 + 184)
                    && (v174 = *(_OWORD *)(v166 + 20), *(float *)&v174 == *(float *)(v167 + 196))
                    && *((float *)&v174 + 1) == *(float *)(v167 + 208)
                    && *((float *)&v174 + 2) == *(float *)(v167 + 220)
                    && *((float *)&v174 + 3) == *(float *)(v167 + 232)
                    && *(float *)(v166 + 36) == *(float *)(v167 + 244)
                    && *(float *)(v166 + 40) == *(float *)(v167 + 256)
                    && *(float *)(v166 + 44) == *(float *)(v167 + 268)
                    && *(float *)(v166 + 48) == *(float *)(v167 + 280))
                  {
                    v168 = v272;
                    if (*(float *)(v166 + 80) == *(float *)(v167 + 292))
                      goto LABEL_144;
                  }
                  else
                  {
                    v168 = v272;
                  }
                }
              }
            }
          }
        }
        else
        {
          v170 = *(double *)(v167 + 20);
        }
        v175 = (float *)(v135 + 76 * *(unsigned __int16 *)(v167 + 304));
        v176 = v175[6];
        v177 = v175[9];
        v178 = v175[10];
        *(double *)v162 = *(double *)v167
                        + v177 * *(double *)(v167 + 8)
                        + (float)(v178 * *(float *)(v167 + 16))
                        + v176 * *(double *)(v167 + 8);
        *(double *)(v162 + 8) = v170
                              + v177 * *(double *)(v167 + 28)
                              + (float)(v178 * *(float *)(v167 + 36))
                              + v176 * *(double *)(v167 + 28);
        *(double *)(v162 + 16) = (float)((float)((float)(*(float *)(v167 + 40) + (float)(v177 * *(float *)(v167 + 44)))
                                               + (float)(v178 * *(float *)(v167 + 48)))
                                       + (float)(v176 * *(float *)(v167 + 44)));
        *(float *)&v179 = (float)((float)(*(float *)(v167 + 52) + (float)(v177 * *(float *)(v167 + 56)))
                                + (float)(v178 * *(float *)(v167 + 60)))
                        + (float)(v176 * *(float *)(v167 + 56));
        *(_DWORD *)(v162 + 24) = v179;
        *((float *)&v179 + 1) = (float)((float)(*(float *)(v167 + 64) + (float)(v175[9] * *(float *)(v167 + 68)))
                                      + (float)(v175[10] * *(float *)(v167 + 72)))
                              + (float)(v176 * *(float *)(v167 + 68));
        *(_QWORD *)(v162 + 24) = v179;
        v180 = v175[9];
        v181 = v175[10];
        *(float *)v163 = (float)((float)(*(float *)(v167 + 76) + (float)(v180 * *(float *)(v167 + 80)))
                               + (float)(v181 * *(float *)(v167 + 84)))
                       + (float)(v176 * *(float *)(v167 + 80));
        *(float *)(v163 + 56) = (float)((float)(*(float *)(v167 + 88) + (float)(v180 * *(float *)(v167 + 92)))
                                      + (float)(v181 * *(float *)(v167 + 96)))
                              + (float)(v176 * *(float *)(v167 + 92));
        *(float *)(v163 + 60) = (float)((float)(*(float *)(v167 + 100) + (float)(v180 * *(float *)(v167 + 104)))
                                      + (float)(v181 * *(float *)(v167 + 108)))
                              + (float)(v176 * *(float *)(v167 + 104));
        *(float *)(v163 + 64) = (float)((float)(*(float *)(v167 + 112) + (float)(v180 * *(float *)(v167 + 116)))
                                      + (float)(v181 * *(float *)(v167 + 120)))
                              + (float)(v176 * *(float *)(v167 + 116));
        *(float *)&v179 = (float)((float)(*(float *)(v167 + 124) + (float)(v180 * *(float *)(v167 + 128)))
                                + (float)(v181 * *(float *)(v167 + 132)))
                        + (float)(v176 * *(float *)(v167 + 128));
        *(_DWORD *)(v163 + 72) = v179;
        *((float *)&v179 + 1) = (float)((float)(*(float *)(v167 + 136) + (float)(v175[9] * *(float *)(v167 + 140)))
                                      + (float)(v175[10] * *(float *)(v167 + 144)))
                              + (float)(v176 * *(float *)(v167 + 140));
        *(_QWORD *)(v163 + 72) = v179;
        v182 = *(_OWORD *)(v163 + 4);
        *(float *)&v182 = (float)((float)(*(float *)(v167 + 148) + (float)(v175[9] * *(float *)(v167 + 152)))
                                + (float)(v175[10] * *(float *)(v167 + 156)))
                        + (float)(v176 * *(float *)(v167 + 152));
        *(_DWORD *)(v163 + 4) = v182;
        *((float *)&v182 + 1) = (float)((float)(*(float *)(v167 + 160) + (float)(v175[9] * *(float *)(v167 + 164)))
                                      + (float)(v175[10] * *(float *)(v167 + 168)))
                              + (float)(v176 * *(float *)(v167 + 164));
        *(_OWORD *)(v163 + 4) = v182;
        *((float *)&v182 + 2) = (float)((float)(*(float *)(v167 + 172) + (float)(v175[9] * *(float *)(v167 + 176)))
                                      + (float)(v175[10] * *(float *)(v167 + 180)))
                              + (float)(v176 * *(float *)(v167 + 176));
        *(_OWORD *)(v163 + 4) = v182;
        *((float *)&v182 + 3) = (float)((float)(*(float *)(v167 + 184) + (float)(v175[9] * *(float *)(v167 + 188)))
                                      + (float)(v175[10] * *(float *)(v167 + 192)))
                              + (float)(v176 * *(float *)(v167 + 188));
        *(_OWORD *)(v163 + 4) = v182;
        v183 = *(_OWORD *)(v163 + 20);
        *(float *)&v183 = (float)((float)(*(float *)(v167 + 196) + (float)(v175[9] * *(float *)(v167 + 200)))
                                + (float)(v175[10] * *(float *)(v167 + 204)))
                        + (float)(v176 * *(float *)(v167 + 200));
        *(_DWORD *)(v163 + 20) = v183;
        *((float *)&v183 + 1) = (float)((float)(*(float *)(v167 + 208) + (float)(v175[9] * *(float *)(v167 + 212)))
                                      + (float)(v175[10] * *(float *)(v167 + 216)))
                              + (float)(v176 * *(float *)(v167 + 212));
        *(_OWORD *)(v163 + 20) = v183;
        *((float *)&v183 + 2) = (float)((float)(*(float *)(v167 + 220) + (float)(v175[9] * *(float *)(v167 + 224)))
                                      + (float)(v175[10] * *(float *)(v167 + 228)))
                              + (float)(v176 * *(float *)(v167 + 224));
        *(_OWORD *)(v163 + 20) = v183;
        *((float *)&v183 + 3) = (float)((float)(*(float *)(v167 + 232) + (float)(v175[9] * *(float *)(v167 + 236)))
                                      + (float)(v175[10] * *(float *)(v167 + 240)))
                              + (float)(v176 * *(float *)(v167 + 236));
        *(_OWORD *)(v163 + 20) = v183;
        *(float *)(v163 + 36) = (float)((float)(*(float *)(v167 + 244) + (float)(v175[9] * *(float *)(v167 + 248)))
                                      + (float)(v175[10] * *(float *)(v167 + 252)))
                              + (float)(v176 * *(float *)(v167 + 248));
        *(float *)(v163 + 40) = (float)((float)(*(float *)(v167 + 256) + (float)(v175[9] * *(float *)(v167 + 260)))
                                      + (float)(v175[10] * *(float *)(v167 + 264)))
                              + (float)(v176 * *(float *)(v167 + 260));
        *(float *)(v163 + 44) = (float)((float)(*(float *)(v167 + 268) + (float)(v175[9] * *(float *)(v167 + 272)))
                                      + (float)(v175[10] * *(float *)(v167 + 276)))
                              + (float)(v176 * *(float *)(v167 + 272));
        *(float *)(v163 + 48) = (float)((float)(*(float *)(v167 + 280) + (float)(v175[9] * *(float *)(v167 + 284)))
                                      + (float)(v175[10] * *(float *)(v167 + 288)))
                              + (float)(v176 * *(float *)(v167 + 284));
        *(float *)(v163 + 80) = (float)((float)(*(float *)(v167 + 292) + (float)(v175[9] * *(float *)(v167 + 296)))
                                      + (float)(v175[10] * *(float *)(v167 + 300)))
                              + (float)(v176 * *(float *)(v167 + 296));
        v184 = *(double *)v162 - *(double *)v165;
        *(_QWORD *)v167 = *(_QWORD *)v165;
        *(double *)(v167 + 8) = v184;
        *(_DWORD *)(v167 + 16) = 0;
        v185 = *(double *)(v162 + 8);
        v186 = *(double *)(v165 + 8);
        *(double *)(v167 + 20) = v186;
        *(double *)(v167 + 28) = v185 - v186;
        *(_DWORD *)(v167 + 36) = 0;
        *(float *)&v185 = *(double *)(v162 + 16);
        *(float *)&v186 = *(double *)(v165 + 16);
        *(_DWORD *)(v167 + 40) = LODWORD(v186);
        *(float *)(v167 + 44) = *(float *)&v185 - *(float *)&v186;
        *(_DWORD *)(v167 + 48) = 0;
        v187 = *(_QWORD *)(v165 + 24);
        *(float *)&v185 = COERCE_FLOAT(*(_QWORD *)(v162 + 24)) - *(float *)&v187;
        *(_DWORD *)(v167 + 52) = v187;
        *(_DWORD *)(v167 + 56) = LODWORD(v185);
        *(_DWORD *)(v167 + 60) = 0;
        LODWORD(v187) = *(_DWORD *)(v165 + 28);
        *(float *)&v185 = *(float *)(v162 + 28) - *(float *)&v187;
        *(_DWORD *)(v167 + 64) = v187;
        *(_DWORD *)(v167 + 68) = LODWORD(v185);
        *(_DWORD *)(v167 + 72) = 0;
        *(float *)&v185 = *(float *)v163 - *(float *)v166;
        *(_DWORD *)(v167 + 76) = *(_DWORD *)v166;
        *(_DWORD *)(v167 + 80) = LODWORD(v185);
        *(_DWORD *)(v167 + 84) = 0;
        LODWORD(v187) = *(_DWORD *)(v166 + 56);
        *(float *)&v185 = *(float *)(v163 + 56) - *(float *)&v187;
        *(_DWORD *)(v167 + 88) = v187;
        *(_DWORD *)(v167 + 92) = LODWORD(v185);
        *(_DWORD *)(v167 + 96) = 0;
        LODWORD(v187) = *(_DWORD *)(v166 + 60);
        *(float *)&v185 = *(float *)(v163 + 60) - *(float *)&v187;
        *(_DWORD *)(v167 + 100) = v187;
        *(_DWORD *)(v167 + 104) = LODWORD(v185);
        *(_DWORD *)(v167 + 108) = 0;
        LODWORD(v187) = *(_DWORD *)(v166 + 64);
        *(float *)&v185 = *(float *)(v163 + 64) - *(float *)&v187;
        *(_DWORD *)(v167 + 112) = v187;
        *(_DWORD *)(v167 + 116) = LODWORD(v185);
        *(_DWORD *)(v167 + 120) = 0;
        LODWORD(v185) = *(_DWORD *)(v166 + 4);
        *(float *)&v187 = *(float *)(v163 + 4) - *(float *)&v185;
        *(_DWORD *)(v167 + 148) = LODWORD(v185);
        *(_DWORD *)(v167 + 152) = v187;
        *(_DWORD *)(v167 + 156) = 0;
        v188 = *(_QWORD *)(v163 + 72);
        v189 = *(_QWORD *)(v166 + 72);
        *(_DWORD *)(v167 + 124) = v189;
        *(float *)(v167 + 128) = *(float *)&v188 - *(float *)&v189;
        *(_DWORD *)(v167 + 132) = 0;
        LODWORD(v189) = *(_DWORD *)(v166 + 76);
        *(float *)&v188 = *(float *)(v163 + 76) - *(float *)&v189;
        *(_DWORD *)(v167 + 136) = v189;
        *(_DWORD *)(v167 + 140) = v188;
        *(_DWORD *)(v167 + 144) = 0;
        LODWORD(v189) = *(_DWORD *)(v166 + 8);
        *(float *)&v188 = *(float *)(v163 + 8) - *(float *)&v189;
        *(_DWORD *)(v167 + 160) = v189;
        *(_DWORD *)(v167 + 164) = v188;
        *(_DWORD *)(v167 + 168) = 0;
        LODWORD(v189) = *(_DWORD *)(v166 + 12);
        *(float *)&v188 = *(float *)(v163 + 12) - *(float *)&v189;
        *(_DWORD *)(v167 + 172) = v189;
        *(_DWORD *)(v167 + 176) = v188;
        *(_DWORD *)(v167 + 180) = 0;
        LODWORD(v189) = *(_DWORD *)(v166 + 16);
        *(float *)&v188 = *(float *)(v163 + 16) - *(float *)&v189;
        *(_DWORD *)(v167 + 184) = v189;
        *(_DWORD *)(v167 + 188) = v188;
        *(_DWORD *)(v167 + 192) = 0;
        LODWORD(v188) = *(_DWORD *)(v166 + 20);
        *(float *)&v189 = *(float *)(v163 + 20) - *(float *)&v188;
        *(_DWORD *)(v167 + 196) = v188;
        *(_DWORD *)(v167 + 200) = v189;
        *(_DWORD *)(v167 + 204) = 0;
        LODWORD(v189) = *(_DWORD *)(v166 + 24);
        *(float *)&v188 = *(float *)(v163 + 24) - *(float *)&v189;
        *(_DWORD *)(v167 + 208) = v189;
        *(_DWORD *)(v167 + 212) = v188;
        *(_DWORD *)(v167 + 216) = 0;
        LODWORD(v189) = *(_DWORD *)(v166 + 28);
        *(float *)&v188 = *(float *)(v163 + 28) - *(float *)&v189;
        *(_DWORD *)(v167 + 220) = v189;
        *(_DWORD *)(v167 + 224) = v188;
        *(_DWORD *)(v167 + 228) = 0;
        LODWORD(v189) = *(_DWORD *)(v166 + 32);
        *(float *)&v188 = *(float *)(v163 + 32) - *(float *)&v189;
        *(_DWORD *)(v167 + 232) = v189;
        *(_DWORD *)(v167 + 236) = v188;
        *(_DWORD *)(v167 + 240) = 0;
        LODWORD(v189) = *(_DWORD *)(v166 + 36);
        *(float *)&v188 = *(float *)(v163 + 36) - *(float *)&v189;
        *(_DWORD *)(v167 + 244) = v189;
        *(_DWORD *)(v167 + 248) = v188;
        *(_DWORD *)(v167 + 252) = 0;
        LODWORD(v188) = *(_DWORD *)(v163 + 40);
        LODWORD(v189) = *(_DWORD *)(v166 + 40);
        *(_DWORD *)(v167 + 256) = v189;
        *(float *)(v167 + 260) = *(float *)&v188 - *(float *)&v189;
        *(_DWORD *)(v167 + 264) = 0;
        LODWORD(v188) = *(_DWORD *)(v163 + 44);
        LODWORD(v189) = *(_DWORD *)(v166 + 44);
        *(_DWORD *)(v167 + 268) = v189;
        *(float *)(v167 + 272) = *(float *)&v188 - *(float *)&v189;
        *(_DWORD *)(v167 + 276) = 0;
        LODWORD(v188) = *(_DWORD *)(v163 + 48);
        LODWORD(v189) = *(_DWORD *)(v166 + 48);
        *(_DWORD *)(v167 + 280) = v189;
        *(float *)(v167 + 284) = *(float *)&v188 - *(float *)&v189;
        *(_DWORD *)(v167 + 288) = 0;
        LODWORD(v188) = *(_DWORD *)(v163 + 80);
        LODWORD(v189) = *(_DWORD *)(v166 + 80);
        *(_DWORD *)(v167 + 292) = v189;
        *(float *)(v167 + 296) = *(float *)&v188 - *(float *)&v189;
        *(_DWORD *)(v167 + 300) = 0;
        *(_WORD *)(v167 + 304) = *(_WORD *)(v129 + 2 * *(unsigned __int16 *)(v168 + 2 * v169));
LABEL_144:
        ++v169;
        v162 += 32;
        v163 += 160;
        v165 += 32;
        v166 += 160;
        v167 += 307;
      }
      while (v169 != v88);
    }
    v190 = v160;
    kdebug_trace();

  }
  v191 = v149;
  kdebug_trace();

  v192 = objc_retainAutorelease(v255);
  v193 = objc_msgSend(v192, "geometries");
  v194 = objc_retainAutorelease(v192);
  v195 = objc_msgSend(v194, "styles");
  v196 = objc_retainAutorelease(v268);
  v197 = objc_msgSend(v196, "geometries");
  v198 = objc_retainAutorelease(v196);
  v199 = objc_msgSend(v198, "styles");
  v200 = -[PXGAnimationDataStore spriteInfos](v257->_animationDataStore, "spriteInfos");
  if (v88)
  {
    v201 = v88;
    do
    {
      v202 = *(double *)v197;
      *(_QWORD *)v200 = *(_QWORD *)v197;
      v203 = *(double *)(v197 + 8);
      *(double *)(v200 + 20) = v203;
      v204 = *(double *)(v197 + 16);
      *(float *)(v200 + 40) = v204;
      v205 = *(_QWORD *)(v197 + 24);
      *(_DWORD *)(v200 + 52) = v205;
      *(_DWORD *)(v200 + 64) = *(_DWORD *)(v197 + 28);
      *(_DWORD *)(v200 + 76) = *(_DWORD *)v199;
      *(_DWORD *)(v200 + 88) = *(_DWORD *)(v199 + 56);
      *(_DWORD *)(v200 + 100) = *(_DWORD *)(v199 + 60);
      *(_DWORD *)(v200 + 112) = *(_DWORD *)(v199 + 64);
      *(_DWORD *)(v200 + 124) = *(_QWORD *)(v199 + 72);
      *(_DWORD *)(v200 + 136) = *(_DWORD *)(v199 + 76);
      *(_DWORD *)(v200 + 148) = *(_DWORD *)(v199 + 4);
      *(_DWORD *)(v200 + 160) = *(_DWORD *)(v199 + 8);
      *(_DWORD *)(v200 + 172) = *(_DWORD *)(v199 + 12);
      *(_DWORD *)(v200 + 184) = *(_DWORD *)(v199 + 16);
      *(_DWORD *)(v200 + 196) = *(_DWORD *)(v199 + 20);
      *(_DWORD *)(v200 + 208) = *(_DWORD *)(v199 + 24);
      *(_DWORD *)(v200 + 220) = *(_DWORD *)(v199 + 28);
      *(_DWORD *)(v200 + 232) = *(_DWORD *)(v199 + 32);
      *(_DWORD *)(v200 + 244) = *(_DWORD *)(v199 + 36);
      *(_DWORD *)(v200 + 256) = *(_DWORD *)(v199 + 40);
      *(_DWORD *)(v200 + 268) = *(_DWORD *)(v199 + 44);
      *(_DWORD *)(v200 + 280) = *(_DWORD *)(v199 + 48);
      *(_DWORD *)(v200 + 292) = *(_DWORD *)(v199 + 80);
      v206 = v135 + 76 * *(unsigned __int16 *)(v200 + 304);
      v207 = *(float *)(v206 + 36);
      v208 = *(float *)(v206 + 40);
      v209 = *(double *)(v200 + 8);
      v210 = v202 + v207 * v209;
      LODWORD(v202) = *(_DWORD *)(v206 + 24);
      *(double *)v193 = v210 + (float)(v208 * *(float *)(v200 + 16)) + *(float *)&v202 * v209;
      *(double *)(v193 + 8) = v203
                            + v207 * *(double *)(v200 + 28)
                            + (float)(v208 * *(float *)(v200 + 36))
                            + *(float *)&v202 * *(double *)(v200 + 28);
      *(double *)(v193 + 16) = (float)((float)((float)(v204 + (float)(v207 * *(float *)(v200 + 44)))
                                             + (float)(v208 * *(float *)(v200 + 48)))
                                     + (float)(*(float *)&v202 * *(float *)(v200 + 44)));
      *(float *)&v205 = (float)((float)(*(float *)&v205 + (float)(v207 * *(float *)(v200 + 56)))
                              + (float)(v208 * *(float *)(v200 + 60)))
                      + (float)(*(float *)&v202 * *(float *)(v200 + 56));
      *(_DWORD *)(v193 + 24) = v205;
      *((float *)&v205 + 1) = (float)((float)(*(float *)(v200 + 64)
                                            + (float)(*(float *)(v206 + 36) * *(float *)(v200 + 68)))
                                    + (float)(*(float *)(v206 + 40) * *(float *)(v200 + 72)))
                            + (float)(*(float *)&v202 * *(float *)(v200 + 68));
      *(_QWORD *)(v193 + 24) = v205;
      LODWORD(v203) = *(_DWORD *)(v206 + 36);
      v211 = *(float *)(v206 + 40);
      *(float *)v195 = (float)((float)(*(float *)(v200 + 76) + (float)(*(float *)&v203 * *(float *)(v200 + 80)))
                             + (float)(v211 * *(float *)(v200 + 84)))
                     + (float)(*(float *)&v202 * *(float *)(v200 + 80));
      *(float *)(v195 + 56) = (float)((float)(*(float *)(v200 + 88) + (float)(*(float *)&v203 * *(float *)(v200 + 92)))
                                    + (float)(v211 * *(float *)(v200 + 96)))
                            + (float)(*(float *)&v202 * *(float *)(v200 + 92));
      *(float *)(v195 + 60) = (float)((float)(*(float *)(v200 + 100) + (float)(*(float *)&v203 * *(float *)(v200 + 104)))
                                    + (float)(v211 * *(float *)(v200 + 108)))
                            + (float)(*(float *)&v202 * *(float *)(v200 + 104));
      *(float *)(v195 + 64) = (float)((float)(*(float *)(v200 + 112) + (float)(*(float *)&v203 * *(float *)(v200 + 116)))
                                    + (float)(v211 * *(float *)(v200 + 120)))
                            + (float)(*(float *)&v202 * *(float *)(v200 + 116));
      *(float *)&v205 = (float)((float)(*(float *)(v200 + 124) + (float)(*(float *)&v203 * *(float *)(v200 + 128)))
                              + (float)(v211 * *(float *)(v200 + 132)))
                      + (float)(*(float *)&v202 * *(float *)(v200 + 128));
      *(_DWORD *)(v195 + 72) = v205;
      *((float *)&v205 + 1) = (float)((float)(*(float *)(v200 + 136)
                                            + (float)(*(float *)(v206 + 36) * *(float *)(v200 + 140)))
                                    + (float)(*(float *)(v206 + 40) * *(float *)(v200 + 144)))
                            + (float)(*(float *)&v202 * *(float *)(v200 + 140));
      *(_QWORD *)(v195 + 72) = v205;
      v212 = *(_OWORD *)(v195 + 4);
      *(float *)&v212 = (float)((float)(*(float *)(v200 + 148) + (float)(*(float *)(v206 + 36) * *(float *)(v200 + 152)))
                              + (float)(*(float *)(v206 + 40) * *(float *)(v200 + 156)))
                      + (float)(*(float *)&v202 * *(float *)(v200 + 152));
      *(_DWORD *)(v195 + 4) = v212;
      *((float *)&v212 + 1) = (float)((float)(*(float *)(v200 + 160)
                                            + (float)(*(float *)(v206 + 36) * *(float *)(v200 + 164)))
                                    + (float)(*(float *)(v206 + 40) * *(float *)(v200 + 168)))
                            + (float)(*(float *)&v202 * *(float *)(v200 + 164));
      *(_OWORD *)(v195 + 4) = v212;
      *((float *)&v212 + 2) = (float)((float)(*(float *)(v200 + 172)
                                            + (float)(*(float *)(v206 + 36) * *(float *)(v200 + 176)))
                                    + (float)(*(float *)(v206 + 40) * *(float *)(v200 + 180)))
                            + (float)(*(float *)&v202 * *(float *)(v200 + 176));
      *(_OWORD *)(v195 + 4) = v212;
      *((float *)&v212 + 3) = (float)((float)(*(float *)(v200 + 184)
                                            + (float)(*(float *)(v206 + 36) * *(float *)(v200 + 188)))
                                    + (float)(*(float *)(v206 + 40) * *(float *)(v200 + 192)))
                            + (float)(*(float *)&v202 * *(float *)(v200 + 188));
      *(_OWORD *)(v195 + 4) = v212;
      v213 = *(_OWORD *)(v195 + 20);
      *(float *)&v213 = (float)((float)(*(float *)(v200 + 196) + (float)(*(float *)(v206 + 36) * *(float *)(v200 + 200)))
                              + (float)(*(float *)(v206 + 40) * *(float *)(v200 + 204)))
                      + (float)(*(float *)&v202 * *(float *)(v200 + 200));
      *(_DWORD *)(v195 + 20) = v213;
      *((float *)&v213 + 1) = (float)((float)(*(float *)(v200 + 208)
                                            + (float)(*(float *)(v206 + 36) * *(float *)(v200 + 212)))
                                    + (float)(*(float *)(v206 + 40) * *(float *)(v200 + 216)))
                            + (float)(*(float *)&v202 * *(float *)(v200 + 212));
      *(_OWORD *)(v195 + 20) = v213;
      *((float *)&v213 + 2) = (float)((float)(*(float *)(v200 + 220)
                                            + (float)(*(float *)(v206 + 36) * *(float *)(v200 + 224)))
                                    + (float)(*(float *)(v206 + 40) * *(float *)(v200 + 228)))
                            + (float)(*(float *)&v202 * *(float *)(v200 + 224));
      *(_OWORD *)(v195 + 20) = v213;
      *((float *)&v213 + 3) = (float)((float)(*(float *)(v200 + 232)
                                            + (float)(*(float *)(v206 + 36) * *(float *)(v200 + 236)))
                                    + (float)(*(float *)(v206 + 40) * *(float *)(v200 + 240)))
                            + (float)(*(float *)&v202 * *(float *)(v200 + 236));
      *(_OWORD *)(v195 + 20) = v213;
      *(float *)(v195 + 36) = (float)((float)(*(float *)(v200 + 244)
                                            + (float)(*(float *)(v206 + 36) * *(float *)(v200 + 248)))
                                    + (float)(*(float *)(v206 + 40) * *(float *)(v200 + 252)))
                            + (float)(*(float *)&v202 * *(float *)(v200 + 248));
      *(float *)(v195 + 40) = (float)((float)(*(float *)(v200 + 256)
                                            + (float)(*(float *)(v206 + 36) * *(float *)(v200 + 260)))
                                    + (float)(*(float *)(v206 + 40) * *(float *)(v200 + 264)))
                            + (float)(*(float *)&v202 * *(float *)(v200 + 260));
      *(float *)(v195 + 44) = (float)((float)(*(float *)(v200 + 268)
                                            + (float)(*(float *)(v206 + 36) * *(float *)(v200 + 272)))
                                    + (float)(*(float *)(v206 + 40) * *(float *)(v200 + 276)))
                            + (float)(*(float *)&v202 * *(float *)(v200 + 272));
      *(float *)(v195 + 48) = (float)((float)(*(float *)(v200 + 280)
                                            + (float)(*(float *)(v206 + 36) * *(float *)(v200 + 284)))
                                    + (float)(*(float *)(v206 + 40) * *(float *)(v200 + 288)))
                            + (float)(*(float *)&v202 * *(float *)(v200 + 284));
      *(float *)(v195 + 80) = (float)((float)(*(float *)(v200 + 292)
                                            + (float)(*(float *)(v206 + 36) * *(float *)(v200 + 296)))
                                    + (float)(*(float *)(v206 + 40) * *(float *)(v200 + 300)))
                            + (float)(*(float *)&v202 * *(float *)(v200 + 296));
      *(_DWORD *)(v195 + 52) = *(_DWORD *)(v199 + 52);
      v214 = *(_OWORD *)(v199 + 96);
      v215 = *(_OWORD *)(v199 + 112);
      v216 = *(_OWORD *)(v199 + 144);
      *(_OWORD *)(v195 + 128) = *(_OWORD *)(v199 + 128);
      *(_OWORD *)(v195 + 144) = v216;
      *(_OWORD *)(v195 + 96) = v214;
      *(_OWORD *)(v195 + 112) = v215;
      *(_WORD *)(v195 + 68) = *(_WORD *)(v199 + 68);
      v197 += 32;
      v200 += 307;
      *(_BYTE *)(v195 + 70) = *(_BYTE *)(v199 + 70);
      v199 += 160;
      v193 += 32;
      v195 += 160;
      --v201;
    }
    while (v201);
  }
  v217 = objc_retainAutorelease(v194);
  v218 = (void *)objc_msgSend(v217, "entities");
  v219 = objc_retainAutorelease(v198);
  memcpy(v218, (const void *)objc_msgSend(v219, "entities"), 4 * v88);
  memcpy((void *)objc_msgSend(objc_retainAutorelease(v217), "infos"), (const void *)objc_msgSend(objc_retainAutorelease(v219), "infos"), 40 * v88);
  v220 = v191;
  kdebug_trace();

  if (objc_msgSend(v270, "count"))
  {
    v221 = -[PXGAnimationDataStore spriteInfos](v257->_animationDataStore, "spriteInfos");
    v276[0] = MEMORY[0x1E0C809B0];
    v276[1] = 3221225472;
    v276[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_16;
    v276[3] = &unk_1E5148928;
    v276[4] = v220;
    objc_msgSend(v270, "enumerateIndexesUsingBlock:", v276);
    if (v88)
    {
      v222 = (unsigned __int16 *)(v221 + 304);
      do
      {
        if (objc_msgSend(v270, "containsIndex:", *v222))
          *v222 = 0;
        v222 = (unsigned __int16 *)((char *)v222 + 307);
        --v88;
      }
      while (v88);
    }
    -[PXGAnimationDataStore checkInGroupAtIndexes:](v257->_animationDataStore, "checkInGroupAtIndexes:", v270);
  }
  -[PXGAnimationDataStore activeGroupIndexes](v257->_animationDataStore, "activeGroupIndexes");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v223, "count"))
    v224 = 1;
  else
    v224 = v257->_numberOfProlongatedSprites != 0;
  objc_msgSend(v220, "setAnimating:", v224);

  objc_msgSend(v220[2], "setInputLayout:", obja);
  *a11 = objc_retainAutorelease(v220[2]);

  _Block_object_dispose(&__b, 8);
  _Block_object_dispose(&v332, 8);

LABEL_163:
  objc_msgSend(v275, "enumerateObjectsUsingBlock:", &__block_literal_global_43);
  -[PXGAnimator setPreviousLayoutSnapshot:](v256, "setPreviousLayoutSnapshot:", v244);
  v256->_lastUpdateTime = a3;

}

- (void)setPreviousLayoutSnapshot:(id)a3
{
  PXGLayoutSnapshot *v5;
  PXGLayoutSnapshot *previousLayoutSnapshot;
  void *v7;
  PXGLayoutSnapshot *v8;

  v5 = (PXGLayoutSnapshot *)a3;
  previousLayoutSnapshot = self->_previousLayoutSnapshot;
  if (previousLayoutSnapshot != v5)
  {
    v8 = v5;
    if (previousLayoutSnapshot)
    {
      -[PXGLayoutSnapshot spriteDataStore](previousLayoutSnapshot, "spriteDataStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGAnimator _returnForReuseSpriteDataStore:](self, "_returnForReuseSpriteDataStore:", v7);

      -[PXGLayoutSnapshot releaseSpriteDataStore](self->_previousLayoutSnapshot, "releaseSpriteDataStore");
    }
    objc_storeStrong((id *)&self->_previousLayoutSnapshot, a3);
    v5 = v8;
  }

}

- (id)_animationByAnimationIndexForAnimations:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __55__PXGAnimator__animationByAnimationIndexForAnimations___block_invoke;
  v12 = &unk_1E5117340;
  v13 = v5;
  v14 = v4;
  v6 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v9);

  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);
  return v7;
}

- (void)_returnForReuseSpriteDataStore:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (-[NSMutableArray containsObject:](self->_reusableSnapshotSpriteDataStores, "containsObject:"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGAnimator.m"), 1068, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![_reusableSnapshotSpriteDataStores containsObject:spriteDataStore]"));

  }
  -[NSMutableArray addObject:](self->_reusableSnapshotSpriteDataStores, "addObject:", v6);

}

- (double)speed
{
  return self->_speed;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  float v11;
  float v12;
  double v13;
  unsigned int v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[44];

  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  objc_msgSend(v5, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animation:prepareWithRootLayout:viewportShift:", v5, *(_QWORD *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));

  objc_msgSend(v5, "effectiveDuration");
  v9 = v8 / *(double *)(a1 + 72);
  *(_QWORD *)&v19 = objc_msgSend(v5, "curve");
  *((double *)&v19 + 1) = v9;
  v21 = COERCE_UNSIGNED_INT64(v9 + *(double *)(a1 + 80));
  *(_QWORD *)v22 = 0;
  *(_DWORD *)&v22[8] = 0;
  v10 = v5;
  *(_QWORD *)&v22[12] = v10;
  objc_msgSend(v10, "transition");
  *(_QWORD *)&v22[20] = objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&v22[28] = 0uLL;
  if (objc_msgSend(v10, "curve") == 2)
  {
    objc_msgSend(v10, "dampingRatio");
    v12 = v11;
    objc_msgSend(v10, "duration");
    PXGDampedSpringGroupParametersConfigure((float *)&v21 + 3, objc_msgSend(v10, "numberOfOscillations"), v12, v13 / *(double *)(a1 + 72));
  }
  v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "checkOutGroup", v19, v21, *(_OWORD *)v22);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v15 = (_OWORD *)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "groupInfos") + 76 * v14);
  *v15 = v20;
  v16 = v21;
  v17 = *(_OWORD *)v22;
  v18 = *(_OWORD *)&v22[16];
  *(_OWORD *)((char *)v15 + 60) = *(_OWORD *)&v22[28];
  v15[2] = v17;
  v15[3] = v18;
  v15[1] = v16;
  *(_WORD *)(*(_QWORD *)(a1 + 88) + 2 * v6) = v14;

}

uint64_t __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "groupInfos");
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);
  return result;
}

uint64_t __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_7(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  int v6;
  int v7;
  double v8;
  float v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  int v15;
  double v16;
  double v17;
  double v18;
  float v19;
  double v20;
  float v21;
  uint64_t v22;
  float v23;
  float v24;
  double v25;
  float v26;
  id v28;
  void *v29;
  float v30;
  float v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  double v38;
  float v39;
  float v40;
  double v41;
  float v42;

  *(_DWORD *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 36) = 0;
  *(_DWORD *)(a2 + 40) = 0;
  v4 = *(id *)(a2 + 52);
  v5 = v4;
  if (!v4)
  {
    v11 = *(double *)(a1 + 40) - *(double *)(a2 + 16);
    goto LABEL_18;
  }
  v6 = objc_msgSend(v4, "isIntercative");
  v7 = objc_msgSend(v5, "animatingTowardsFinalState");
  if (!v6)
  {
    if (v7)
    {
      v11 = *(double *)(a1 + 40) - *(double *)(a2 + 16);
      if (v11 < 0.0)
        goto LABEL_16;
    }
    else
    {
      v15 = objc_msgSend(v5, "animatingTowardsInitialState");
      v10 = *(double *)(a2 + 16);
      if (!v15)
        goto LABEL_14;
      v16 = *(double *)(a2 + 8);
      v17 = v16 - (v10 - *(double *)(a1 + 40));
      v11 = -v17;
      if (v17 < v16)
        goto LABEL_16;
    }
    objc_msgSend(v5, "invalidate");
    goto LABEL_16;
  }
  if (v7)
  {
    objc_msgSend(v5, "setIsIntercative:", 0);
    v8 = *(double *)(a2 + 8);
    objc_msgSend(v5, "fractionCompleted");
    v10 = *(double *)(a1 + 40) + v8 * (1.0 - v9);
    *(double *)(a2 + 16) = v10;
LABEL_14:
    v11 = *(double *)(a1 + 40) - v10;
    goto LABEL_16;
  }
  if (objc_msgSend(v5, "animatingTowardsInitialState"))
  {
    objc_msgSend(v5, "setIsIntercative:", 0);
    v12 = *(double *)(a2 + 8);
    objc_msgSend(v5, "fractionCompleted");
    v14 = *(double *)(a1 + 40) + v12 * v13;
    *(double *)(a2 + 16) = v14;
    v11 = -(*(double *)(a2 + 8) - (v14 - *(double *)(a1 + 40)));
  }
  else
  {
    v18 = *(double *)(a2 + 8);
    objc_msgSend(v5, "fractionCompleted");
    v11 = -(v18 * (1.0 - v19));
  }
LABEL_16:
  if (objc_msgSend(v5, "invalid"))
  {

    *(_QWORD *)(a2 + 52) = 0;
    objc_msgSend(v5, "completionBlock");
    *(_QWORD *)(a2 + 60) = objc_claimAutoreleasedReturnValue();
  }
LABEL_18:
  if (v11 < 0.0)
  {
    v20 = *(double *)(a2 + 8);
    if (v20 > 0.0)
    {
      switch(*(_QWORD *)a2)
      {
        case 0:
          v21 = -v11 / v20;
          goto LABEL_29;
        case 1:
          v24 = v11 / v20 + 1.0;
          if (v24 >= 0.5)
            v25 = (v24 * -2.0 + 4.0) * v24 + -1.0;
          else
            v25 = (v24 + v24) * v24;
          v26 = v25;
          v21 = 1.0 - v26;
LABEL_29:
          *(float *)(a2 + 24) = v21;
          goto LABEL_30;
        case 2:
          v23 = v11 + v20;
          PXGDampedSpringGroupParametersPrepareForTime((float *)(a2 + 28), v23);
          goto LABEL_30;
        case 3:
          v28 = *(id *)(a2 + 44);
          objc_msgSend(v28, "springAnimation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "springAnimationInitialProgress");
          v31 = v30;
          objc_msgSend(v29, "beginTime");
          if (v32 > 0.0)
          {
            objc_msgSend(v29, "beginTime");
            v34 = v33;
            objc_msgSend(v29, "duration");
            v36 = *(double *)(a1 + 40) - (v34 + v35);
            v37 = objc_msgSend(*(id *)(a1 + 32), "preferredFramesPerSecond");
            v38 = 0.0;
            if (v37 >= 2)
              v38 = 1.0 / (double)v37;
            v39 = (v36 + v38) / *(double *)(a2 + 8) + 1.0;
            objc_msgSend(v28, "springAnimationProgressMultiplier");
            v31 = v40 * v39;
          }
          if (v31 > 0.0 && (objc_msgSend(v28, "springAnimationProgressMultiplier"), v31 <= *(float *)&v41))
          {
            *(float *)&v41 = v31;
            objc_msgSend(v29, "_solveForInput:", v41);
            *(float *)(a2 + 24) = 1.0 - v42;
            v22 = 1;
          }
          else
          {
            v22 = 0;
          }

          if (v5)
            goto LABEL_31;
          goto LABEL_32;
        default:
LABEL_30:
          v22 = 1;
          if (v5)
            goto LABEL_31;
          goto LABEL_32;
      }
    }
  }
  v22 = 0;
  if (v5)
LABEL_31:
    v22 = v22 | objc_msgSend(v5, "invalid") ^ 1;
LABEL_32:

  return v22;
}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_12(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v4 = *(id *)(*(_QWORD *)(a1 + 40) + 76 * a2 + 44);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(*(_QWORD *)(a1 + 48) + 8 * a2);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_13;
  v9[3] = &unk_1E513A1E8;
  v13 = *(_OWORD *)(a1 + 56);
  v10 = v5;
  v11 = v4;
  v14 = *(_OWORD *)(a1 + 72);
  v15 = *(_OWORD *)(a1 + 88);
  v12 = *(_QWORD *)(a1 + 32);
  v16 = a2;
  v8 = v4;
  v7 = v5;
  objc_msgSend(v6, "enumerateRangesUsingBlock:", v9);

}

- (PXGAnimator)init
{
  PXGAnimator *v2;
  PXGAnimationDataStore *v3;
  PXGAnimationDataStore *animationDataStore;
  PXGAnimatorLayout *v5;
  PXGAnimatorLayout *animatorLayout;
  PXGIndexSetArray *v7;
  PXGIndexSetArray *spriteIndexesByGroupIndex;
  NSMutableArray *v9;
  NSMutableArray *reusableSnapshotSpriteDataStores;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXGAnimator;
  v2 = -[PXGAnimator init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXGAnimationDataStore);
    animationDataStore = v2->_animationDataStore;
    v2->_animationDataStore = v3;

    v5 = -[PXGAnimatorLayout initWithAnimator:]([PXGAnimatorLayout alloc], "initWithAnimator:", v2);
    animatorLayout = v2->_animatorLayout;
    v2->_animatorLayout = v5;

    v7 = (PXGIndexSetArray *)objc_alloc_init((Class)off_1E50B2A88);
    spriteIndexesByGroupIndex = v2->_spriteIndexesByGroupIndex;
    v2->_spriteIndexesByGroupIndex = v7;

    v2->_speed = 1.0;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    reusableSnapshotSpriteDataStores = v2->_reusableSnapshotSpriteDataStores;
    v2->_reusableSnapshotSpriteDataStores = v9;

  }
  return v2;
}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_17(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setFromSnapshot:", 0);
  objc_msgSend(v2, "setToSnapshot:", 0);

}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setFromSnapshot:", v3);
  objc_msgSend(v4, "setToSnapshot:", *(_QWORD *)(a1 + 40));

}

void __55__PXGAnimator__animationByAnimationIndexForAnimations___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  if (objc_msgSend(v5, "scope"))
    a3 += *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

}

double __61__PXGAnimator_retargetAnimationsAfterStartTime_newStartTime___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  double *v4;
  double v5;
  double result;

  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "groupInfos") + 76 * a2;
  v5 = *(double *)(v3 + 16);
  v4 = (double *)(v3 + 16);
  result = *(v4 - 1);
  if (v5 - result >= *(double *)(a1 + 40))
  {
    result = result + *(double *)(a1 + 48);
    *v4 = result;
  }
  return result;
}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  double v36;
  double v37;
  float v38;
  _OWORD v39[2];
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  _OWORD v44[2];
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  _QWORD v49[6];

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "isDoubleSided"))
  {
    v7 = objc_msgSend(v5, "integerValue");
    v8 = *(void **)(a1 + 32);
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_5;
    v49[3] = &__block_descriptor_48_e12_B24__0Q8_B16l;
    v49[4] = *(_QWORD *)(a1 + 80);
    v49[5] = v7;
    objc_msgSend(v8, "indexesPassingTest:", v49);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    if (!v10)
    {
      v11 = objc_msgSend(off_1E50B2CF8, "newSpriteDataStore");
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(void **)(v12 + 48);
      *(_QWORD *)(v12 + 48) = v11;

      v10 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    }
    if (!objc_msgSend(v10, "count"))
    {
      v14 = *(void **)(a1 + 48);
      if (v14)
      {
        objc_msgSend(v14, "sprites");
      }
      else
      {
        v48 = 0;
        v46 = 0u;
        v47 = 0u;
      }
      v15 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
      v44[0] = v46;
      v44[1] = v47;
      v45 = v48;
      objc_msgSend(v15, "setSprites:", v44);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "applyChangeDetails:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    }
    objc_msgSend(v6, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "animation:doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes:rootLayout:presentedGeometries:styles:infos:", v6, v9, *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "geometries"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "styles"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "infos"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "px_intersectionWithIndexSet:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "count"))
    {
      v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      if (!v19)
      {
        v20 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v22 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = v20;

        v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      }
      objc_msgSend(v19, "addIndexes:", v18);
    }

  }
  if (objc_msgSend(v6, "supportsPresentationAdjustment"))
  {
    v23 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
    if (!v23)
    {
      v24 = objc_msgSend(off_1E50B2CF8, "newSpriteDataStore");
      v25 = *(_QWORD *)(a1 + 40);
      v26 = *(void **)(v25 + 56);
      *(_QWORD *)(v25 + 56) = v24;

      v23 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
    }
    if (!objc_msgSend(v23, "count"))
    {
      v27 = *(void **)(a1 + 48);
      if (v27)
      {
        objc_msgSend(v27, "sprites");
      }
      else
      {
        v43 = 0;
        v41 = 0u;
        v42 = 0u;
      }
      v28 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
      v39[0] = v41;
      v39[1] = v42;
      v40 = v43;
      objc_msgSend(v28, "setSprites:", v39);
    }
    v29 = objc_msgSend(*(id *)(a1 + 48), "count");
    objc_msgSend(v6, "delegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "animation:adjustPresentedGeometries:styles:infos:count:", v6, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "geometries"), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "styles"), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "infos"), v29);

    v31 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "geometries");
    v32 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "styles");
    v33 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "geometries");
    v34 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "styles");
    for (i = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "spriteInfos"); (_DWORD)v29; LODWORD(v29) = v29 - 1)
    {
      v36 = *(double *)(v31 + 8);
      v37 = *(double *)(v33 + 8);
      *(double *)i = *(double *)v33 - *(double *)v31 + *(double *)i;
      *(double *)(i + 20) = v37 - v36 + *(double *)(i + 20);
      v38 = *(double *)(v31 + 16);
      *(float *)&v36 = *(double *)(v33 + 16);
      *(float *)(i + 40) = (float)(*(float *)&v36 - v38) + *(float *)(i + 40);
      *(float *)(i + 52) = (float)(COERCE_FLOAT(*(_QWORD *)(v33 + 24)) - COERCE_FLOAT(*(_QWORD *)(v31 + 24)))
                         + *(float *)(i + 52);
      *(float *)(i + 64) = (float)(*(float *)(v33 + 28) - *(float *)(v31 + 28)) + *(float *)(i + 64);
      *(float *)(i + 76) = (float)(*(float *)v34 - *(float *)v32) + *(float *)(i + 76);
      LODWORD(v36) = *(_DWORD *)(v32 + 60);
      LODWORD(v37) = *(_DWORD *)(v34 + 60);
      *(float *)(i + 88) = (float)(*(float *)(v34 + 56) - *(float *)(v32 + 56)) + *(float *)(i + 88);
      *(float *)(i + 100) = (float)(*(float *)&v37 - *(float *)&v36) + *(float *)(i + 100);
      *(float *)(i + 112) = (float)(*(float *)(v34 + 64) - *(float *)(v32 + 64)) + *(float *)(i + 112);
      *(float *)(i + 124) = (float)(COERCE_FLOAT(*(_QWORD *)(v34 + 72)) - COERCE_FLOAT(*(_QWORD *)(v32 + 72)))
                          + *(float *)(i + 124);
      LODWORD(v36) = *(_DWORD *)(v32 + 80);
      LODWORD(v37) = *(_DWORD *)(v34 + 80);
      *(float *)(i + 136) = (float)(*(float *)(v34 + 76) - *(float *)(v32 + 76)) + *(float *)(i + 136);
      *(float *)(i + 148) = (float)(*(float *)(v34 + 4) - *(float *)(v32 + 4)) + *(float *)(i + 148);
      *(float *)(i + 160) = (float)(*(float *)(v34 + 8) - *(float *)(v32 + 8)) + *(float *)(i + 160);
      *(float *)(i + 172) = (float)(*(float *)(v34 + 12) - *(float *)(v32 + 12)) + *(float *)(i + 172);
      *(float *)(i + 184) = (float)(*(float *)(v34 + 16) - *(float *)(v32 + 16)) + *(float *)(i + 184);
      *(float *)(i + 196) = (float)(*(float *)(v34 + 20) - *(float *)(v32 + 20)) + *(float *)(i + 196);
      *(float *)(i + 208) = (float)(*(float *)(v34 + 24) - *(float *)(v32 + 24)) + *(float *)(i + 208);
      *(float *)(i + 220) = (float)(*(float *)(v34 + 28) - *(float *)(v32 + 28)) + *(float *)(i + 220);
      *(float *)(i + 232) = (float)(*(float *)(v34 + 32) - *(float *)(v32 + 32)) + *(float *)(i + 232);
      *(float *)(i + 244) = (float)(*(float *)(v34 + 36) - *(float *)(v32 + 36)) + *(float *)(i + 244);
      *(float *)(i + 256) = (float)(*(float *)(v34 + 40) - *(float *)(v32 + 40)) + *(float *)(i + 256);
      *(float *)(i + 268) = (float)(*(float *)(v34 + 44) - *(float *)(v32 + 44)) + *(float *)(i + 268);
      *(float *)(i + 280) = (float)(*(float *)(v34 + 48) - *(float *)(v32 + 48)) + *(float *)(i + 280);
      v31 += 32;
      v33 += 32;
      *(float *)(i + 292) = (float)(*(float *)&v37 - *(float *)&v36) + *(float *)(i + 292);
      i += 307;
      v32 += 160;
      v34 += 160;
    }
  }

}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_16(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  _QWORD *v4;
  void (**v5)(_QWORD);
  id v6;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "groupInfos") + 76 * a2;
  v6 = *(id *)(v2 + 44);
  objc_msgSend(v6, "noteDidComplete");

  *(_QWORD *)(v2 + 52) = 0;
  *(_QWORD *)(v2 + 44) = 0;
  objc_msgSend(v6, "setDelegate:", 0);
  v5 = *(void (***)(_QWORD))(v2 + 60);
  v4 = (_QWORD *)(v2 + 60);
  v3 = v5;
  if (v5)
  {
    v3[2](v3);
    *v4 = 0;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];

  -[PXGAnimationDataStore activeGroupIndexes](self->_animationDataStore, "activeGroupIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22__PXGAnimator_dealloc__block_invoke;
  v5[3] = &unk_1E5148928;
  v5[4] = self;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v5);

  -[PXGSpriteDataStore recycle](self->_doubleSidedSpriteDataStore, "recycle");
  -[PXGSpriteDataStore recycle](self->_oldAnimationPresentationSpriteDataStore, "recycle");
  v4.receiver = self;
  v4.super_class = (Class)PXGAnimator;
  -[PXGAnimator dealloc](&v4, sel_dealloc);
}

- (void)_stopAllAnimations
{
  void *v3;
  _QWORD v4[5];

  -[PXGAnimationDataStore activeGroupIndexes](self->_animationDataStore, "activeGroupIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__PXGAnimator__stopAllAnimations__block_invoke;
  v4[3] = &unk_1E5148928;
  v4[4] = self;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v4);

}

- (void)setSpeed:(double)a3
{
  void *v5;
  void *v6;

  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGAnimator setSpeed:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGAnimator.m"), 1051, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("speed > 0"));

  }
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
    self->_speed = a3;
}

- (int64_t)computeCount
{
  return self->_computeCount;
}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (PXGLayoutSnapshot)previousLayoutSnapshot
{
  return self->_previousLayoutSnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousLayoutSnapshot, 0);
  objc_storeStrong((id *)&self->_reusableSnapshotSpriteDataStores, 0);
  objc_storeStrong((id *)&self->_oldAnimationPresentationSpriteDataStore, 0);
  objc_storeStrong((id *)&self->_doubleSidedSpriteDataStore, 0);
  objc_storeStrong((id *)&self->_spriteIndexesByGroupIndex, 0);
  objc_storeStrong((id *)&self->_animatorLayout, 0);
  objc_storeStrong((id *)&self->_animationDataStore, 0);
}

uint64_t __33__PXGAnimator__stopAllAnimations__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "groupInfos");
  v4 = result + 76 * a2;
  *(_QWORD *)(v4 + 8) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  return result;
}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_14(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v3 == v2)
  {
    v4 = objc_msgSend(v3, "copy");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v3 == *(void **)(*(_QWORD *)(v2 + 8) + 40))
  {
    v4 = objc_msgSend(v3, "copy");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

uint64_t __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_6(uint64_t result, uint64_t a2)
{
  *(_WORD *)(*(_QWORD *)(result + 40)
           + 2 * (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))++) = *(_WORD *)(*(_QWORD *)(result + 40) + 2 * a2);
  return result;
}

float __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  double v28;
  double v29;
  float v30;
  float v31;
  float v32;
  float v33;
  uint64_t v34;

  v6 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "entities");
  v7 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "geometries");
  v8 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "styles");
  v9 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "entities");
  v10 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "geometries");
  v11 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "styles");
  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "spriteInfos");
  if (a3)
  {
    v14 = 0;
    v15 = v12 + 307 * a2;
    v16 = v11 + 160 * a2;
    v17 = v8 + 160 * a2;
    do
    {
      v18 = v7 + 32 * a2 + 8 * v14;
      *(_DWORD *)(v9 + 4 * a2 + v14) = *(_DWORD *)(v6 + 4 * a2 + v14);
      v19 = *(_OWORD *)(v18 + 16);
      v20 = v10 + 32 * a2 + 8 * v14;
      *(_OWORD *)v20 = *(_OWORD *)v18;
      *(_OWORD *)(v20 + 16) = v19;
      v21 = *(_OWORD *)(v17 + 80);
      v23 = *(_OWORD *)(v17 + 32);
      v22 = *(_OWORD *)(v17 + 48);
      *(_OWORD *)(v16 + 64) = *(_OWORD *)(v17 + 64);
      *(_OWORD *)(v16 + 80) = v21;
      *(_OWORD *)(v16 + 32) = v23;
      *(_OWORD *)(v16 + 48) = v22;
      v24 = *(_OWORD *)(v17 + 144);
      v26 = *(_OWORD *)(v17 + 96);
      v25 = *(_OWORD *)(v17 + 112);
      *(_OWORD *)(v16 + 128) = *(_OWORD *)(v17 + 128);
      *(_OWORD *)(v16 + 144) = v24;
      *(_OWORD *)(v16 + 96) = v26;
      *(_OWORD *)(v16 + 112) = v25;
      v27 = *(_OWORD *)(v17 + 16);
      *(_OWORD *)v16 = *(_OWORD *)v17;
      *(_OWORD *)(v16 + 16) = v27;
      *(_QWORD *)&v27 = *(_QWORD *)(v20 + 8);
      *(_QWORD *)&v25 = *(_QWORD *)v18;
      *(_QWORD *)&v26 = *(_QWORD *)(v18 + 8);
      v28 = *(double *)v20 - *(double *)v18;
      *(_DWORD *)(v15 + 16) = 0;
      *(_QWORD *)v15 = v25;
      *(double *)(v15 + 8) = v28;
      *(_QWORD *)(v15 + 20) = v26;
      v29 = *(double *)&v27 - *(double *)&v26;
      *(_DWORD *)(v15 + 36) = 0;
      *(float *)&v27 = *(double *)(v20 + 16);
      *(double *)(v15 + 28) = v29;
      *(float *)&v29 = *(double *)(v18 + 16);
      *(_DWORD *)(v15 + 48) = 0;
      *(_DWORD *)(v15 + 40) = LODWORD(v29);
      *(float *)(v15 + 44) = *(float *)&v27 - *(float *)&v29;
      *(_QWORD *)&v27 = *(_QWORD *)(v18 + 24);
      *(float *)&v29 = COERCE_FLOAT(*(_QWORD *)(v20 + 24)) - *(float *)&v27;
      *(_DWORD *)(v15 + 60) = 0;
      *(_DWORD *)(v15 + 52) = v27;
      *(_DWORD *)(v15 + 56) = LODWORD(v29);
      LODWORD(v29) = *(_DWORD *)(v20 + 28);
      *(float *)&v27 = *(float *)v16 - *(float *)v17;
      v30 = *(float *)(v16 + 60);
      v31 = *(float *)(v18 + 28);
      v32 = *(float *)(v17 + 56);
      v33 = *(float *)(v17 + 60);
      *(float *)&v26 = *(float *)(v16 + 56) - v32;
      *(_DWORD *)(v15 + 76) = *(_DWORD *)v17;
      *(_DWORD *)(v15 + 80) = v27;
      *(float *)(v15 + 88) = v32;
      *(_DWORD *)(v15 + 92) = v26;
      *(_DWORD *)(v15 + 72) = 0;
      *(_DWORD *)(v15 + 84) = 0;
      *(_DWORD *)(v15 + 96) = 0;
      *(float *)(v15 + 100) = v33;
      *(float *)(v15 + 104) = v30 - v33;
      *(_DWORD *)(v15 + 108) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 64);
      *(float *)&v27 = *(float *)(v16 + 64) - *(float *)&v25;
      *(_DWORD *)(v15 + 112) = v25;
      *(_DWORD *)(v15 + 116) = v27;
      *(_DWORD *)(v15 + 120) = 0;
      *(float *)(v15 + 64) = v31;
      *(float *)(v15 + 68) = *(float *)&v29 - v31;
      LODWORD(v29) = *(_DWORD *)(v17 + 4);
      *(float *)&v27 = *(float *)(v16 + 4) - *(float *)&v29;
      *(_DWORD *)(v15 + 156) = 0;
      *(_DWORD *)(v15 + 148) = LODWORD(v29);
      *(_DWORD *)(v15 + 152) = v27;
      v34 = *(_QWORD *)(v16 + 72);
      *(_QWORD *)&v27 = *(_QWORD *)(v17 + 72);
      *(_DWORD *)(v15 + 132) = 0;
      *(_DWORD *)(v15 + 124) = v27;
      *(float *)(v15 + 128) = *(float *)&v34 - *(float *)&v27;
      LODWORD(v27) = *(_DWORD *)(v16 + 80);
      LODWORD(v25) = *(_DWORD *)(v17 + 76);
      LODWORD(v26) = *(_DWORD *)(v17 + 80);
      *(float *)&v34 = *(float *)(v16 + 76) - *(float *)&v25;
      *(_DWORD *)(v15 + 136) = v25;
      *(_DWORD *)(v15 + 140) = v34;
      *(_DWORD *)(v15 + 144) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 8);
      *(float *)&v34 = *(float *)(v16 + 8) - *(float *)&v25;
      *(_DWORD *)(v15 + 160) = v25;
      *(_DWORD *)(v15 + 164) = v34;
      *(_DWORD *)(v15 + 168) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 12);
      *(float *)&v34 = *(float *)(v16 + 12) - *(float *)&v25;
      *(_DWORD *)(v15 + 172) = v25;
      *(_DWORD *)(v15 + 176) = v34;
      *(_DWORD *)(v15 + 180) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 16);
      *(float *)&v34 = *(float *)(v16 + 16) - *(float *)&v25;
      *(_DWORD *)(v15 + 184) = v25;
      *(_DWORD *)(v15 + 188) = v34;
      *(_DWORD *)(v15 + 192) = 0;
      LODWORD(v34) = *(_DWORD *)(v17 + 20);
      *(float *)&v25 = *(float *)(v16 + 20) - *(float *)&v34;
      *(_DWORD *)(v15 + 196) = v34;
      *(_DWORD *)(v15 + 200) = v25;
      *(_DWORD *)(v15 + 204) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 24);
      *(float *)&v34 = *(float *)(v16 + 24) - *(float *)&v25;
      *(_DWORD *)(v15 + 208) = v25;
      *(_DWORD *)(v15 + 212) = v34;
      *(_DWORD *)(v15 + 216) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 28);
      *(float *)&v34 = *(float *)(v16 + 28) - *(float *)&v25;
      *(_DWORD *)(v15 + 220) = v25;
      *(_DWORD *)(v15 + 224) = v34;
      *(_DWORD *)(v15 + 228) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 32);
      *(float *)&v34 = *(float *)(v16 + 32) - *(float *)&v25;
      *(_DWORD *)(v15 + 232) = v25;
      *(_DWORD *)(v15 + 236) = v34;
      *(_DWORD *)(v15 + 240) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 36);
      *(float *)&v34 = *(float *)(v16 + 36) - *(float *)&v25;
      *(_DWORD *)(v15 + 244) = v25;
      *(_DWORD *)(v15 + 248) = v34;
      *(_DWORD *)(v15 + 252) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 40);
      *(float *)&v34 = *(float *)(v16 + 40) - *(float *)&v25;
      *(_DWORD *)(v15 + 256) = v25;
      *(_DWORD *)(v15 + 260) = v34;
      *(_DWORD *)(v15 + 264) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 44);
      *(float *)&v34 = *(float *)(v16 + 44) - *(float *)&v25;
      *(_DWORD *)(v15 + 268) = v25;
      *(_DWORD *)(v15 + 272) = v34;
      *(_DWORD *)(v15 + 276) = 0;
      LODWORD(v34) = *(_DWORD *)(v16 + 48);
      LODWORD(v25) = *(_DWORD *)(v17 + 48);
      *(_DWORD *)(v15 + 280) = v25;
      result = *(float *)&v34 - *(float *)&v25;
      *(_DWORD *)(v15 + 288) = 0;
      *(_DWORD *)(v15 + 292) = v26;
      *(float *)(v15 + 296) = *(float *)&v27 - *(float *)&v26;
      v14 += 4;
      *(float *)(v15 + 284) = result;
      *(_DWORD *)(v15 + 300) = 0;
      *(_WORD *)(v15 + 304) = 0;
      v16 += 160;
      v17 += 160;
      v15 += 307;
      --a3;
    }
    while (a3);
  }
  return result;
}

uint64_t __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_11(uint64_t result, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  _OWORD *v6;
  _OWORD *v7;
  __int128 v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;

  if (a3)
  {
    v3 = a3;
    v4 = (_QWORD *)result;
    do
    {
      *(_DWORD *)(v4[4] + 4 * a2) = *(_DWORD *)(v4[5] + 4 * a2);
      v6 = (_OWORD *)(v4[6] + 32 * a2);
      v7 = (_OWORD *)(v4[7] + 32 * a2);
      v8 = v7[1];
      *v6 = *v7;
      v6[1] = v8;
      v9 = (_OWORD *)(v4[8] + 160 * a2);
      v10 = (_OWORD *)(v4[9] + 160 * a2);
      v11 = v10[5];
      v13 = v10[2];
      v12 = v10[3];
      v9[4] = v10[4];
      v9[5] = v11;
      v9[2] = v13;
      v9[3] = v12;
      v14 = v10[9];
      v16 = v10[6];
      v15 = v10[7];
      v9[8] = v10[8];
      v9[9] = v14;
      v9[6] = v16;
      v9[7] = v15;
      v17 = v10[1];
      *v9 = *v10;
      v9[1] = v17;
      v18 = v4[10] + 40 * a2;
      v19 = v4[11] + 40 * a2;
      v20 = *(_OWORD *)v19;
      v21 = *(_OWORD *)(v19 + 16);
      *(_QWORD *)(v18 + 32) = *(_QWORD *)(v19 + 32);
      *(_OWORD *)v18 = v20;
      *(_OWORD *)(v18 + 16) = v21;
      result = objc_msgSend(*(id *)(v4[14] + 8 * *(unsigned __int16 *)(v4[12] + 2 * *(unsigned __int16 *)(v4[13] + 2 * a2++))), "addIndex:");
      --v3;
    }
    while (v3);
  }
  return result;
}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_14(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v4 = *(id *)(*(_QWORD *)(a1 + 40) + 76 * a2 + 44);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(*(_QWORD *)(a1 + 48) + 8 * a2);
  v10 = *(id *)(a1 + 32);
  v9 = v4;
  v7 = v5;
  v8 = v6;
  PXGSpriteIndexesEnumerateRangesForPositions();

}

uint64_t __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_15(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return objc_msgSend(*(id *)(a1 + 40), "animation:adjustGeometries:styles:infos:forSpriteDisappearingFromRootIndexRange:", *(_QWORD *)(a1 + 48), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "geometries") + 32 * a2, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "styles") + 160 * a2, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "infos") + 40 * a2, a2 & 0xFFFFFFFF00000000 | a3);
}

float __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  float v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;

  v3 = a3;
  v6 = *(_QWORD *)(a1 + 56) + 32 * a2;
  v7 = *(_QWORD *)(a1 + 64) + 160 * a2;
  objc_msgSend(*(id *)(a1 + 32), "animation:adjustGeometries:styles:infos:forSpriteAppearingIntoRootIndexRange:", *(_QWORD *)(a1 + 40), v6, v7, *(_QWORD *)(a1 + 72) + 40 * a2, a2 | ((unint64_t)a3 << 32));
  v8 = *(_QWORD *)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 88);
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "spriteInfos");
  if (v3)
  {
    v12 = v10 + 307 * a2;
    v13 = v9 + 160 * a2;
    v14 = v8 + 32 * a2;
    do
    {
      v15 = *(double *)(v6 + 8);
      v16 = *(double *)(v14 + 8);
      v17 = *(double *)v6 - *(double *)v14;
      *(_QWORD *)v12 = *(_QWORD *)v14;
      *(double *)(v12 + 8) = v17;
      *(_DWORD *)(v12 + 16) = 0;
      *(double *)(v12 + 20) = v16;
      *(double *)(v12 + 28) = v15 - v16;
      *(_DWORD *)(v12 + 36) = 0;
      *(float *)&v17 = *(double *)(v6 + 16);
      *(float *)&v15 = *(double *)(v14 + 16);
      *(_DWORD *)(v12 + 40) = LODWORD(v15);
      *(float *)(v12 + 44) = *(float *)&v17 - *(float *)&v15;
      *(_DWORD *)(v12 + 48) = 0;
      v18 = *(_QWORD *)(v14 + 24);
      *(float *)&v17 = COERCE_FLOAT(*(_QWORD *)(v6 + 24)) - *(float *)&v18;
      *(_DWORD *)(v12 + 52) = v18;
      *(_DWORD *)(v12 + 56) = LODWORD(v17);
      *(_DWORD *)(v12 + 60) = 0;
      LODWORD(v18) = *(_DWORD *)(v14 + 28);
      *(float *)&v17 = *(float *)(v6 + 28) - *(float *)&v18;
      *(_DWORD *)(v12 + 64) = v18;
      *(_DWORD *)(v12 + 68) = LODWORD(v17);
      *(_DWORD *)(v12 + 72) = 0;
      *(float *)&v17 = *(float *)v7 - *(float *)v13;
      *(_DWORD *)(v12 + 76) = *(_DWORD *)v13;
      *(_DWORD *)(v12 + 80) = LODWORD(v17);
      *(_DWORD *)(v12 + 84) = 0;
      LODWORD(v18) = *(_DWORD *)(v7 + 60);
      v19 = *(float *)(v13 + 56);
      LODWORD(v16) = *(_DWORD *)(v13 + 60);
      *(float *)&v17 = *(float *)(v7 + 56) - v19;
      *(float *)(v12 + 88) = v19;
      *(_DWORD *)(v12 + 92) = LODWORD(v17);
      *(_DWORD *)(v12 + 96) = 0;
      *(_DWORD *)(v12 + 100) = LODWORD(v16);
      *(float *)(v12 + 104) = *(float *)&v18 - *(float *)&v16;
      *(_DWORD *)(v12 + 108) = 0;
      LODWORD(v18) = *(_DWORD *)(v13 + 64);
      *(float *)&v17 = *(float *)(v7 + 64) - *(float *)&v18;
      *(_DWORD *)(v12 + 112) = v18;
      *(_DWORD *)(v12 + 116) = LODWORD(v17);
      *(_DWORD *)(v12 + 120) = 0;
      LODWORD(v17) = *(_DWORD *)(v13 + 4);
      *(float *)&v18 = *(float *)(v7 + 4) - *(float *)&v17;
      *(_DWORD *)(v12 + 148) = LODWORD(v17);
      *(_DWORD *)(v12 + 152) = v18;
      *(_DWORD *)(v12 + 156) = 0;
      v20 = *(_QWORD *)(v7 + 72);
      v21 = *(_QWORD *)(v13 + 72);
      *(_DWORD *)(v12 + 124) = v21;
      *(float *)(v12 + 128) = *(float *)&v20 - *(float *)&v21;
      *(_DWORD *)(v12 + 132) = 0;
      LODWORD(v21) = *(_DWORD *)(v7 + 80);
      v22 = *(float *)(v13 + 76);
      LODWORD(v16) = *(_DWORD *)(v13 + 80);
      *(float *)&v20 = *(float *)(v7 + 76) - v22;
      *(float *)(v12 + 136) = v22;
      *(_DWORD *)(v12 + 140) = v20;
      *(_DWORD *)(v12 + 144) = 0;
      v23 = *(float *)(v13 + 8);
      *(float *)&v20 = *(float *)(v7 + 8) - v23;
      *(float *)(v12 + 160) = v23;
      *(_DWORD *)(v12 + 164) = v20;
      *(_DWORD *)(v12 + 168) = 0;
      v24 = *(float *)(v13 + 12);
      *(float *)&v20 = *(float *)(v7 + 12) - v24;
      *(float *)(v12 + 172) = v24;
      *(_DWORD *)(v12 + 176) = v20;
      *(_DWORD *)(v12 + 180) = 0;
      v25 = *(float *)(v13 + 16);
      *(float *)&v20 = *(float *)(v7 + 16) - v25;
      *(float *)(v12 + 184) = v25;
      *(_DWORD *)(v12 + 188) = v20;
      *(_DWORD *)(v12 + 192) = 0;
      LODWORD(v20) = *(_DWORD *)(v13 + 20);
      v26 = *(float *)(v7 + 20) - *(float *)&v20;
      *(_DWORD *)(v12 + 196) = v20;
      *(float *)(v12 + 200) = v26;
      *(_DWORD *)(v12 + 204) = 0;
      v27 = *(float *)(v13 + 24);
      *(float *)&v20 = *(float *)(v7 + 24) - v27;
      *(float *)(v12 + 208) = v27;
      *(_DWORD *)(v12 + 212) = v20;
      *(_DWORD *)(v12 + 216) = 0;
      v28 = *(float *)(v13 + 28);
      *(float *)&v20 = *(float *)(v7 + 28) - v28;
      *(float *)(v12 + 220) = v28;
      *(_DWORD *)(v12 + 224) = v20;
      *(_DWORD *)(v12 + 228) = 0;
      v29 = *(float *)(v13 + 32);
      *(float *)&v20 = *(float *)(v7 + 32) - v29;
      *(float *)(v12 + 232) = v29;
      *(_DWORD *)(v12 + 236) = v20;
      *(_DWORD *)(v12 + 240) = 0;
      v30 = *(float *)(v13 + 36);
      *(float *)&v20 = *(float *)(v7 + 36) - v30;
      *(float *)(v12 + 244) = v30;
      *(_DWORD *)(v12 + 248) = v20;
      *(_DWORD *)(v12 + 252) = 0;
      LODWORD(v20) = *(_DWORD *)(v7 + 40);
      v31 = *(float *)(v13 + 40);
      *(float *)(v12 + 256) = v31;
      *(float *)(v12 + 260) = *(float *)&v20 - v31;
      *(_DWORD *)(v12 + 264) = 0;
      LODWORD(v20) = *(_DWORD *)(v7 + 44);
      v32 = *(float *)(v13 + 44);
      *(float *)(v12 + 268) = v32;
      *(float *)(v12 + 272) = *(float *)&v20 - v32;
      *(_DWORD *)(v12 + 276) = 0;
      LODWORD(v20) = *(_DWORD *)(v7 + 48);
      v33 = *(float *)(v13 + 48);
      *(float *)(v12 + 280) = v33;
      *(float *)(v12 + 284) = *(float *)&v20 - v33;
      *(_DWORD *)(v12 + 288) = 0;
      *(_DWORD *)(v12 + 292) = LODWORD(v16);
      result = *(float *)&v21 - *(float *)&v16;
      *(float *)(v12 + 296) = *(float *)&v21 - *(float *)&v16;
      *(_DWORD *)(v12 + 300) = 0;
      v6 += 32;
      v14 += 32;
      *(_WORD *)(v12 + 304) = *(_QWORD *)(a1 + 104);
      v12 += 307;
      v7 += 160;
      v13 += 160;
      --v3;
    }
    while (v3);
  }
  return result;
}

BOOL __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 40) == *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 2 * a2);
}

uint64_t __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_2_16(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsSpriteTransfer");
}

uint64_t __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __22__PXGAnimator_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "groupInfos") + 76 * a2;

  *(_QWORD *)(v2 + 52) = 0;
  *(_QWORD *)(v2 + 44) = 0;
}

@end
