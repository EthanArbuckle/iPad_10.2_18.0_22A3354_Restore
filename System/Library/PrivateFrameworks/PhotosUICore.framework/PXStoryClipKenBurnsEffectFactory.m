@implementation PXStoryClipKenBurnsEffectFactory

- (PXStoryClipKenBurnsEffectFactory)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipKenBurnsEffect.m"), 121, CFSTR("%s is not available as initializer"), "-[PXStoryClipKenBurnsEffectFactory init]");

  abort();
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipKenBurnsEffectFactory;
  return -[PXStoryClipKenBurnsEffectFactory init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_clipFrames);
  free(self->_clipSafeAreaInsets);
  free(self->_clipAssetIndexes);
  free(self->_clipAssetSizes);
  free(self->_clipSuggestedCrops);
  free(self->_clipSourceTransforms);
  free(self->_clipTargetTransforms);
  free(self->_assetContentInfos);
  free(self->_assetPlaybackStyles);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipKenBurnsEffectFactory;
  -[PXStoryClipKenBurnsEffectFactory dealloc](&v3, sel_dealloc);
}

- (void)_configureWithSpec:(id)a3 clipComposition:(id)a4 displayAssets:(id)a5 croppingContext:(id)a6 croppingOptions:(unint64_t)a7 assetContentInfos:(id *)a8 playbackStyles:(const int64_t *)a9 separatorEffectParameters:(id *)a10
{
  id v18;
  id v19;
  int64_t v20;
  int v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  void *v34;
  CGSize *v35;
  CGFloat v36;
  unint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t i;
  $60B83496CA56D3588CF925FE7FBD90DC *v42;
  CGPoint origin;
  CGSize v44;
  CGSize v45;
  CGPoint v46;
  CGSize v47;
  CGSize v48;
  void *v49;
  id v50;
  id v51;
  int64_t assetCapacity;
  CGSize size;
  __int128 v54;

  v51 = a3;
  v50 = a4;
  v18 = a5;
  v19 = a6;
  objc_storeStrong((id *)&self->_spec, a3);
  objc_storeStrong((id *)&self->_clipComposition, a4);
  objc_storeStrong((id *)&self->_displayAssets, a5);
  objc_storeStrong((id *)&self->_croppingContext, a6);
  self->_croppingOptions = a7;
  v20 = -[PXStoryClipComposition numberOfClips](self->_clipComposition, "numberOfClips");
  self->_clipCount = v20;
  if (v20 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipKenBurnsEffect.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_clipCount >= 1"), v50, v51);

  }
  *(_QWORD *)&size.width = self->_clipCapacity;
  v21 = _PXGArrayCapacityResizeToCount();
  self->_clipCapacity = *(_QWORD *)&size.width;
  if (v21)
  {
    _PXGArrayResize();
    _PXGArrayResize();
    _PXGArrayResize();
    _PXGArrayResize();
    _PXGArrayResize();
    _PXGArrayResize();
  }
  -[PXStoryTimelineSpec viewportSize](self->_spec, "viewportSize");
  PXRectWithOriginAndSize();
  self->_bounds.origin.x = v22;
  self->_bounds.origin.y = v23;
  self->_bounds.size.width = v24;
  self->_bounds.size.height = v25;
  size = (CGSize)0;
  v54 = 0u;
  -[PXStoryTimelineSpec nUpDividerWidth](self->_spec, "nUpDividerWidth");
  v27 = v26;
  if (self->_clipCount == 1)
  {
    -[PXDisplayAssetFetchResult firstObject](self->_displayAssets, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "aspectRatio");
    size = self->_bounds.size;
    *(_QWORD *)&v54 = v27;
    *((_QWORD *)&v54 + 1) = v29;

  }
  else
  {
    size = self->_bounds.size;
    v54 = v26;
  }
  -[PXStoryClipComposition getClipFrames:forContext:](self->_clipComposition, "getClipFrames:forContext:", self->_clipFrames, &size);
  -[PXStoryTimelineSpec safeAreaInsets](self->_spec, "safeAreaInsets");
  PXEdgeInsetsForRectsFromEdgeInsetsForRect();
  PXStoryClipSeparatorEffectAdjustClipFramesAndSafeAreaInsets((uint64_t)a10, (uint64_t)self->_clipFrames, (uint64_t)self->_clipSafeAreaInsets, self->_clipCount);
  v30 = -[PXStoryClipComposition clipAssetIndexes](self->_clipComposition, "clipAssetIndexes");
  if (self->_clipCount >= 1)
  {
    v31 = v30;
    v32 = 0;
    v33 = 0;
    do
    {
      self->_clipAssetIndexes[v33] = *(_QWORD *)(v31 + 8 * v33);
      -[PXDisplayAssetFetchResult objectAtIndexedSubscript:](self->_displayAssets, "objectAtIndexedSubscript:");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = &self->_clipAssetSizes[v32];
      v36 = (double)(unint64_t)objc_msgSend(v34, "pixelWidth");
      v37 = objc_msgSend(v34, "pixelHeight");
      v35->width = v36;
      v35->height = (double)v37;

      ++v33;
      ++v32;
    }
    while (v33 < self->_clipCount);
  }
  v38 = objc_msgSend(v18, "count");
  assetCapacity = self->_assetCapacity;
  v39 = _PXGArrayCapacityResizeToCount();
  self->_assetCapacity = assetCapacity;
  if ((v39 & 1) != 0)
    _PXGArrayResize();
  if (v38 >= 1)
  {
    v40 = 0;
    for (i = 0; i != v38; ++i)
    {
      v42 = &self->_assetContentInfos[v40];
      v42->var0 = a8[v40].var0;
      origin = a8[v40].var1.origin;
      v44 = a8[v40].var1.size;
      v45 = a8[v40].var2.size;
      v42->var2.origin = a8[v40].var2.origin;
      v42->var2.size = v45;
      v42->var1.origin = origin;
      v42->var1.size = v44;
      v46 = a8[v40].var3.origin;
      v47 = a8[v40].var3.size;
      v48 = a8[v40].var4.size;
      v42->var4.origin = a8[v40].var4.origin;
      v42->var4.size = v48;
      v42->var3.origin = v46;
      v42->var3.size = v47;
      self->_assetPlaybackStyles[i] = a9[i];
      ++v40;
    }
  }
  self->_numberOfParameters = self->_clipCount;

}

- (CGRect)assetRectForClipIndex:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (self->_clipCount <= a3)
  {
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    PXRectWithOriginAndSize();
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)clipFrameForClipIndex:(int64_t)a3
{
  CGRect *v3;
  double width;
  double height;
  double x;
  double y;
  CGRect result;

  if (self->_clipCount <= a3)
    v3 = (CGRect *)MEMORY[0x1E0C9D628];
  else
    v3 = &self->_clipFrames[a3];
  width = v3->size.width;
  height = v3->size.height;
  x = v3->origin.x;
  y = v3->origin.y;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_getParameters:(id *)a3 forConfiguration:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double *v13;
  double v14;
  double v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CGAffineTransform *v20;
  CGAffineTransform *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  SEL v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CGAffineTransform *v36;
  void (*v37)(_QWORD *__return_ptr, _QWORD *, __int128 *);
  __int128 v38;
  __int128 v39;
  CGAffineTransform *v40;
  void (*v41)(_QWORD *__return_ptr, _QWORD *, __int128 *);
  __int128 v42;
  __int128 v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
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
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  $60B83496CA56D3588CF925FE7FBD90DC *assetContentInfos;
  int64_t v73;
  uint64_t v74;
  void (**v75)(double, double, double, double);
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  void (**v80)(void);
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
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
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[10];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _QWORD v121[6];
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD v125[6];
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _QWORD aBlock[5];
  CGAffineTransform v136;
  SEL v137;
  CGAffineTransform v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;

  v80 = (void (**)(void))a4;
  memset(&v138, 0, sizeof(v138));
  CGAffineTransformMakeScale(&v138, 0.0, 0.0);
  v6 = -[PXStoryClipComposition clipAssetIndexes](self->_clipComposition, "clipAssetIndexes");
  if (self->_clipCount >= 1)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = 24;
    do
    {
      v11 = *(_QWORD *)(v7 + 8 * v9);
      -[PXDisplayAssetFetchResult objectAtIndexedSubscript:](self->_displayAssets, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (double *)((char *)&self->_clipFrames->origin.x + v10);
      v14 = *(v13 - 1);
      v15 = *v13;
      PXRectWithOriginAndSize();
      PXEdgeInsetsInsetRect();
      PXRectNormalize();
      v16 = (double *)((char *)&self->_clipSuggestedCrops->origin.x + v10);
      *(v16 - 3) = PXStoryDisplayAssetSuggestedCrop(v12, &self->_assetContentInfos[v11].var0.width, self->_assetPlaybackStyles[v11], self->_croppingContext, self->_croppingOptions, v14, v15);
      *((_QWORD *)v16 - 2) = v17;
      *((_QWORD *)v16 - 1) = v18;
      *(_QWORD *)v16 = v19;
      v20 = &self->_clipSourceTransforms[v8];
      v21 = &self->_clipTargetTransforms[v8];
      v22 = *(_OWORD *)&v138.a;
      v23 = *(_OWORD *)&v138.tx;
      *(_OWORD *)&v21->c = *(_OWORD *)&v138.c;
      *(_OWORD *)&v21->tx = v23;
      *(_OWORD *)&v21->a = v22;
      v24 = *(_OWORD *)&v138.a;
      v25 = *(_OWORD *)&v138.tx;
      *(_OWORD *)&v20->c = *(_OWORD *)&v138.c;
      *(_OWORD *)&v20->tx = v25;
      *(_OWORD *)&v20->a = v24;
      self->_shouldFitSourceAndTargetIndependently = 0;

      ++v9;
      ++v8;
      v10 += 32;
    }
    while (v9 < self->_clipCount);
  }
  v80[2]();
  v26 = a2;
  if (self->_clipCount >= 1)
  {
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v84 = *((double *)off_1E50B86D0 + 1);
    v85 = *(double *)off_1E50B86D0;
    v82 = *((double *)off_1E50B86D0 + 3);
    v83 = *((double *)off_1E50B86D0 + 2);
    v30 = 8;
    do
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __68__PXStoryClipKenBurnsEffectFactory__getParameters_forConfiguration___block_invoke;
      aBlock[3] = &unk_1E512A5B8;
      v136 = v138;
      v137 = v26;
      aBlock[4] = self;
      v31 = _Block_copy(aBlock);
      PXRectWithOriginAndSize();
      v134 = 0u;
      v133 = 0u;
      v132 = 0u;
      v88 = v32;
      v89 = v33;
      v86 = v34;
      v87 = v35;
      PXStoryRectFromCGRect();
      v130 = 0u;
      v131 = 0u;
      v129 = 0u;
      PXAffineTransformMakeFromRects();
      v90 = v132;
      v91 = v133;
      v92 = v134;
      PXStoryRectApplyAffineTransform();
      v127 = 0u;
      v128 = 0u;
      v126 = 0u;
      PXAffineTransformMakeFromRects();
      v90 = v132;
      v91 = v133;
      v92 = v134;
      PXStoryRectApplyAffineTransform();
      v36 = &self->_clipSourceTransforms[v28];
      v37 = (void (*)(_QWORD *__return_ptr, _QWORD *, __int128 *))v31[2];
      v38 = *(_OWORD *)&v36->a;
      v39 = *(_OWORD *)&v36->tx;
      v91 = *(_OWORD *)&v36->c;
      v92 = v39;
      v90 = v38;
      v37(v125, v31, &v90);
      v122 = v129;
      v123 = v130;
      v124 = v131;
      PXStoryRectApplyAffineTransform();
      v129 = v90;
      v130 = v91;
      v131 = v92;
      v40 = &self->_clipTargetTransforms[v28];
      v41 = (void (*)(_QWORD *__return_ptr, _QWORD *, __int128 *))v31[2];
      v42 = *(_OWORD *)&v40->a;
      v43 = *(_OWORD *)&v40->tx;
      v91 = *(_OWORD *)&v40->c;
      v92 = v43;
      v90 = v42;
      v41(v121, v31, &v90);
      v122 = v126;
      v123 = v127;
      v124 = v128;
      PXStoryRectApplyAffineTransform();
      v126 = v90;
      v127 = v91;
      v128 = v92;
      v123 = 0u;
      v124 = 0u;
      v122 = 0u;
      PXStoryRectFromCGRect();
      v119 = 0u;
      v120 = 0u;
      v118 = 0u;
      v90 = v122;
      v91 = v123;
      v92 = v124;
      v115 = v129;
      v116 = v130;
      v117 = v131;
      PXStoryRectNormalize();
      v116 = 0u;
      v117 = 0u;
      v115 = 0u;
      v90 = v122;
      v91 = v123;
      v92 = v124;
      v112 = v126;
      v113 = v127;
      v114 = v128;
      PXStoryRectNormalize();
      v90 = v118;
      v91 = v119;
      v92 = v120;
      PXStoryRectOuterBounds();
      v45 = v44;
      v47 = v46;
      v49 = v48;
      v51 = v50;
      v90 = v115;
      v91 = v116;
      v92 = v117;
      PXStoryRectOuterBounds();
      v143.origin.x = v52;
      v143.origin.y = v53;
      v143.size.width = v54;
      v143.size.height = v55;
      v139.origin.x = v45;
      v139.origin.y = v47;
      v139.size.width = v49;
      v139.size.height = v51;
      v144 = CGRectUnion(v139, v143);
      v140.origin.y = v84;
      v140.origin.x = v85;
      v140.size.height = v82;
      v140.size.width = v83;
      if (!CGRectContainsRect(v140, v144))
      {
        v113 = 0u;
        v114 = 0u;
        v90 = v118;
        v91 = v119;
        v92 = v120;
        v109 = v132;
        v110 = v133;
        v111 = v134;
        v112 = 0u;
        PXStoryRectDenormalize();
        v110 = 0u;
        v111 = 0u;
        v90 = v115;
        v91 = v116;
        v92 = v117;
        v106 = v132;
        v107 = v133;
        v108 = v134;
        v109 = 0u;
        PXStoryRectDenormalize();
        if (self->_shouldFitSourceAndTargetIndependently)
        {
          v106 = v112;
          v107 = v113;
          v108 = v114;
          PXStoryRectFitIntoRect();
          v112 = v90;
          v113 = v91;
          v114 = v92;
          v106 = v109;
          v107 = v110;
          v108 = v111;
          PXStoryRectFitIntoRect();
          v109 = v90;
          v110 = v91;
          v111 = v92;
        }
        else
        {
          PXStoryRectsFitIntoRect();
          v90 = v112;
          v91 = v113;
          v92 = v114;
          PXStoryRectOuterBounds();
          v57 = v56;
          v59 = v58;
          v61 = v60;
          v63 = v62;
          v90 = v109;
          v91 = v110;
          v92 = v111;
          PXStoryRectOuterBounds();
          v145.origin.x = v64;
          v145.origin.y = v65;
          v145.size.width = v66;
          v145.size.height = v67;
          v141.origin.x = v57;
          v141.origin.y = v59;
          v141.size.width = v61;
          v141.size.height = v63;
          v142 = CGRectUnion(v141, v145);
          x = v142.origin.x;
          y = v142.origin.y;
          width = v142.size.width;
          height = v142.size.height;
          PXSizeGetAspectRatioWithDefault();
          *(_QWORD *)&v90 = 0;
          *((_QWORD *)&v90 + 1) = &v90;
          *(_QWORD *)&v91 = 0x4010000000;
          *((_QWORD *)&v91 + 1) = &unk_1A7E74EE7;
          *(CGFloat *)&v92 = x;
          *((CGFloat *)&v92 + 1) = y;
          *(CGFloat *)&v93 = width;
          *((CGFloat *)&v93 + 1) = height;
          assetContentInfos = self->_assetContentInfos;
          v73 = self->_clipAssetIndexes[v29];
          v105[0] = MEMORY[0x1E0C809B0];
          v105[1] = 3221225472;
          v105[2] = __68__PXStoryClipKenBurnsEffectFactory__getParameters_forConfiguration___block_invoke_19;
          v105[3] = &unk_1E512A5E0;
          v105[5] = v88;
          v105[6] = v89;
          v105[7] = v86;
          v105[8] = v87;
          v105[9] = v74;
          v105[4] = &v90;
          v75 = (void (**)(double, double, double, double))_Block_copy(v105);
          v75[2](assetContentInfos[v73].var1.origin.x, assetContentInfos[v73].var1.origin.y, assetContentInfos[v73].var1.size.width, assetContentInfos[v73].var1.size.height);
          ((void (*)(void (**)(double, double, double, double), CGFloat, CGFloat, CGFloat, CGFloat))v75[2])(v75, assetContentInfos[v73].var2.origin.x, assetContentInfos[v73].var2.origin.y, assetContentInfos[v73].var2.size.width, assetContentInfos[v73].var2.size.height);
          v107 = 0u;
          v108 = 0u;
          v106 = 0u;
          PXAffineTransformMakeFromRects();
          v99 = v112;
          v100 = v113;
          v101 = v114;
          v96 = v106;
          v97 = v107;
          v98 = v108;
          PXStoryRectApplyAffineTransform();
          v112 = v102;
          v113 = v103;
          v114 = v104;
          v99 = v109;
          v100 = v110;
          v101 = v111;
          v96 = v106;
          v97 = v107;
          v98 = v108;
          PXStoryRectApplyAffineTransform();
          v109 = v102;
          v110 = v103;
          v111 = v104;

          _Block_object_dispose(&v90, 8);
          v26 = a2;
        }
        v106 = v112;
        v107 = v113;
        v108 = v114;
        v102 = v132;
        v103 = v133;
        v104 = v134;
        PXStoryRectNormalize();
        v118 = v90;
        v119 = v91;
        v120 = v92;
        v106 = v109;
        v107 = v110;
        v108 = v111;
        v102 = v132;
        v103 = v133;
        v104 = v134;
        PXStoryRectNormalize();
        v115 = v90;
        v116 = v91;
        v117 = v92;
      }
      v76 = v119;
      v77 = v120;
      v94 = v116;
      v95 = v117;
      v93 = v115;
      *(_OWORD *)&a3->var0.var0.a = v118;
      *(_OWORD *)&a3->var0.var0.c = v76;
      v78 = v95;
      v79 = v93;
      *(_OWORD *)&a3->var1.var0.c = v94;
      *(_OWORD *)&a3->var1.var0.tx = v78;
      *(_OWORD *)&a3->var0.var0.tx = v77;
      *(_OWORD *)&a3->var1.var0.a = v79;

      ++v29;
      ++a3;
      ++v28;
      v27 += 32;
      v30 += 16;
    }
    while (v29 < self->_clipCount);
  }

}

- (void)getParametersForNoEffect:(id *)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__PXStoryClipKenBurnsEffectFactory_getParametersForNoEffect___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXStoryClipKenBurnsEffectFactory _getParameters:forConfiguration:](self, "_getParameters:forConfiguration:", a3, v3);
}

- (void)getParameters:(id *)a3 forZoomWithScale:(double)a4
{
  -[PXStoryClipKenBurnsEffectFactory getParameters:forZoomWithScale:relativeTransformOrigin:](self, "getParameters:forZoomWithScale:relativeTransformOrigin:", a3, a4, 0.5, 0.5);
}

- (void)getParameters:(id *)a3 forZoomWithScale:(double)a4 relativeTransformOrigin:(CGPoint)a5
{
  _QWORD v5[5];
  CGPoint v6;
  double v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__PXStoryClipKenBurnsEffectFactory_getParameters_forZoomWithScale_relativeTransformOrigin___block_invoke;
  v5[3] = &unk_1E51446C8;
  v6 = a5;
  v5[4] = self;
  v7 = a4;
  -[PXStoryClipKenBurnsEffectFactory _getParameters:forConfiguration:](self, "_getParameters:forConfiguration:", a3, v5);
}

- (void)getParameters:(id *)a3 forPanWithCameraMovingTowardsEdge:(unsigned int)a4 distance:(double)a5
{
  void *v10;
  _QWORD v11[6];
  unsigned int v12;

  if (self->_clipCount != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipKenBurnsEffect.m"), 320, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_clipCount == 1"));

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__PXStoryClipKenBurnsEffectFactory_getParameters_forPanWithCameraMovingTowardsEdge_distance___block_invoke;
  v11[3] = &unk_1E5135C30;
  v11[4] = self;
  v12 = a4;
  *(double *)&v11[5] = a5;
  -[PXStoryClipKenBurnsEffectFactory _getParameters:forConfiguration:](self, "_getParameters:forConfiguration:", a3, v11);
}

- (void)getParameters:(id *)a3 forVerticallyPanningPreferredRectMovingTowardsVerticalEdge:(unsigned int)a4
{
  void *v8;
  void *v9;
  _QWORD v10[6];
  unsigned int v11;

  if (self->_clipCount != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipKenBurnsEffect.m"), 331, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_clipCount == 1"));

  }
  if ((a4 & 0xFFFFFFFD) != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipKenBurnsEffect.m"), 332, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("edge == CGRectMinYEdge || edge == CGRectMaxYEdge"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __109__PXStoryClipKenBurnsEffectFactory_getParameters_forVerticallyPanningPreferredRectMovingTowardsVerticalEdge___block_invoke;
  v10[3] = &unk_1E5135C30;
  v10[4] = self;
  v10[5] = a2;
  v11 = a4;
  -[PXStoryClipKenBurnsEffectFactory _getParameters:forConfiguration:](self, "_getParameters:forConfiguration:", a3, v10);
}

- (void)getParameters:(id *)a3 forOppositePansWithDistance:(double)a4
{
  void *v8;
  _QWORD v9[6];

  if (self->_clipCount <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipKenBurnsEffect.m"), 374, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_clipCount >= 2"));

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__PXStoryClipKenBurnsEffectFactory_getParameters_forOppositePansWithDistance___block_invoke;
  v9[3] = &unk_1E5144EB8;
  v9[4] = self;
  *(double *)&v9[5] = a4;
  -[PXStoryClipKenBurnsEffectFactory _getParameters:forConfiguration:](self, "_getParameters:forConfiguration:", a3, v9);
}

- (void)getParameters:(id *)a3 forParallelPansWithDistance:(double)a4
{
  void *v8;
  _QWORD v9[6];

  if (self->_clipCount <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipKenBurnsEffect.m"), 397, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_clipCount >= 2"));

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__PXStoryClipKenBurnsEffectFactory_getParameters_forParallelPansWithDistance___block_invoke;
  v9[3] = &unk_1E5144EB8;
  v9[4] = self;
  *(double *)&v9[5] = a4;
  -[PXStoryClipKenBurnsEffectFactory _getParameters:forConfiguration:](self, "_getParameters:forConfiguration:", a3, v9);
}

- (void)_configureClipAtIndex:(int64_t)a3 forPanWithCameraMovingTowardsEdge:(unsigned int)a4 distance:(double)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  CGAffineTransform *v11;
  __int128 v12;
  __int128 v13;
  CGAffineTransform *v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform v17;

  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  switch(a4)
  {
    case 0u:
      v8 = 0.5;
      goto LABEL_5;
    case 1u:
      v9 = 0.5;
      goto LABEL_7;
    case 2u:
      v8 = -0.5;
LABEL_5:
      v6 = a5 * v8;
      break;
    case 3u:
      v9 = -0.5;
LABEL_7:
      v7 = a5 * v9;
      break;
    default:
      break;
  }
  v10 = a3;
  v11 = &self->_clipSourceTransforms[a3];
  CGAffineTransformMakeTranslation(&v17, -v6, -v7);
  v12 = *(_OWORD *)&v17.a;
  v13 = *(_OWORD *)&v17.tx;
  *(_OWORD *)&v11->c = *(_OWORD *)&v17.c;
  *(_OWORD *)&v11->tx = v13;
  *(_OWORD *)&v11->a = v12;
  v14 = &self->_clipTargetTransforms[v10];
  CGAffineTransformMakeTranslation(&v17, v6, v7);
  v15 = *(_OWORD *)&v17.a;
  v16 = *(_OWORD *)&v17.tx;
  *(_OWORD *)&v14->c = *(_OWORD *)&v17.c;
  *(_OWORD *)&v14->tx = v16;
  *(_OWORD *)&v14->a = v15;
}

- (void)getParameters:(id *)a3 forSplitAssetOppositePansWithDistance:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v13;
  int64_t v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  uint64_t v26;
  int64_t v27;
  __int128 v28;
  __int128 v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CGAffineTransform v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  if (self->_clipCount != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipKenBurnsEffect.m"), 438, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_clipCount == 2"));

  }
  -[PXStoryClipKenBurnsEffectFactory displayAssets](self, "displayAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryClipKenBurnsEffectFactory clipComposition](self, "clipComposition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mainDividerAxis");

  PXRectWithOriginAndSize();
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (self->_clipCount >= 1)
  {
    v13 = 0;
    v14 = 0;
    do
    {
      PXEdgeInsetsInsetRect();
      v48.origin.x = v15;
      v48.origin.y = v16;
      v48.size.width = v17;
      v48.size.height = v18;
      v45.origin.x = x;
      v45.origin.y = y;
      v45.size.width = width;
      v45.size.height = height;
      v46 = CGRectUnion(v45, v48);
      x = v46.origin.x;
      y = v46.origin.y;
      width = v46.size.width;
      height = v46.size.height;
      ++v14;
      v13 += 32;
    }
    while (v14 < self->_clipCount);
  }
  PXRectNormalize();
  v19 = PXStoryDisplayAssetSuggestedCrop(v7, (_QWORD *)&self->_assetContentInfos->var0.width, *self->_assetPlaybackStyles, self->_croppingContext, 0, self->_bounds.size.width, self->_bounds.size.height);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  PXRectGetCenter();
  PXRectWithCenterAndSize();
  v43 = 0u;
  v44 = 0u;
  v42 = 0u;
  PXStoryAffineTransformFittingRectsIntoRect();
  memset(&v38, 0, sizeof(v38));
  v47.origin.x = v19;
  v47.origin.y = v25;
  v47.size.width = v21;
  v47.size.height = v23;
  CGRectApplyAffineTransform(v47, &v38);
  if (self->_clipCount >= 1)
  {
    v26 = 0;
    v27 = 0;
    do
    {
      PXRectNormalize();
      PXRectDenormalize();
      PXRectNormalize();
      PXRectNormalize();
      PXStoryRectFromCGRect();
      PXStoryRectFromCGRect();
      v41 = v34;
      v39 = v32;
      v40 = v33;
      *(_OWORD *)&a3->var0.var0.a = v35;
      *(_OWORD *)&a3->var0.var0.c = v36;
      v28 = v41;
      v29 = v39;
      *(_OWORD *)&a3->var1.var0.c = v40;
      *(_OWORD *)&a3->var1.var0.tx = v28;
      *(_OWORD *)&a3->var0.var0.tx = v37;
      *(_OWORD *)&a3->var1.var0.a = v29;
      ++v27;
      ++a3;
      v26 += 32;
    }
    while (v27 < self->_clipCount);
  }

}

- (void)getParameters:(id *)a3 forRotationWithAngle:(double)a4 scale:(double)a5
{
  -[PXStoryClipKenBurnsEffectFactory getParameters:forRotationWithAngle:scale:relativeTransformOrigin:](self, "getParameters:forRotationWithAngle:scale:relativeTransformOrigin:", a3, a4, a5, 0.5, 0.5);
}

- (void)getParameters:(id *)a3 forRotationWithAngle:(double)a4 scale:(double)a5 relativeTransformOrigin:(CGPoint)a6
{
  _QWORD v6[5];
  CGPoint v7;
  double v8;
  double v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __101__PXStoryClipKenBurnsEffectFactory_getParameters_forRotationWithAngle_scale_relativeTransformOrigin___block_invoke;
  v6[3] = &unk_1E51490B0;
  v7 = a6;
  v6[4] = self;
  v8 = a5;
  v9 = a4;
  -[PXStoryClipKenBurnsEffectFactory _getParameters:forConfiguration:](self, "_getParameters:forConfiguration:", a3, v6);
}

- (PXStoryTimelineSpec)spec
{
  return self->_spec;
}

- (PXStoryClipComposition)clipComposition
{
  return self->_clipComposition;
}

- (PXStoryDisplayAssetCroppingContext)croppingContext
{
  return self->_croppingContext;
}

- (unint64_t)croppingOptions
{
  return self->_croppingOptions;
}

- (PXDisplayAssetFetchResult)displayAssets
{
  return self->_displayAssets;
}

- (int64_t)numberOfParameters
{
  return self->_numberOfParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayAssets, 0);
  objc_storeStrong((id *)&self->_croppingContext, 0);
  objc_storeStrong((id *)&self->_clipComposition, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

uint64_t __101__PXStoryClipKenBurnsEffectFactory_getParameters_forRotationWithAngle_scale_relativeTransformOrigin___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  _OWORD *v7;
  uint64_t v8;

  PXPointDenormalize();
  PXAffineTransformMakeScaleAndRotationAroundPoint();
  result = PXAffineTransformMakeScaleAndRotationAroundPoint();
  v3 = *(_QWORD *)(a1 + 32);
  if (*(uint64_t *)(v3 + 40) >= 1)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = (_OWORD *)(*(_QWORD *)(v3 + 96) + v4);
      v6[1] = 0u;
      v6[2] = 0u;
      *v6 = 0u;
      v7 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) + v4);
      v7[1] = 0u;
      v7[2] = 0u;
      *v7 = 0u;
      ++v5;
      v3 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(v3 + 40);
      v4 += 48;
    }
    while (v5 < v8);
    if (v8 == 1)
      *(_BYTE *)(v3 + 112) = 1;
  }
  return result;
}

__n128 __78__PXStoryClipKenBurnsEffectFactory_getParameters_forParallelPansWithDistance___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __n128 result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;

  objc_msgSend(*(id *)(a1 + 32), "clipComposition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mainDividerAxis");

  switch(v3)
  {
    case 1:
      v7 = 2;
LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_configureClipAtIndex:forPanWithCameraMovingTowardsEdge:distance:", 0, v7, *(double *)(a1 + 40));
      break;
    case 2:
      v7 = 3;
      goto LABEL_7;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipKenBurnsEffectFactory getParameters:forParallelPansWithDistance:]_block_invoke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipKenBurnsEffect.m"), 401, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (*(uint64_t *)(v8 + 40) >= 2)
  {
    v9 = 0;
    v10 = 1;
    do
    {
      v11 = (_OWORD *)(*(_QWORD *)(v8 + 96) + v9);
      v12 = v11[1];
      v11[3] = *v11;
      v11[4] = v12;
      v11[5] = v11[2];
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) + v9;
      v14 = *(_OWORD *)(v13 + 16);
      *(_OWORD *)(v13 + 48) = *(_OWORD *)v13;
      *(_OWORD *)(v13 + 64) = v14;
      result = *(__n128 *)(v13 + 32);
      *(__n128 *)(v13 + 80) = result;
      ++v10;
      v8 = *(_QWORD *)(a1 + 32);
      v9 += 48;
    }
    while (v10 < *(_QWORD *)(v8 + 40));
  }
  return result;
}

__n128 __78__PXStoryClipKenBurnsEffectFactory_getParameters_forOppositePansWithDistance___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __n128 result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;

  objc_msgSend(*(id *)(a1 + 32), "clipComposition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mainDividerAxis");

  switch(v3)
  {
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "_configureClipAtIndex:forPanWithCameraMovingTowardsEdge:distance:", 0, 1, *(double *)(a1 + 40));
      v7 = 3;
LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_configureClipAtIndex:forPanWithCameraMovingTowardsEdge:distance:", 1, v7, *(double *)(a1 + 40));
      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "_configureClipAtIndex:forPanWithCameraMovingTowardsEdge:distance:", 0, 2, *(double *)(a1 + 40));
      v7 = 0;
      goto LABEL_7;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipKenBurnsEffectFactory getParameters:forOppositePansWithDistance:]_block_invoke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipKenBurnsEffect.m"), 378, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (*(uint64_t *)(v8 + 40) >= 3)
  {
    v9 = 0;
    v10 = 2;
    do
    {
      v11 = (_OWORD *)(*(_QWORD *)(v8 + 96) + v9);
      v12 = v11[1];
      v11[6] = *v11;
      v11[7] = v12;
      v11[8] = v11[2];
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) + v9;
      v14 = *(_OWORD *)(v13 + 16);
      *(_OWORD *)(v13 + 96) = *(_OWORD *)v13;
      *(_OWORD *)(v13 + 112) = v14;
      result = *(__n128 *)(v13 + 32);
      *(__n128 *)(v13 + 128) = result;
      ++v10;
      v8 = *(_QWORD *)(a1 + 32);
      v9 += 48;
    }
    while (v10 < *(_QWORD *)(v8 + 40));
  }
  return result;
}

CGAffineTransform *__109__PXStoryClipKenBurnsEffectFactory_getParameters_forVerticallyPanningPreferredRectMovingTowardsVerticalEdge___block_invoke(uint64_t a1)
{
  CGFloat *v2;
  CGFloat v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double MinY;
  CGFloat v25;
  double MaxY;
  double v27;
  CGFloat v28;
  CGAffineTransform *result;
  _OWORD *v30;
  CGAffineTransform *v31;
  __int128 v32;
  __int128 v33;
  _OWORD *v34;
  CGAffineTransform *v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 *v41;
  __int128 *v42;
  __int128 v43;
  __int128 v44;
  __int128 *v45;
  __int128 *v46;
  __int128 v47;
  __int128 v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGAffineTransform v60;
  CGAffineTransform v61;
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
  __int128 v72;
  __int128 v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  PXRectWithOriginAndSize();
  v72 = 0u;
  v73 = 0u;
  v71 = 0u;
  PXStoryRectFromCGRect();
  v2 = *(CGFloat **)(*(_QWORD *)(a1 + 32) + 88);
  v3 = v2[3];
  v49 = v2[2];
  v50 = *v2;
  v59 = v2[1];
  PXRectFlippedVertically();
  PXRectDenormalize();
  x = v74.origin.x;
  y = v74.origin.y;
  width = v74.size.width;
  height = v74.size.height;
  CGRectGetMinY(v74);
  v69 = 0u;
  v70 = 0u;
  v68 = 0u;
  PXAffineTransformMakeFromRects();
  PXStoryRectApplyAffineTransform();
  PXStoryRectOuterBounds();
  v57 = v9;
  v58 = v8;
  v55 = v11;
  v56 = v10;
  v75.origin.x = x;
  v75.origin.y = y;
  v75.size.width = width;
  v75.size.height = height;
  CGRectGetMaxY(v75);
  v76.origin.x = v50;
  v76.origin.y = v59;
  v76.size.width = v49;
  v76.size.height = v3;
  CGRectGetHeight(v76);
  v66 = 0u;
  v67 = 0u;
  v65 = 0u;
  PXAffineTransformMakeFromRects();
  PXStoryRectApplyAffineTransform();
  PXStoryRectOuterBounds();
  v53 = v13;
  v54 = v12;
  v51 = v15;
  v52 = v14;
  v63 = 0u;
  v64 = 0u;
  v62 = 0u;
  PXAffineTransformMakeFromRects();
  PXStoryRectApplyAffineTransform();
  PXStoryRectOuterBounds();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  memset(&v61, 0, sizeof(v61));
  v77.origin.y = v57;
  v77.origin.x = v58;
  v77.size.height = v55;
  v77.size.width = v56;
  MinY = CGRectGetMinY(v77);
  v78.origin.x = v17;
  v78.origin.y = v19;
  v78.size.width = v21;
  v78.size.height = v23;
  v25 = CGRectGetMinY(v78);
  CGAffineTransformMakeTranslation(&v61, 0.0, MinY - v25);
  v79.origin.y = v53;
  v79.origin.x = v54;
  v79.size.height = v51;
  v79.size.width = v52;
  MaxY = CGRectGetMaxY(v79);
  v80.origin.x = v17;
  v80.origin.y = v19;
  v80.size.width = v21;
  v80.size.height = v23;
  v27 = MaxY - CGRectGetHeight(v80);
  memset(&v60, 0, sizeof(v60));
  v81.origin.x = v17;
  v81.origin.y = v19;
  v81.size.width = v21;
  v81.size.height = v23;
  v28 = CGRectGetMinY(v81);
  result = CGAffineTransformMakeTranslation(&v60, 0.0, v27 - v28);
  v30 = *(_OWORD **)(*(_QWORD *)(a1 + 32) + 96);
  if (*(_DWORD *)(a1 + 48) == 1)
    v31 = &v61;
  else
    v31 = &v60;
  v32 = *(_OWORD *)&v31->a;
  v33 = *(_OWORD *)&v31->tx;
  v30[1] = *(_OWORD *)&v31->c;
  v30[2] = v33;
  *v30 = v32;
  v34 = *(_OWORD **)(*(_QWORD *)(a1 + 32) + 104);
  if (*(_DWORD *)(a1 + 48) == 1)
    v35 = &v60;
  else
    v35 = &v61;
  v36 = *(_OWORD *)&v35->a;
  v37 = *(_OWORD *)&v35->tx;
  v34[1] = *(_OWORD *)&v35->c;
  v34[2] = v37;
  *v34 = v36;
  v38 = *(_QWORD *)(a1 + 32);
  if (*(uint64_t *)(v38 + 40) >= 2)
  {
    v39 = 1;
    v40 = 3;
    do
    {
      v41 = *(__int128 **)(v38 + 96);
      v42 = &v41[v40];
      v43 = *v41;
      v44 = v41[2];
      v42[1] = v41[1];
      v42[2] = v44;
      *v42 = v43;
      v45 = *(__int128 **)(*(_QWORD *)(a1 + 32) + 104);
      v46 = &v45[v40];
      v47 = *v45;
      v48 = v45[2];
      v46[1] = v45[1];
      v46[2] = v48;
      *v46 = v47;
      ++v39;
      v38 = *(_QWORD *)(a1 + 32);
      v40 += 3;
    }
    while (v39 < *(_QWORD *)(v38 + 40));
  }
  return result;
}

__n128 __93__PXStoryClipKenBurnsEffectFactory_getParameters_forPanWithCameraMovingTowardsEdge_distance___block_invoke(uint64_t a1)
{
  __n128 result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;

  objc_msgSend(*(id *)(a1 + 32), "_configureClipAtIndex:forPanWithCameraMovingTowardsEdge:distance:", 0, *(unsigned int *)(a1 + 48), *(double *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (*(uint64_t *)(v3 + 40) >= 2)
  {
    v4 = 0;
    v5 = 1;
    do
    {
      v6 = (_OWORD *)(*(_QWORD *)(v3 + 96) + v4);
      v7 = v6[1];
      v6[3] = *v6;
      v6[4] = v7;
      v6[5] = v6[2];
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) + v4;
      v9 = *(_OWORD *)(v8 + 16);
      *(_OWORD *)(v8 + 48) = *(_OWORD *)v8;
      *(_OWORD *)(v8 + 64) = v9;
      result = *(__n128 *)(v8 + 32);
      *(__n128 *)(v8 + 80) = result;
      ++v5;
      v3 = *(_QWORD *)(a1 + 32);
      v4 += 48;
    }
    while (v5 < *(_QWORD *)(v3 + 40));
  }
  return result;
}

__n128 __91__PXStoryClipKenBurnsEffectFactory_getParameters_forZoomWithScale_relativeTransformOrigin___block_invoke(uint64_t a1)
{
  __n128 result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  __n128 *v7;
  __n128 v8;
  __int128 v9;
  __n128 v10;
  __n128 v11;

  PXPointDenormalize();
  v9 = *MEMORY[0x1E0C9BAA8];
  v10 = *(__n128 *)(MEMORY[0x1E0C9BAA8] + 16);
  v11 = *(__n128 *)(MEMORY[0x1E0C9BAA8] + 32);
  v8 = *(__n128 *)MEMORY[0x1E0C9BAA8];
  PXAffineTransformMakeScaleFromPoint();
  v3 = *(_QWORD *)(a1 + 32);
  if (*(uint64_t *)(v3 + 40) >= 1)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = (_OWORD *)(*(_QWORD *)(v3 + 96) + v4);
      v6[1] = v10;
      v6[2] = v11;
      *v6 = v9;
      v7 = (__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) + v4);
      result = v8;
      v7[1] = v10;
      v7[2] = v11;
      *v7 = v8;
      ++v5;
      v3 = *(_QWORD *)(a1 + 32);
      v4 += 48;
    }
    while (v5 < *(_QWORD *)(v3 + 40));
  }
  return result;
}

uint64_t __61__PXStoryClipKenBurnsEffectFactory_getParametersForNoEffect___block_invoke(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD *v7;
  _OWORD *v8;

  v1 = *(_QWORD **)(result + 32);
  if ((uint64_t)v1[5] >= 1)
  {
    v2 = 0;
    v3 = 0;
    v4 = *MEMORY[0x1E0C9BAA8];
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    do
    {
      v7 = (_OWORD *)(v1[12] + v2);
      v8 = (_OWORD *)(v1[13] + v2);
      *v8 = v4;
      v8[1] = v5;
      v8[2] = v6;
      *v7 = v4;
      v7[1] = v5;
      v7[2] = v6;
      ++v3;
      v1 = *(_QWORD **)(result + 32);
      v2 += 48;
    }
    while (v3 < v1[5]);
  }
  return result;
}

__n128 __68__PXStoryClipKenBurnsEffectFactory__getParameters_forConfiguration___block_invoke@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, __n128 *a3@<X8>)
{
  __n128 *v3;
  __n128 v5;
  __int128 v6;
  __n128 v7;
  __n128 result;
  NSObject *v9;
  CGAffineTransform v10;
  CGAffineTransform t1;

  v3 = a2;
  v5 = a2[1];
  *(__n128 *)&t1.a = *a2;
  *(__n128 *)&t1.c = v5;
  *(__n128 *)&t1.tx = a2[2];
  v6 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v10.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&v10.c = v6;
  *(_OWORD *)&v10.tx = *(_OWORD *)(a1 + 72);
  if (CGAffineTransformEqualToTransform(&t1, &v10))
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(t1.a) = 0;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Ken Burns effect transform not specified", (uint8_t *)&t1, 2u);
    }

    v3 = (__n128 *)MEMORY[0x1E0C9BAA8];
  }
  v7 = v3[1];
  *a3 = *v3;
  a3[1] = v7;
  result = v3[2];
  a3[2] = result;
  return result;
}

uint64_t __68__PXStoryClipKenBurnsEffectFactory__getParameters_forConfiguration___block_invoke_19(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t result;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGRect v16;

  result = CGRectIsEmpty(*(CGRect *)&a2);
  if ((result & 1) == 0)
  {
    PXRectFlippedVertically();
    PXRectDenormalize();
    v16.origin.x = v7;
    v16.origin.y = v8;
    v16.size.width = v9;
    v16.size.height = v10;
    result = CGRectContainsRect(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), v16);
    if ((result & 1) == 0)
    {
      result = PXRectWithAspectRatioInsideRectContainingAsMuchAsPossibleOfRect();
      v11 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
      v11[4] = v12;
      v11[5] = v13;
      v11[6] = v14;
      v11[7] = v15;
    }
  }
  return result;
}

+ (id)reusableInstances
{
  if (reusableInstances_onceToken != -1)
    dispatch_once(&reusableInstances_onceToken, &__block_literal_global_127306);
  return (id)reusableInstances_reusableInstances;
}

+ (void)releaseCachedResources
{
  id obj;

  objc_msgSend(a1, "reusableInstances");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend(obj, "removeAllObjects");
  objc_sync_exit(obj);

}

+ (void)factoryForSpec:(id)a3 clipComposition:(id)a4 displayAssets:(id)a5 croppingContext:(id)a6 croppingOptions:(unint64_t)a7 assetContentInfos:(id *)a8 playbackStyles:(const int64_t *)a9 separatorEffectParameters:(id *)a10 handler:(id)a11
{
  id v16;
  id v17;
  id v18;
  void (**v19)(id, void *);
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v27;

  v27 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = (void (**)(id, void *))a11;
  objc_msgSend(a1, "reusableInstances");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v20);
  objc_msgSend(v20, "px_popLast");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
    v23 = v21;
  else
    v23 = -[PXStoryClipKenBurnsEffectFactory _init]([PXStoryClipKenBurnsEffectFactory alloc], "_init");
  v24 = v23;

  objc_sync_exit(v20);
  objc_msgSend(v24, "_configureWithSpec:clipComposition:displayAssets:croppingContext:croppingOptions:assetContentInfos:playbackStyles:separatorEffectParameters:", v27, v16, v17, v18, a7, a8, a9, a10);
  v19[2](v19, v24);
  v25 = v20;
  objc_sync_enter(v25);
  objc_msgSend(v25, "addObject:", v24);
  objc_sync_exit(v25);

}

+ (void)genericFactoryForSpec:(id)a3 assetContentSize:(CGSize)a4 handler:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  PXStoryBaseDisplayAssetCroppingContext *v16;
  uint64_t v17;
  _OWORD v18[9];
  _QWORD v19[6];
  _QWORD v20[2];

  height = a4.height;
  width = a4.width;
  v20[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a3;
  +[PXStoryClipCompositionFactory oneUpComposition](PXStoryClipCompositionFactory, "oneUpComposition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc((Class)off_1E50B5AF0);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__PXStoryClipKenBurnsEffectFactory_genericFactoryForSpec_assetContentSize_handler___block_invoke;
  v19[3] = &__block_descriptor_48_e35_v16__0___PXMutableSyntheticAsset__8l;
  *(CGFloat *)&v19[4] = width;
  *(CGFloat *)&v19[5] = height;
  v13 = (void *)objc_msgSend(v12, "initWithConfiguration:", v19);
  v20[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PXDisplayAssetFetchResultFromArray();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc_init(PXStoryBaseDisplayAssetCroppingContext);
  memset(v18, 0, sizeof(v18));
  v17 = 1;
  objc_msgSend(a1, "factoryForSpec:clipComposition:displayAssets:croppingContext:croppingOptions:assetContentInfos:playbackStyles:separatorEffectParameters:handler:", v10, v11, v15, v16, 0, v18, PXStoryBasicContentInfoForDisplayAsset(v13, (uint64_t)v18), &v17, 0, v9);

}

uint64_t __83__PXStoryClipKenBurnsEffectFactory_genericFactoryForSpec_assetContentSize_handler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

void __53__PXStoryClipKenBurnsEffectFactory_reusableInstances__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)reusableInstances_reusableInstances;
  reusableInstances_reusableInstances = (uint64_t)v0;

}

@end
