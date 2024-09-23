@implementation PXStoryConcreteTimelineScorer

- (PXStoryConcreteTimelineScorer)init
{
  return -[PXStoryConcreteTimelineScorer initWithTimelineStyle:](self, "initWithTimelineStyle:", 0);
}

- (PXStoryConcreteTimelineScorer)initWithTimelineStyle:(id)a3
{
  id v5;
  PXStoryConcreteTimelineScorer *v6;
  void *v7;
  _PXStoryConcreteScorerDisplayAssetsFetchResult *v8;
  _PXStoryConcreteScorerDisplayAssetsFetchResult *segmentDisplayAssets;
  _PXStoryConcreteScorerDisplayAsset *v10;
  _PXStoryConcreteScorerDisplayAsset *splitAsset;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryConcreteTimelineScorer;
  v6 = -[PXStoryConcreteTimelineScorer init](&v19, sel_init);
  if (v6)
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_timelineStyle, a3);
    v8 = objc_alloc_init(_PXStoryConcreteScorerDisplayAssetsFetchResult);
    segmentDisplayAssets = v6->_segmentDisplayAssets;
    v6->_segmentDisplayAssets = v8;

    v10 = objc_alloc_init(_PXStoryConcreteScorerDisplayAsset);
    splitAsset = v6->_splitAsset;
    v6->_splitAsset = v10;

    objc_msgSend(v7, "videoMaximumAspectFillScale");
    v6->_videoMaximumAspectFillScale = v12;
    objc_msgSend(v7, "livePhotoSameOrientationCompactMaximumScale");
    v6->_livePhotoSameOrientationMaximumScales[0] = v13;
    objc_msgSend(v7, "livePhotoSameOrientationRegularMaximumScale");
    v6->_livePhotoSameOrientationMaximumScales[1] = v14;
    objc_msgSend(v7, "livePhotoOppositeOrientationCompactMaximumScale");
    v6->_livePhotoOppositeOrientationMaximumScales[0] = v15;
    objc_msgSend(v7, "livePhotoOppositeOrientationRegularMaximumScale");
    v6->_livePhotoOppositeOrientationMaximumScales[1] = v16;
    objc_msgSend(v7, "aspectFillOneUpCropTolerance");
    PXFloatByLinearlyInterpolatingFloats();
    v6->_scoreForAspectFillOneUpWithPoorCrop = v17;

  }
  return v6;
}

- (double)verySignificantScore
{
  return 100.0;
}

- (double)scoreForTimeline:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  double (**v18)(_QWORD);
  double v19;
  id v20;
  id v21;
  id v22;
  double (**v23)(_QWORD);
  double v24;
  void *v26;
  objc_class *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  PXStoryConcreteTimelineScorer *v34;
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  SEL v42;
  double v43;
  _OWORD v44[3];
  _QWORD aBlock[5];
  uint64_t v46;
  double *v47;
  uint64_t v48;
  uint64_t v49;

  v46 = 0;
  v47 = (double *)&v46;
  v48 = 0x2020000000;
  v49 = 0;
  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteTimelineScorer.m"), 105, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("timeline"), v28, v30);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteTimelineScorer.m"), 105, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("timeline"), v28);
  }

LABEL_3:
  objc_msgSend(v5, "size");
  PXRectWithOriginAndSize();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v15 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v5, "resourcesDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryConcreteScorerDisplayAssetsFetchResult setResourcesDataSource:](self->_segmentDisplayAssets, "setResourcesDataSource:", v16);

  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PXStoryConcreteTimelineScorer_scoreForTimeline___block_invoke;
  aBlock[3] = &__block_descriptor_40_e18_d24__0_CGSize_dd_8l;
  aBlock[4] = 0x3F944723D272A7F6;
  v18 = (double (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v5, "size");
  v19 = v18[2](v18);
  if (v5)
    objc_msgSend(v5, "timeRange");
  else
    memset(v44, 0, sizeof(v44));
  v31[0] = v17;
  v31[1] = 3221225472;
  v31[2] = __50__PXStoryConcreteTimelineScorer_scoreForTimeline___block_invoke_2;
  v31[3] = &unk_1E5125FA0;
  v20 = v14;
  v32 = v20;
  v21 = v15;
  v33 = v21;
  v34 = self;
  v22 = v5;
  v38 = v7;
  v39 = v9;
  v40 = v11;
  v41 = v13;
  v35 = v22;
  v37 = &v46;
  v42 = a2;
  v23 = v18;
  v36 = v23;
  v43 = v19;
  objc_msgSend(v22, "enumerateSegmentsInTimeRange:usingBlock:", v44, v31);
  v24 = v47[3];

  _Block_object_dispose(&v46, 8);
  return v24;
}

- (uint64_t)isAcceptableCropWithVisibleAssetRect:(CGFloat)a3 acceptableCropAssetRect:(CGFloat)a4 faceAreaAssetRect:(double)a5
{
  _BOOL4 v24;
  _BOOL4 IsEmpty;
  BOOL v26;
  uint64_t result;
  _BYTE v28[32];
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  *(double *)v28 = a5;
  *(double *)&v28[8] = a6;
  *(double *)&v28[16] = a7;
  *(double *)&v28[24] = a8;
  v24 = CGRectContainsRect(*(CGRect *)&a1, *(CGRect *)&a5);
  v29.origin.x = a9;
  v29.origin.y = a10;
  v29.size.width = a11;
  v29.size.height = a12;
  IsEmpty = CGRectIsEmpty(v29);
  v26 = IsEmpty;
  result = !IsEmpty | v24;
  if (!v26 && !v24)
  {
    v30.origin.x = a1;
    v30.origin.y = a2;
    v30.size.width = a3;
    v30.size.height = a4;
    v32.origin.x = a9;
    v32.origin.y = a10;
    v32.size.width = a11;
    v32.size.height = a12;
    if (CGRectContainsRect(v30, v32))
    {
      return 1;
    }
    else
    {
      v33.origin.x = a9;
      v33.origin.y = a10;
      v33.size.width = a11;
      v33.size.height = a12;
      v34 = CGRectIntersection(*(CGRect *)v28, v33);
      v31.origin.x = a1;
      v31.origin.y = a2;
      v31.size.width = a3;
      v31.size.height = a4;
      return CGRectContainsRect(v31, v34);
    }
  }
  return result;
}

- (double)_scoreForClipInfo:(id *)a3 inClipFrame:(CGRect)a4 timelineBounds:(CGRect)a5 nUpBonus:(double *)a6
{
  CGFloat v7;
  CGFloat v8;
  CGFloat v11;
  CGFloat v12;
  CGFloat x;
  CGFloat y;
  uint64_t v15;
  _QWORD *v16;
  double (*v17)(_QWORD *, __int128 *);
  __int128 v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double (*v24)(_QWORD *, __int128 *);
  __int128 v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  __int128 v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double (**v39)(_QWORD, double, double, double, double);
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  _BOOL4 IsEmpty;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double (**v58)(_QWORD, double, double, double, double);
  unsigned int (**v59)(_QWORD);
  BOOL v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t AspectRatio;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  double v72;
  double v73;
  long double v74;
  double v75;
  long double v76;
  double v77;
  double v78;
  double v79;
  double v81;
  double v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  BOOL v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _BOOL4 v90;
  double v91;
  int v92;
  _BOOL4 v93;
  _BOOL4 v94;
  double v95;
  double v96;
  double v97;
  BOOL v98;
  unsigned int v99;
  double v100;
  double v101;
  double v102;
  CGFloat v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double width;
  double height;
  CGFloat r1;
  CGFloat v113;
  double v114;
  CGFloat v115;
  double v116;
  double v117;
  double v118;
  CGFloat rectb;
  double rect;
  double recta;
  double rect2;
  CGFloat rect2a;
  CGFloat v124;
  _QWORD v125[4];
  id v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  _QWORD v135[8];
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _QWORD aBlock[4];
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;

  width = a5.size.width;
  height = a5.size.height;
  v7 = a4.size.height;
  v8 = a4.size.width;
  PXRectWithOriginAndSize();
  v11 = v151.size.width;
  v12 = v151.size.height;
  x = v151.origin.x;
  y = v151.origin.y;
  if (CGRectIsEmpty(v151))
    return 0.0;
  v117 = v8;
  v118 = v7;
  v149 = 0u;
  v150 = 0u;
  v148 = 0u;
  rectb = y;
  PXStoryRectFromCGRect();
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PXStoryConcreteTimelineScorer__scoreForClipInfo_inClipFrame_timelineBounds_nUpBonus___block_invoke;
  aBlock[3] = &__block_descriptor_80_e68__CGRect__CGPoint_dd__CGSize_dd__56__0____CGAffineTransform_dddddd__8l;
  v145 = 0u;
  v146 = 0u;
  v147 = 0u;
  v16 = _Block_copy(aBlock);
  v17 = (double (*)(_QWORD *, __int128 *))v16[2];
  v18 = *(_OWORD *)&a3->var9.var0.var0.c;
  v141 = *(_OWORD *)&a3->var9.var0.var0.a;
  v142 = v18;
  v143 = *(_OWORD *)&a3->var9.var0.var0.tx;
  v19 = v17(v16, &v141);
  v113 = v20;
  v115 = v19;
  v124 = v12;
  r1 = v21;
  v23 = v22;
  v24 = (double (*)(_QWORD *, __int128 *))v16[2];
  v25 = *(_OWORD *)&a3->var9.var1.var0.c;
  v141 = *(_OWORD *)&a3->var9.var1.var0.a;
  v142 = v25;
  v143 = *(_OWORD *)&a3->var9.var1.var0.tx;
  v26 = v24(v16, &v141);
  v28 = v27;
  v29 = v11;
  v31 = v30;
  v33 = v32;
  v139 = 0u;
  v140 = 0u;
  v34 = *(_OWORD *)&a3->var9.var0.var0.c;
  v141 = *(_OWORD *)&a3->var9.var0.var0.a;
  v142 = v34;
  v143 = *(_OWORD *)&a3->var9.var0.var0.tx;
  v136 = v148;
  v137 = v149;
  v138 = v150;
  PXStoryRectDenormalize();
  PXStoryRectDecompose();
  PXSizeGetAspectRatio();
  v152.origin.y = v113;
  v152.origin.x = v115;
  v152.size.width = r1;
  v152.size.height = v23;
  v161.origin.x = v26;
  v161.origin.y = v28;
  v161.size.width = v31;
  v161.size.height = v33;
  CGRectUnion(v152, v161);
  PXRectWithAspectRatioFillingRect();
  PXRectRoundToPixel();
  v107 = v36;
  v108 = v35;
  v104 = v37;
  v106 = v38;
  v135[0] = v15;
  v135[1] = 3221225472;
  v135[2] = __87__PXStoryConcreteTimelineScorer__scoreForClipInfo_inClipFrame_timelineBounds_nUpBonus___block_invoke_2;
  v135[3] = &__block_descriptor_64_e70__CGRect__CGPoint_dd__CGSize_dd__40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  *(CGFloat *)&v135[4] = x;
  *(CGFloat *)&v135[5] = rectb;
  *(CGFloat *)&v135[6] = v29;
  *(CGFloat *)&v135[7] = v124;
  v39 = (double (**)(_QWORD, double, double, double, double))_Block_copy(v135);
  v40 = a3->var6.var1.origin.x;
  v41 = a3->var6.var1.origin.y;
  v42 = a3->var6.var1.size.width;
  v43 = a3->var6.var1.size.height;
  v45 = a3->var6.var2.origin.x;
  v44 = a3->var6.var2.origin.y;
  v46 = a3->var6.var2.size.width;
  rect = a3->var6.var2.size.height;
  v47 = a3->var6.var3.origin.x;
  v109 = a3->var6.var3.size.width;
  v114 = a3->var6.var3.origin.y;
  v116 = a3->var6.var3.size.height;
  v105 = v47;
  if (!-[PXStoryConcreteTimelineScorer saliencyFallbackBehavior](self, "saliencyFallbackBehavior"))
  {
    v153.origin.x = v40;
    v153.origin.y = v41;
    v153.size.width = v42;
    v153.size.height = v43;
    if (CGRectIsNull(v153))
    {
      v40 = *(double *)off_1E50B86D0;
      v41 = *((double *)off_1E50B86D0 + 1);
      v42 = *((double *)off_1E50B86D0 + 2);
      v43 = *((double *)off_1E50B86D0 + 3);
    }
    v154.origin.x = v45;
    v154.origin.y = v44;
    v154.size.width = v46;
    v154.size.height = rect;
    if (CGRectIsNull(v154))
    {
      v155.origin.x = v47;
      v44 = v114;
      v155.size.height = v116;
      v155.origin.y = v114;
      v46 = v109;
      v155.size.width = v109;
      IsEmpty = CGRectIsEmpty(v155);
      if (IsEmpty)
        v45 = v40;
      else
        v45 = v47;
      if (IsEmpty)
      {
        v44 = v41;
        v46 = v42;
      }
      v49 = v116;
      if (IsEmpty)
        v49 = v43;
      rect = v49;
    }
  }
  v156.origin.x = v40;
  v156.origin.y = v41;
  v156.size.width = v42;
  v156.size.height = v43;
  rect2 = 0.0;
  if (!CGRectIsNull(v156))
  {
    v157.origin.x = v45;
    v157.origin.y = v44;
    v157.size.width = v46;
    v157.size.height = rect;
    if (!CGRectIsNull(v157))
    {
      v50 = v39[2](v39, v40, v41, v42, v43);
      v52 = v51;
      v103 = v53;
      rect2a = v54;
      v100 = v39[2](v39, v45, v44, v46, rect);
      v101 = v55;
      v102 = v56;
      recta = v57;
      v125[0] = v15;
      v125[1] = 3221225472;
      v125[2] = __87__PXStoryConcreteTimelineScorer__scoreForClipInfo_inClipFrame_timelineBounds_nUpBonus___block_invoke_3;
      v125[3] = &unk_1E5126008;
      v127 = v47;
      v128 = v114;
      v129 = v109;
      v130 = v116;
      v58 = v39;
      v126 = v58;
      v131 = v108;
      v132 = v104;
      v133 = v107;
      v134 = v106;
      v59 = (unsigned int (**)(_QWORD))_Block_copy(v125);
      v158.origin.x = v108;
      v158.origin.y = v104;
      v158.size.width = v107;
      v158.size.height = v106;
      v162.origin.x = v50;
      v162.origin.y = v52;
      v162.size.width = v103;
      v162.size.height = rect2a;
      v60 = CGRectContainsRect(v158, v162);
      v61 = 10.0;
      if (!v60)
      {
        v81 = recta;
        if ((a3->var3 & 2) != 0)
        {
          v160.size.width = v107;
          v160.origin.x = v108;
          v160.origin.y = v104;
          v160.size.height = v106;
          v95 = v100;
          v96 = v101;
          v97 = v102;
          v98 = CGRectContainsRect(v160, *(CGRect *)(&v81 - 3));
          v61 = 5.0;
          if (!v98)
          {
            if (v59[2](v59))
              v61 = 5.0;
            else
              v61 = -20.0;
          }
        }
        else
        {
          v82 = *MEMORY[0x1E0C9D628];
          v83 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
          v85 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
          v84 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
          v159.size.height = v116;
          v159.origin.x = v105;
          v159.origin.y = v114;
          v159.size.width = v109;
          v86 = CGRectIsEmpty(v159);
          v87 = v83;
          if (!v86)
          {
            v82 = v39[2](v58, v105, v114, v109, v116);
            v85 = v88;
            v84 = v89;
          }
          v90 = -[PXStoryConcreteTimelineScorer isAcceptableCropWithVisibleAssetRect:acceptableCropAssetRect:faceAreaAssetRect:](self, "isAcceptableCropWithVisibleAssetRect:acceptableCropAssetRect:faceAreaAssetRect:", v108, v104, v107, v106, v100, v101, v102, recta, *(_QWORD *)&v82, v87, v85, v84);
          v61 = -20.0;
          if (v90)
          {
            PXRectGetLengthForAxis();
            PXRectGetLengthForAxis();
            PXRectGetLengthForAxis();
            PXFloatNormalize();
            if (v91 >= 0.5)
            {
              v99 = v59[2](v59);
              v61 = 5.0;
              if (v99)
                *a6 = *a6 + 3.0;
            }
            else
            {
              v92 = PXRectApproximatelyEqualToRect();
              v61 = -10.0;
              if (v92)
                v61 = self->_scoreForAspectFillOneUpWithPoorCrop + 0.0;
            }
          }
        }
      }
      rect2 = v61;

    }
  }
  if (a3->var5 == 3)
  {
    PXSizeGetAspectRatio();
    v63 = v62;
    v64 = height;
    AspectRatio = PXSizeGetAspectRatio();
    v67 = v66;
    if (width < height)
      v64 = width;
    v68 = MEMORY[0x1A85CD654](AspectRatio, v63, v117, v118);
    if (v68 >= v69)
      v68 = v69;
    v70 = v68 / v64;
    v71 = 48;
    if (v63 < 1.0 != v67 >= 1.0)
      v71 = 32;
    if (v70 <= *(double *)((char *)&self->super.isa + 8 * (v64 >= 768.0) + v71))
      v72 = rect2;
    else
      v72 = rect2 + -15.0;
  }
  else
  {
    PXSizeGetAspectRatio();
    v74 = v73;
    PXSizeGetAspectRatio();
    v76 = v75;
    v77 = round(log(v74) / 0.05) * 0.05;
    v78 = round(log(v76) / 0.05) * 0.05;
    if (v77 > 0.0 && v78 > 0.0 || v77 < 0.0 && v78 < 0.0 || v77 == 0.0 && v78 == 0.0)
    {
      v79 = rect2 + 1.0;
    }
    else
    {
      v93 = v77 < 0.0;
      v94 = v77 > 0.0;
      if (v78 >= 0.0)
        v94 = 0;
      if (v78 <= 0.0)
        v93 = 0;
      if (v94 || v93)
        v79 = rect2 + -1.0;
      else
        v79 = rect2;
    }
    v72 = v79 + tanh((v77 - v78) * (v77 - v78)) * -0.2;
  }

  return v72;
}

- (double)_scoreForSplitAsset:(id)a3 inTimeline:(id)a4 segmentTimeRange:(id *)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t v34;
  __int128 v35;
  _BYTE v36[40];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  char v43;
  _BYTE v44[7];
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  __int128 v88;
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
  uint64_t v101;
  __int128 v102;
  _BYTE v103[32];
  __int128 v104;
  _OWORD v105[3];
  __int128 v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[8];
  _QWORD v118[4];
  __int128 v119;
  __int128 v120;
  _QWORD v121[4];
  __int128 v122;
  __int128 v123;
  _QWORD v124[4];
  __int128 v125;
  __int128 v126;
  uint64_t v127;
  double *v128;
  uint64_t v129;
  void *v130;
  __int128 v131;
  __int128 v132;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "size");
  PXRectWithOriginAndSize();
  v11 = v10;
  v13 = v12;
  v127 = 0;
  v128 = (double *)&v127;
  v14 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v131 = *MEMORY[0x1E0C9D628];
  v132 = v14;
  v15 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v125 = *MEMORY[0x1E0C9D628];
  v126 = v15;
  v16 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v122 = *MEMORY[0x1E0C9D628];
  v123 = v16;
  v129 = 0x4010000000;
  v130 = &unk_1A7E74EE7;
  v124[0] = 0;
  v124[1] = v124;
  v124[2] = 0x4010000000;
  v124[3] = &unk_1A7E74EE7;
  v121[0] = 0;
  v121[1] = v121;
  v121[2] = 0x4010000000;
  v121[3] = &unk_1A7E74EE7;
  v118[0] = 0;
  v118[1] = v118;
  v118[2] = 0x4010000000;
  v118[3] = &unk_1A7E74EE7;
  v17 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v119 = v125;
  v120 = v17;
  v117[0] = MEMORY[0x1E0C809B0];
  v117[1] = 3221225472;
  v117[2] = __81__PXStoryConcreteTimelineScorer__scoreForSplitAsset_inTimeline_segmentTimeRange___block_invoke;
  v117[3] = &unk_1E5126030;
  v117[4] = &v127;
  v117[5] = v124;
  v117[6] = v121;
  v117[7] = v118;
  v18 = *(_OWORD *)&a5->var0.var3;
  v35 = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)v36 = v18;
  *(_OWORD *)&v36[16] = *(_OWORD *)&a5->var1.var1;
  objc_msgSend(v9, "enumerateConcreteClipsInTimeRange:rect:usingBlock:", &v35, v117, v11, v13, v19);
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v108 = 0u;
  PXStoryBasicContentInfoForDisplayAsset(self->_splitAsset, (uint64_t)&v108);
  PXEdgeInsetsBetweenRects();
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = *(_OWORD *)&a5->var1.var1;
  *(_OWORD *)v36 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&v36[16] = v28;
  v106 = *(_OWORD *)&v36[8];
  v107 = *((_QWORD *)&v28 + 1);
  *(_OWORD *)&v103[8] = *(_OWORD *)&v36[8];
  *(_QWORD *)&v103[24] = *((_QWORD *)&v28 + 1);
  *(_QWORD *)v103 = 0;
  v102 = PXStoryTimeZero;
  memset(v105, 0, 40);
  v104 = PXStoryTimeMaximum;
  PXStoryRectFromCGRect();
  PXStoryRectFromCGRect();
  v101 = v107;
  v94 = v91;
  v95 = v92;
  v96 = v93;
  v97 = v88;
  v98 = v89;
  v99 = v90;
  v100 = v106;
  v29 = *((_QWORD *)v128 + 6);
  v30 = *((_QWORD *)v128 + 7);
  v39 = v104;
  v40 = v105[0];
  v41 = v105[1];
  v42 = *(_QWORD *)&v105[2];
  *(_OWORD *)&v36[24] = v102;
  v37 = *(_OWORD *)v103;
  v38 = *(_OWORD *)&v103[16];
  memset(v44, 0, sizeof(v44));
  v48 = v110;
  v49 = v111;
  v46 = v108;
  v47 = v109;
  v53 = v115;
  v54 = v116;
  v51 = v113;
  v52 = v114;
  v50 = v112;
  v72 = 0;
  v69 = xmmword_1A7C0BEF8;
  v70 = xmmword_1A7C0BF08;
  v71 = xmmword_1A7C0BF18;
  v65 = xmmword_1A7C0BEB8;
  v66 = unk_1A7C0BEC8;
  v67 = xmmword_1A7C0BED8;
  v68 = xmmword_1A7C0BEE8;
  v61 = xmmword_1A7C0BE78;
  v62 = unk_1A7C0BE88;
  v63 = xmmword_1A7C0BE98;
  v64 = unk_1A7C0BEA8;
  v59 = PXStoryClippingAnimationInfoNone;
  v60 = unk_1A7C0BE68;
  v77 = v89;
  v78 = v90;
  v79 = v106;
  v73 = v91;
  v74 = v92;
  v75 = v93;
  v76 = v88;
  v80 = v107;
  v35 = xmmword_1A7BA6CB0;
  *(_QWORD *)v36 = v29;
  *(_QWORD *)&v36[8] = v30;
  *(_QWORD *)&v36[16] = 0;
  v43 = 0;
  v45 = 0;
  v55 = v21;
  v56 = v23;
  v57 = v25;
  v58 = v27;
  v83 = 0;
  v81 = PXStoryTransitionInfoNone;
  v82 = xmmword_1A7C0B7D8;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0;
  v34 = 0;
  -[PXStoryConcreteTimelineScorer _scoreForClipInfo:inClipFrame:timelineBounds:nUpBonus:](self, "_scoreForClipInfo:inClipFrame:timelineBounds:nUpBonus:", &v35, &v34, v128[4], v128[5]);
  v32 = v31 + 0.0;
  _Block_object_dispose(v118, 8);
  _Block_object_dispose(v121, 8);
  _Block_object_dispose(v124, 8);
  _Block_object_dispose(&v127, 8);

  return v32;
}

- (PXStoryTimelineStyle)timelineStyle
{
  return self->_timelineStyle;
}

- (int64_t)saliencyFallbackBehavior
{
  return self->_saliencyFallbackBehavior;
}

- (void)setSaliencyFallbackBehavior:(int64_t)a3
{
  self->_saliencyFallbackBehavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineStyle, 0);
  objc_storeStrong((id *)&self->_splitAsset, 0);
  objc_storeStrong((id *)&self->_segmentDisplayAssets, 0);
}

void __81__PXStoryConcreteTimelineScorer__scoreForSplitAsset_inTimeline_segmentTimeRange___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGRect *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGRect *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  if (a2 >= 1)
  {
    v6 = a2;
    v8 = a4 + 16;
    do
    {
      if (*(_QWORD *)(a5 + 8) == 1)
      {
        *(CGRect *)(*(_QWORD *)(a1[4] + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(a1[4] + 8) + 32), *(CGRect *)(v8 - 16));
        PXEdgeInsetsInsetRect();
        v23.origin.x = v9;
        v23.origin.y = v10;
        v23.size.width = v11;
        v23.size.height = v12;
        *(CGRect *)(*(_QWORD *)(a1[5] + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(a1[5] + 8) + 32), v23);
        v13 = *(CGRect **)(a1[6] + 8);
        PXStoryRectOuterBounds();
        v24.origin.x = v14;
        v24.origin.y = v15;
        v24.size.width = v16;
        v24.size.height = v17;
        *(CGRect *)(*(_QWORD *)(a1[6] + 8) + 32) = CGRectUnion(v13[1], v24);
        v18 = *(CGRect **)(a1[7] + 8);
        PXStoryRectOuterBounds();
        v25.origin.x = v19;
        v25.origin.y = v20;
        v25.size.width = v21;
        v25.size.height = v22;
        *(CGRect *)(*(_QWORD *)(a1[7] + 8) + 32) = CGRectUnion(v18[1], v25);
      }
      a5 += 768;
      v8 += 32;
      --v6;
    }
    while (v6);
  }
}

uint64_t __87__PXStoryConcreteTimelineScorer__scoreForClipInfo_inClipFrame_timelineBounds_nUpBonus___block_invoke()
{
  PXStoryRectDenormalize();
  PXStoryRectOuterBounds();
  return PXRectRoundToPixel();
}

uint64_t __87__PXStoryConcreteTimelineScorer__scoreForClipInfo_inClipFrame_timelineBounds_nUpBonus___block_invoke_2()
{
  PXRectFlippedVertically();
  PXRectDenormalize();
  return PXRectRoundToPixel();
}

BOOL __87__PXStoryConcreteTimelineScorer__scoreForClipInfo_inClipFrame_timelineBounds_nUpBonus___block_invoke_3(uint64_t a1)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGRect v6;

  if (CGRectIsEmpty(*(CGRect *)(a1 + 40)))
    return 0;
  v6.origin.x = (*(double (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v6.origin.y = v3;
  v6.size.width = v4;
  v6.size.height = v5;
  return CGRectContainsRect(*(CGRect *)(a1 + 72), v6);
}

double __50__PXStoryConcreteTimelineScorer_scoreForTimeline___block_invoke(uint64_t a1)
{
  long double v2;
  long double v3;

  PXSizeGetAspectRatio();
  v3 = *(double *)(a1 + 32) * round(log(v2) / *(double *)(a1 + 32));
  return exp(v3);
}

void __50__PXStoryConcreteTimelineScorer_scoreForTimeline___block_invoke_2(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t v4;
  uint64_t v6;
  __int128 *v7;
  double v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  __int128 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  NSObject *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  __int128 v36;
  uint64_t v37;
  int8x16_t v38;
  uint8_t buf[16];
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  int8x16_t v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  double *v53;
  uint64_t v54;
  void *v55;
  __int128 v56;
  uint64_t v57;
  double *v58;
  uint64_t v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  double *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;

  if (a2 >= 1)
  {
    v4 = a2;
    v6 = 0;
    v37 = 0;
    v7 = (__int128 *)(a1 + 80);
    v8 = 0.0;
    v36 = *(_OWORD *)off_1E50B8810;
    v35 = -1000.0;
    do
    {
      v9 = a3[1];
      v75 = *a3;
      v76 = v9;
      v77 = a3[2];
      v71 = 0;
      v72 = &v71;
      v73 = 0x2020000000;
      v74 = 0;
      v67 = 0;
      v68 = (double *)&v67;
      v69 = 0x2020000000;
      v70 = 0;
      v63 = 0;
      v64 = (double *)&v63;
      v65 = 0x2020000000;
      v66 = 0;
      v57 = 0;
      v58 = (double *)&v57;
      v59 = 0x4010000000;
      v60 = &unk_1A7E74EE7;
      v10 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      v61 = *MEMORY[0x1E0C9D628];
      v62 = v10;
      v52 = 0;
      v53 = (double *)&v52;
      v54 = 0x3010000000;
      v55 = &unk_1A7E74EE7;
      v56 = v36;
      objc_msgSend(*(id *)(a1 + 32), "removeAllIndexes", *(_QWORD *)&v35);
      objc_msgSend(*(id *)(a1 + 40), "removeAllIndexes");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "removeAllResources");
      v11 = *(void **)(a1 + 56);
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __50__PXStoryConcreteTimelineScorer_scoreForTimeline___block_invoke_3;
      v42[3] = &unk_1E5125F78;
      v45 = &v57;
      v46 = &v67;
      v12 = v7[1];
      v50 = *v7;
      v51 = v12;
      v38 = *(int8x16_t *)(a1 + 40);
      v47 = &v63;
      v13 = (id)v38.i64[0];
      v43 = vextq_s8(v38, v38, 8uLL);
      v44 = *(id *)(a1 + 32);
      v48 = &v52;
      v49 = &v71;
      *(_OWORD *)buf = v75;
      v40 = v76;
      v41 = v77;
      objc_msgSend(v11, "enumerateConcreteClipsInTimeRange:rect:usingBlock:", buf, v42, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
      if (v72[3] < 1)
      {
        v8 = 0.0;
        goto LABEL_30;
      }
      v14 = objc_msgSend(*(id *)(a1 + 32), "count");
      if (v14 == v72[3])
      {
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v68[3] / (double)v14
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                + 24);
        if (v14 >= 1)
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v64[3]
                                                                      + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72)
                                                                                              + 8)
                                                                                  + 24);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "composabilityScoreForSegmentWithDisplayAssets:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8));
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v17 = *(double *)(v15 + 24) + v16 * 1000.0;
      }
      else
      {
        if (v14 != 1)
        {
          PXAssertGetLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1A6789000, v25, OS_LOG_TYPE_ERROR, "currently only supporting single split assets", buf, 2u);
          }

          goto LABEL_15;
        }
        v18 = *(void **)(*(_QWORD *)(a1 + 48) + 16);
        v19 = objc_msgSend(*(id *)(a1 + 32), "firstIndex");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "resourcesDataSource");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setResourceIndex:resourcesDataSource:", v19, v20);

        v21 = *(_QWORD **)(a1 + 48);
        v22 = *(_QWORD *)(a1 + 56);
        v23 = v21[2];
        *(_OWORD *)buf = v75;
        v40 = v76;
        v41 = v77;
        objc_msgSend(v21, "_scoreForSplitAsset:inTimeline:segmentTimeRange:", v23, v22, buf);
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v17 = v24 + *(double *)(v15 + 24);
      }
      *(double *)(v15 + 24) = v17;
LABEL_15:
      if (v72[3] == 1)
      {
        v26 = (*(double (**)(double, double))(*(_QWORD *)(a1 + 64) + 16))(v58[6], v58[7]);
        v27 = (*(double (**)(double, double))(*(_QWORD *)(a1 + 64) + 16))(v53[4], v53[5]);
        v28 = *(double *)(a1 + 120);
        if (v27 >= v28)
          v29 = *(double *)(a1 + 120);
        else
          v29 = v27;
        if (v27 < v28)
          v27 = *(double *)(a1 + 120);
        if (v26 < v29 || v26 > v27)
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72)
                                                                                              + 8)
                                                                                  + 24)
                                                                      + v35;
      }
      PXSizeGetArea();
      v31 = v30;
      PXSizeGetArea();
      v33 = v31 / v32;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v33
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                              + 24);
      if ((PXRectApproximatelyEqualToRect() & 1) == 0)
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                + 24)
                                                                    + -12.0;
      if (v8 > 0.0 && (PXFloatEqualToFloatWithTolerance() & 1) == 0)
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                + 24)
                                                                    + -0.5;
      v8 = v33;
LABEL_30:
      v34 = v72[3];
      if (v6 <= 0)
      {
        if (v34 > 1)
          goto LABEL_39;
      }
      else
      {
        if (v34 == v6)
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72)
                                                                                              + 8)
                                                                                  + 24)
                                                                      + -0.5;
        if (v34 >= 2 && (unint64_t)v6 >= 2)
        {
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72)
                                                                                              + 8)
                                                                                  + 24)
                                                                      + -2.0;
LABEL_39:
          if (v37 >= 1 && v34 == v37)
            *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72)
                                                                                                + 8)
                                                                                    + 24)
                                                                        + -0.5;
          if (objc_msgSend(*(id *)(a1 + 40), "containsIndex:", 4))
            *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72)
                                                                                                + 8)
                                                                                    + 24)
                                                                        + -100.0;
          v34 = v72[3];
          v37 = v34;
          goto LABEL_45;
        }
        if (v34 >= 2)
          goto LABEL_39;
      }
LABEL_45:

      _Block_object_dispose(&v52, 8);
      _Block_object_dispose(&v57, 8);
      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(&v67, 8);
      _Block_object_dispose(&v71, 8);
      a3 += 3;
      v6 = v34;
      --v4;
    }
    while (v4);
  }
}

uint64_t __50__PXStoryConcreteTimelineScorer_scoreForTimeline___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v14;
  uint64_t v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23[13];
  CGRect v24;

  if (a2 >= 1)
  {
    v23[1] = v11;
    v23[2] = v10;
    v23[3] = v9;
    v23[4] = v8;
    v23[11] = v6;
    v23[12] = v7;
    v14 = a2;
    v15 = result;
    v16 = (double *)(a4 + 16);
    do
    {
      if (*(_QWORD *)(a5 + 8) == 1)
      {
        v17 = *(v16 - 2);
        v18 = *(v16 - 1);
        v19 = *v16;
        v20 = v16[1];
        v24.origin.x = v17;
        v24.origin.y = v18;
        v24.size.width = *v16;
        v24.size.height = v20;
        *(CGRect *)(*(_QWORD *)(*(_QWORD *)(v15 + 56) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(v15 + 56)+ 8)+ 32), v24);
        v23[0] = 0.0;
        objc_msgSend(*(id *)(v15 + 32), "_scoreForClipInfo:inClipFrame:timelineBounds:nUpBonus:", a5, v23, v17, v18, v19, v20, *(double *)(v15 + 96), *(double *)(v15 + 104), *(double *)(v15 + 112), *(double *)(v15 + 120));
        *(double *)(*(_QWORD *)(*(_QWORD *)(v15 + 64) + 8) + 24) = v21
                                                                     + *(double *)(*(_QWORD *)(*(_QWORD *)(v15 + 64)
                                                                                             + 8)
                                                                                 + 24);
        *(double *)(*(_QWORD *)(*(_QWORD *)(v15 + 72) + 8) + 24) = v23[0]
                                                                     + *(double *)(*(_QWORD *)(*(_QWORD *)(v15 + 72)
                                                                                             + 8)
                                                                                 + 24);
        objc_msgSend(*(id *)(v15 + 40), "addIndex:", *(_QWORD *)(a5 + 152));
        v22 = *a6;
        objc_msgSend(*(id *)(v15 + 48), "addIndex:", *a6);
        result = objc_msgSend(*(id *)(*(_QWORD *)(v15 + 32) + 8), "addResourceWithIndex:", v22);
        *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(v15 + 80) + 8) + 32) = *(_OWORD *)(a5 + 160);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v15 + 88) + 8) + 24);
      }
      a5 += 768;
      ++a6;
      v16 += 4;
      --v14;
    }
    while (v14);
  }
  return result;
}

@end
