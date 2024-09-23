@implementation PXStoryMutableConcreteTimeline

- (void)dealloc
{
  objc_super v3;

  free(self->_playbackStyles);
  free(self->_assetContentInfos);
  free(self->_safeAreaInsets);
  free(self->_clippingAnimationInfos);
  free(self->_kenBurnsAnimationInfos);
  free(self->_transitionInfos);
  free(self->_audioInfos);
  free(self->_clipOptions);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryMutableConcreteTimeline;
  -[PXStoryConcreteTimeline dealloc](&v3, sel_dealloc);
}

- (int64_t)appendSegmentWithDurationInfo:(id *)a3 clipCount:(int64_t)a4 compositionInfo:(id *)a5 configuration:(id)a6
{
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  $60B83496CA56D3588CF925FE7FBD90DC *v20;
  UIEdgeInsets *v21;
  $05639EFCEA5A4C71312880FEE86DDA04 *v22;
  $AB3D63EC4C35981312A8019AE867EE27 *v23;
  char *v24;
  $654D12A5B96C89A393ABE69D6FE3CC0A *v25;
  uint64_t v26;
  uint64_t v27;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *v28;
  __int128 v29;
  __int128 v30;
  char *v31;
  signed int v32;
  uint64_t v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  $60B83496CA56D3588CF925FE7FBD90DC *v37;
  UIEdgeInsets *v38;
  $05639EFCEA5A4C71312880FEE86DDA04 *v39;
  CGSize size;
  $AB3D63EC4C35981312A8019AE867EE27 *v41;
  CGPoint origin;
  CGSize v43;
  CGSize v44;
  CGPoint v45;
  CGSize v46;
  CGSize v47;
  $C63E51281545771083DD8F52DBD4F646 *transitionInfos;
  __int128 v49;
  __int128 v50;
  char *v51;
  $654D12A5B96C89A393ABE69D6FE3CC0A *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  int64_t v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  double var6;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  CGSize v79;
  CGSize v80;
  CGPoint v81;
  CGSize v82;
  CGSize v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  char *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  signed int v98;
  int64_t v99;
  void (**v101)(id, int64_t *, int64_t *, CGRect *, _QWORD, $60B83496CA56D3588CF925FE7FBD90DC *, UIEdgeInsets *, $05639EFCEA5A4C71312880FEE86DDA04 *, $AB3D63EC4C35981312A8019AE867EE27 *, $C63E51281545771083DD8F52DBD4F646 *, $654D12A5B96C89A393ABE69D6FE3CC0A *, unint64_t *);
  int64_t **p_playbackStyles;
  int64_t v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  CGFloat width;
  CMTimeRange v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  double v119;
  __int128 v120;
  __int128 v121;
  uint64_t v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  int64_t v130;
  CMTimeRange range;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  int64_t var3;
  _BYTE duration[32];
  CGSize v144;
  CGPoint v145;
  CGSize v146;
  CGPoint v147;
  CGSize v148;
  CGPoint v149;
  CGSize v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  CGFloat v160;
  CMTimeRange v161;
  CMTimeRange v162;
  CMTime v163;

  v101 = (void (**)(id, int64_t *, int64_t *, CGRect *, _QWORD, $60B83496CA56D3588CF925FE7FBD90DC *, UIEdgeInsets *, $05639EFCEA5A4C71312880FEE86DDA04 *, $AB3D63EC4C35981312A8019AE867EE27 *, $C63E51281545771083DD8F52DBD4F646 *, $654D12A5B96C89A393ABE69D6FE3CC0A *, unint64_t *))a6;
  v103 = -[PXStoryConcreteTimeline numberOfClips](self, "numberOfClips");
  -[PXStoryConcreteTimeline setNumberOfClips:](self, "setNumberOfClips:", v103 + a4);
  range.start.value = self->_bufferCapacity;
  p_playbackStyles = &self->_playbackStyles;
  v10 = _PXGArrayCapacityResizeToCount();
  self->_bufferCapacity = range.start.value;
  if ((v10 & 1) != 0)
  {
    _PXGArrayResize();
    _PXGArrayResize();
    _PXGArrayResize();
    _PXGArrayResize();
    _PXGArrayResize();
    _PXGArrayResize();
    _PXGArrayResize();
  }
  if (a4 > 0)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v19 = *(_OWORD *)off_1E50B8020;
    v18 = *((_OWORD *)off_1E50B8020 + 1);
    do
    {
      (*p_playbackStyles)[v17] = 0;
      v20 = &self->_assetContentInfos[v11];
      v20->var2.origin = (CGPoint)xmmword_1A7C0BDF8;
      v20->var2.size = (CGSize)xmmword_1A7C0BE08;
      v20->var1.origin = (CGPoint)xmmword_1A7C0BDD8;
      v20->var1.size = (CGSize)xmmword_1A7C0BDE8;
      v20->var4.origin = (CGPoint)xmmword_1A7C0BE38;
      v20->var4.size = (CGSize)xmmword_1A7C0BE48;
      v20->var3.origin = (CGPoint)xmmword_1A7C0BE18;
      v20->var3.size = (CGSize)xmmword_1A7C0BE28;
      v20->var0 = (CGSize)PXStoryAssetContentInfoNull;
      v21 = &self->_safeAreaInsets[v12];
      *(_OWORD *)&v21->top = v19;
      *(_OWORD *)&v21->bottom = v18;
      v22 = &self->_clippingAnimationInfos[v13];
      *(_OWORD *)&v22->var0.var1.var1 = xmmword_1A7C0BE78;
      *(_OWORD *)&v22->var0.var2.var0 = unk_1A7C0BE88;
      *(_OWORD *)&v22->var0.var0.var0 = PXStoryClippingAnimationInfoNone;
      *(_OWORD *)&v22->var0.var0.var2 = unk_1A7C0BE68;
      *(_OWORD *)&v22->var1.var0.var0 = xmmword_1A7C0BEB8;
      *(_OWORD *)&v22->var1.var0.var2 = unk_1A7C0BEC8;
      *(_OWORD *)&v22->var0.var2.var2 = xmmword_1A7C0BE98;
      *(_OWORD *)&v22->var0.var3.var1 = unk_1A7C0BEA8;
      *(_OWORD *)&v22->var1.var3.var1 = xmmword_1A7C0BF08;
      *(_OWORD *)&v22->var2.var0 = xmmword_1A7C0BF18;
      *(_OWORD *)&v22->var1.var2.var0 = xmmword_1A7C0BEE8;
      *(_OWORD *)&v22->var1.var2.var2 = xmmword_1A7C0BEF8;
      *(_OWORD *)&v22->var1.var1.var1 = xmmword_1A7C0BED8;
      v22->var2.var3 = 0;
      v23 = &self->_kenBurnsAnimationInfos[v14];
      v23->var2.var3 = 0;
      *(_OWORD *)&v23->var0.var0.a = PXStoryKenBurnsAnimationInfoNone;
      *(_OWORD *)&v23->var0.var0.c = unk_1A7C0BF40;
      *(_OWORD *)&v23->var1.var0.tx = xmmword_1A7C0BF80;
      *(_OWORD *)&v23->var2.var0 = xmmword_1A7C0BF90;
      *(_OWORD *)&v23->var1.var0.a = xmmword_1A7C0BF60;
      *(_OWORD *)&v23->var1.var0.c = xmmword_1A7C0BF70;
      *(_OWORD *)&v23->var0.var0.tx = xmmword_1A7C0BF50;
      v24 = &self->_transitionInfos->var0 + v15;
      *(_OWORD *)v24 = PXStoryTransitionInfoNone;
      *((_OWORD *)v24 + 1) = xmmword_1A7C0B7D8;
      *((_QWORD *)v24 + 4) = 0;
      v25 = &self->_audioInfos[v16];
      v25->var6 = 0.0;
      *(_OWORD *)&v25->var2 = 0uLL;
      *(_OWORD *)&v25->var4 = 0uLL;
      *(_OWORD *)&v25->var0 = 0uLL;
      self->_clipOptions[v17++] = 0;
      ++v16;
      v15 += 40;
      ++v14;
      ++v13;
      ++v12;
      ++v11;
    }
    while (a4 != v17);
  }
  ((void (**)(id, int64_t *, int64_t *, CGRect *, int64_t *, $60B83496CA56D3588CF925FE7FBD90DC *, UIEdgeInsets *, $05639EFCEA5A4C71312880FEE86DDA04 *, $AB3D63EC4C35981312A8019AE867EE27 *, $C63E51281545771083DD8F52DBD4F646 *, $654D12A5B96C89A393ABE69D6FE3CC0A *, unint64_t *))v101)[2](v101, &self->super._clipResourceKinds[v103], &self->super._clipResourceIndexes[v103], &self->super._clipFrames[v103], *p_playbackStyles, self->_assetContentInfos, self->_safeAreaInsets, self->_clippingAnimationInfos, self->_kenBurnsAnimationInfos, self->_transitionInfos, self->_audioInfos, self->_clipOptions);
  memset(&v163, 0, sizeof(v163));
  if (-[PXStoryBaseTimeline lastSegmentIdentifier](self, "lastSegmentIdentifier"))
  {
    -[PXStoryConcreteTimeline timeRangeForSegmentWithIdentifier:](self, "timeRangeForSegmentWithIdentifier:", -[PXStoryBaseTimeline lastSegmentIdentifier](self, "lastSegmentIdentifier"));
    range = v162;
    CMTimeRangeGetEnd(&v163, &range);
  }
  else
  {
    v163.epoch = 0;
    *(_OWORD *)&v163.value = PXStoryTimeZero;
  }
  memset(&v161, 0, sizeof(v161));
  range.start = v163;
  *(_OWORD *)duration = *(_OWORD *)&a3->var1.var0;
  *(_QWORD *)&duration[16] = a3->var1.var3;
  CMTimeRangeMake(&v161, &range.start, (CMTime *)duration);
  v158 = PXStoryTransitionInfoNone;
  v159 = xmmword_1A7C0B7D8;
  v160 = 0.0;
  v26 = 0;
  do
  {
    v27 = v26 + v103;
    v28 = &self->super._clipTimeRanges[v26 + v103];
    v29 = *(_OWORD *)&v161.start.value;
    v30 = *(_OWORD *)&v161.duration.timescale;
    *(_OWORD *)&v28->var0.var3 = *(_OWORD *)&v161.start.epoch;
    *(_OWORD *)&v28->var1.var1 = v30;
    *(_OWORD *)&v28->var0.var0 = v29;
    self->super._clipIndicesSortedByTimeRangeEnd[v26 + v103] = v26 + v103;
    v31 = (char *)self->super._clipInfos + 768 * v26 + 768 * v103;
    do
      v32 = __ldaxr((unsigned int *)&PXStoryClipIdentifierMakeUnique_uniqueIdentifier);
    while (__stlxr(v32 + 1, (unsigned int *)&PXStoryClipIdentifierMakeUnique_uniqueIdentifier));
    v33 = v32;
    v34 = self->super._clipResourceKinds[v27];
    v35 = self->_clipOptions[v26];
    v36 = (*p_playbackStyles)[v26];
    v37 = &self->_assetContentInfos[v26];
    v38 = &self->_safeAreaInsets[v26];
    v39 = &self->_clippingAnimationInfos[v26];
    size = self->super._clipFrames[v27].size;
    v41 = &self->_kenBurnsAnimationInfos[v26];
    *(CGSize *)duration = v37->var0;
    origin = v37->var1.origin;
    v43 = v37->var1.size;
    v44 = v37->var2.size;
    v145 = v37->var2.origin;
    v146 = v44;
    *(CGPoint *)&duration[16] = origin;
    v144 = v43;
    v45 = v37->var3.origin;
    v46 = v37->var3.size;
    v47 = v37->var4.size;
    transitionInfos = self->_transitionInfos;
    v149 = v37->var4.origin;
    v150 = v47;
    v147 = v45;
    v148 = v46;
    v49 = *(_OWORD *)&v38->top;
    v50 = *(_OWORD *)&v38->bottom;
    v139 = *(_OWORD *)&v39->var1.var2.var2;
    v140 = *(_OWORD *)&v39->var1.var3.var1;
    v141 = *(_OWORD *)&v39->var2.var0;
    var3 = v39->var2.var3;
    v51 = &transitionInfos->var0 + 40 * v26;
    v135 = *(_OWORD *)&v39->var1.var0.var0;
    v136 = *(_OWORD *)&v39->var1.var0.var2;
    v137 = *(_OWORD *)&v39->var1.var1.var1;
    v138 = *(_OWORD *)&v39->var1.var2.var0;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&v39->var0.var1.var1;
    v132 = *(_OWORD *)&v39->var0.var2.var0;
    v133 = *(_OWORD *)&v39->var0.var2.var2;
    v134 = *(_OWORD *)&v39->var0.var3.var1;
    *(_OWORD *)&range.start.value = *(_OWORD *)&v39->var0.var0.var0;
    v52 = &self->_audioInfos[v26];
    v53 = *(_OWORD *)&a3->var0.var0;
    v54 = *(_OWORD *)&a3->var0.var3;
    v55 = *(_OWORD *)&a3->var1.var1;
    v56 = *(_OWORD *)&a3->var2.var0;
    v57 = *(_OWORD *)&a3->var2.var3;
    v58 = *(_OWORD *)&a3->var3.var0.var1;
    v59 = *(_OWORD *)&a3->var3.var1;
    *(_OWORD *)&range.start.epoch = *(_OWORD *)&v39->var0.var0.var2;
    v60 = *(_OWORD *)&v41->var1.var0.c;
    v61 = *(_OWORD *)&v41->var1.var0.tx;
    v62 = *(_OWORD *)&v41->var2.var0;
    v63 = *(_OWORD *)&v41->var0.var0.a;
    v64 = *(_OWORD *)&v41->var0.var0.c;
    v65 = *(_OWORD *)&v41->var0.var0.tx;
    v66 = *(_OWORD *)&v41->var1.var0.a;
    v67 = v41->var2.var3;
    v68 = *(_OWORD *)v51;
    v69 = *((_OWORD *)v51 + 1);
    v70 = *((_QWORD *)v51 + 4);
    v72 = *(_OWORD *)&v52->var2;
    v71 = *(_OWORD *)&v52->var4;
    v73 = *(_OWORD *)&v52->var0;
    var6 = v52->var6;
    *(_QWORD *)v31 = v33;
    *((_QWORD *)v31 + 1) = v34;
    *((_QWORD *)v31 + 4) = v35;
    v151 = v53;
    v152 = v54;
    v156 = v58;
    v157 = v59;
    v154 = v56;
    v155 = v57;
    v153 = v55;
    v127 = v60;
    v128 = v61;
    v129 = v62;
    v123 = v63;
    v124 = v64;
    v125 = v65;
    v126 = v66;
    *((CGSize *)v31 + 1) = size;
    v75 = v153;
    *(_OWORD *)(v31 + 88) = v154;
    v76 = v156;
    *(_OWORD *)(v31 + 104) = v155;
    *(_OWORD *)(v31 + 120) = v76;
    *(_OWORD *)(v31 + 136) = v157;
    v77 = v152;
    *(_OWORD *)(v31 + 40) = v151;
    *(_OWORD *)(v31 + 56) = v77;
    *(_OWORD *)(v31 + 72) = v75;
    *((_QWORD *)v31 + 19) = v36;
    *((_OWORD *)v31 + 10) = *(_OWORD *)duration;
    v78 = *(_OWORD *)&duration[16];
    v79 = v144;
    v80 = v146;
    *((CGPoint *)v31 + 13) = v145;
    *((CGSize *)v31 + 14) = v80;
    *((_OWORD *)v31 + 11) = v78;
    *((CGSize *)v31 + 12) = v79;
    v81 = v147;
    v82 = v148;
    v83 = v150;
    *((CGPoint *)v31 + 17) = v149;
    *((CGSize *)v31 + 18) = v83;
    *((CGPoint *)v31 + 15) = v81;
    *((CGSize *)v31 + 16) = v82;
    *((_OWORD *)v31 + 19) = v49;
    *((_OWORD *)v31 + 20) = v50;
    *((_OWORD *)v31 + 31) = v139;
    *((_OWORD *)v31 + 32) = v140;
    *((_OWORD *)v31 + 33) = v141;
    *((_QWORD *)v31 + 68) = var3;
    *((_OWORD *)v31 + 27) = v135;
    *((_OWORD *)v31 + 28) = v136;
    *((_OWORD *)v31 + 29) = v137;
    *((_OWORD *)v31 + 30) = v138;
    *((_OWORD *)v31 + 23) = *(_OWORD *)&range.duration.timescale;
    *((_OWORD *)v31 + 24) = v132;
    *((_OWORD *)v31 + 25) = v133;
    *((_OWORD *)v31 + 26) = v134;
    *((_OWORD *)v31 + 21) = *(_OWORD *)&range.start.value;
    v84 = *(_OWORD *)&range.start.epoch;
    v85 = v128;
    *(_OWORD *)(v31 + 616) = v127;
    *(_OWORD *)(v31 + 632) = v85;
    *(_OWORD *)(v31 + 648) = v129;
    v86 = v124;
    *(_OWORD *)(v31 + 552) = v123;
    *(_OWORD *)(v31 + 568) = v86;
    v87 = v126;
    *(_OWORD *)(v31 + 584) = v125;
    *(_OWORD *)(v31 + 600) = v87;
    v130 = v67;
    v122 = v70;
    v119 = var6;
    *((_QWORD *)v31 + 83) = v67;
    *((_QWORD *)v31 + 88) = v70;
    *((double *)v31 + 95) = v119;
    v120 = v68;
    v121 = v69;
    v118 = v71;
    v117 = v72;
    v116 = v73;
    *((_OWORD *)v31 + 22) = v84;
    v88 = v121;
    *((_OWORD *)v31 + 42) = v120;
    *((_OWORD *)v31 + 43) = v88;
    v89 = v118;
    v90 = v116;
    *(_OWORD *)(v31 + 728) = v117;
    *(_OWORD *)(v31 + 744) = v89;
    *(_OWORD *)(v31 + 712) = v90;
    v91 = &self->_transitionInfos->var0 + 40 * v26;
    v92 = *(_OWORD *)v91;
    v93 = *((_OWORD *)v91 + 1);
    v160 = *((double *)v91 + 4);
    v158 = v92;
    v159 = v93;
    ++v26;
  }
  while (v26 != a4);
  *(_OWORD *)duration = v158;
  *(_OWORD *)&duration[16] = v159;
  v144.width = v160;
  v94 = *(_OWORD *)&a5->var2;
  v123 = *(_OWORD *)&a5->var0;
  v124 = v94;
  *(_QWORD *)&v125 = a5->var4;
  v95 = *(_OWORD *)&a3->var3.var0.var1;
  v133 = *(_OWORD *)&a3->var2.var3;
  v134 = v95;
  v135 = *(_OWORD *)&a3->var3.var1;
  v96 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v96;
  v97 = *(_OWORD *)&a3->var2.var0;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v132 = v97;
  do
    v98 = __ldaxr((unsigned int *)&PXStorySegmentIdentifierMakeUnique_uniqueIdentifier);
  while (__stlxr(v98 + 1, (unsigned int *)&PXStorySegmentIdentifierMakeUnique_uniqueIdentifier));
  v104 = v98;
  v105 = v123;
  v106 = v124;
  v107 = v125;
  v108 = *(_OWORD *)duration;
  v109 = *(_OWORD *)&duration[16];
  width = v144.width;
  v111 = range;
  v115 = v135;
  v114 = v134;
  v113 = v133;
  v112 = v132;
  range = v161;
  v99 = -[PXStoryMutableConcreteTimeline addSegmentWithTimeRange:info:](self, "addSegmentWithTimeRange:info:", &range, &v104);

  return v99;
}

- (void)modifyInfoForSegmentAtIndex:(int64_t)a3 usingBlock:(id)a4
{
  void (**v7)(id, _BYTE *);
  char *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *v24;
  int64_t v25;
  int64_t v26;
  int64_t v27;
  char *v28;
  __int128 v29;
  __int128 v30;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *segmentTimeRanges;
  $EB79B37EDD75B660E5EC336E3C45010D *p_timeRange;
  void *v33;
  void *v34;
  CMTime v35;
  CMTime v36;
  $DEC141BA10DB957F4DDC414EFF8F1C09 rhs;
  CMTime v38;
  _BYTE v39[200];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  $DEC141BA10DB957F4DDC414EFF8F1C09 lhs;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[32];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _BYTE *))a4;
  if (-[PXStoryConcreteTimeline numberOfSegments](self, "numberOfSegments") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteTimeline.m"), 550, CFSTR("Asked to modify out-of bounds segment index %ld"), a3);

  }
  v8 = (char *)self->super._segmentInfos + 200 * a3;
  v9 = *(_QWORD *)v8;
  v10 = *(_OWORD *)(v8 + 88);
  v49 = *(_OWORD *)(v8 + 72);
  v50 = v10;
  v11 = *(_OWORD *)(v8 + 120);
  *(_OWORD *)v51 = *(_OWORD *)(v8 + 104);
  *(_OWORD *)&v51[16] = v11;
  v12 = *(_OWORD *)(v8 + 24);
  v45 = *(_OWORD *)(v8 + 8);
  v46 = v12;
  v13 = *(_OWORD *)(v8 + 56);
  v47 = *(_OWORD *)(v8 + 40);
  v48 = v13;
  v43 = *(_OWORD *)(v8 + 184);
  v42 = *(_OWORD *)(v8 + 168);
  v41 = *(_OWORD *)(v8 + 152);
  v40 = *(_OWORD *)(v8 + 136);
  *(_QWORD *)v39 = v9;
  *(_OWORD *)&v39[72] = v49;
  *(_OWORD *)&v39[88] = v50;
  *(_OWORD *)&v39[104] = *(_OWORD *)v51;
  *(_OWORD *)&v39[120] = *(_OWORD *)&v51[16];
  *(_OWORD *)&v39[8] = v45;
  *(_OWORD *)&v39[24] = v46;
  *(_OWORD *)&v39[40] = v47;
  *(_OWORD *)&v39[56] = v13;
  *(_OWORD *)&v39[184] = v43;
  *(_OWORD *)&v39[168] = v42;
  *(_OWORD *)&v39[152] = v41;
  *(_OWORD *)&v39[136] = v40;
  v7[2](v7, v39);
  if (*(_QWORD *)v39 != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteTimeline.m"), 554, CFSTR("Modified segment info identifier must match existing identifier."));

  }
  v14 = (char *)self->super._segmentInfos + 200 * a3;
  *(_OWORD *)v14 = *(_OWORD *)v39;
  v15 = *(_OWORD *)&v39[16];
  v16 = *(_OWORD *)&v39[32];
  v17 = *(_OWORD *)&v39[64];
  *((_OWORD *)v14 + 3) = *(_OWORD *)&v39[48];
  *((_OWORD *)v14 + 4) = v17;
  *((_OWORD *)v14 + 1) = v15;
  *((_OWORD *)v14 + 2) = v16;
  v18 = *(_OWORD *)&v39[80];
  v19 = *(_OWORD *)&v39[96];
  v20 = *(_OWORD *)&v39[128];
  *((_OWORD *)v14 + 7) = *(_OWORD *)&v39[112];
  *((_OWORD *)v14 + 8) = v20;
  *((_OWORD *)v14 + 5) = v18;
  *((_OWORD *)v14 + 6) = v19;
  v21 = *(_OWORD *)&v39[144];
  v22 = *(_OWORD *)&v39[160];
  v23 = *(_OWORD *)&v39[176];
  *((_QWORD *)v14 + 24) = *(_QWORD *)&v39[192];
  *((_OWORD *)v14 + 10) = v22;
  *((_OWORD *)v14 + 11) = v23;
  *((_OWORD *)v14 + 9) = v21;
  v24 = &self->super._segmentTimeRanges[a3];
  v25 = *(_QWORD *)&v39[128];
  *(_OWORD *)&v24->var1.var0 = *(_OWORD *)&v39[112];
  v24->var1.var3 = v25;
  memset(&v38, 0, sizeof(v38));
  *(_OWORD *)&lhs.var0.var0 = *(_OWORD *)&v39[112];
  lhs.var0.var3 = *(_QWORD *)&v39[128];
  *(_OWORD *)&rhs.var0.var0 = *(_OWORD *)&v51[8];
  rhs.var0.var3 = *(_QWORD *)&v51[24];
  CMTimeSubtract(&v38, (CMTime *)&lhs, (CMTime *)&rhs);
  lhs.var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v38;
  *(_OWORD *)&rhs.var0.var0 = PXStoryTimeZero;
  rhs.var0.var3 = 0;
  if (CMTimeCompare((CMTime *)&lhs, (CMTime *)&rhs))
  {
    v26 = a3 + 1;
    if (a3 + 1 < -[PXStoryConcreteTimeline numberOfSegments](self, "numberOfSegments"))
    {
      v27 = 48 * a3 + 48;
      do
      {
        v28 = (char *)self->super._segmentTimeRanges + v27;
        rhs = *($DEC141BA10DB957F4DDC414EFF8F1C09 *)v28;
        v36 = v38;
        PXStoryTimeRangeOffset((CMTime *)&rhs, &v36, (CMTimeRange *)&lhs);
        v29 = *(_OWORD *)&lhs.var0.var0;
        v30 = *(_OWORD *)&lhs.var1.var1;
        *((_OWORD *)v28 + 1) = *(_OWORD *)&lhs.var0.var3;
        *((_OWORD *)v28 + 2) = v30;
        *(_OWORD *)v28 = v29;
        ++v26;
        v27 += 48;
      }
      while (v26 < -[PXStoryConcreteTimeline numberOfSegments](self, "numberOfSegments"));
    }
  }
  segmentTimeRanges = self->super._segmentTimeRanges;
  p_timeRange = &self->super._timeRange;
  rhs = segmentTimeRanges[a3];
  lhs = rhs;
  CMTimeRangeGetEnd(&v35, (CMTimeRange *)&lhs);
  *(_OWORD *)&lhs.var0.var0 = *(_OWORD *)&p_timeRange->duration.value;
  lhs.var0.var3 = p_timeRange->duration.epoch;
  rhs.var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v35;
  CMTimeMaximum(&v36, (CMTime *)&lhs, (CMTime *)&rhs);
  p_timeRange->duration = ($95D729B680665BEAEFA1D6FCA8238556)v36;

}

- (int64_t)addSegmentWithTimeRange:(id *)a3 info:(id *)a4
{
  int64_t v7;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *v8;
  __int128 v9;
  __int128 v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CMTime v23;
  CMTime v24;
  CMTimeRange range;
  CMTime time2;

  v7 = -[PXStoryConcreteTimeline numberOfSegments](self, "numberOfSegments");
  -[PXStoryConcreteTimeline setNumberOfSegments:](self, "setNumberOfSegments:", v7 + 1);
  v8 = &self->super._segmentTimeRanges[v7];
  v9 = *(_OWORD *)&a3->var1.var1;
  v10 = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&v8->var0.var3 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&v8->var1.var1 = v9;
  *(_OWORD *)&v8->var0.var0 = v10;
  v7 *= 200;
  v11 = (char *)self->super._segmentInfos + v7;
  v12 = *(_OWORD *)&a4->var3.var0.var0;
  v13 = *(_OWORD *)&a4->var3.var0.var3;
  v14 = *(_OWORD *)&a4->var3.var1.var1;
  *((_OWORD *)v11 + 5) = *(_OWORD *)&a4->var2.var3;
  *((_OWORD *)v11 + 6) = v12;
  *((_OWORD *)v11 + 7) = v13;
  *((_OWORD *)v11 + 8) = v14;
  v15 = *(_OWORD *)&a4->var1.var3;
  v16 = *(_OWORD *)&a4->var2.var0;
  v17 = *(_OWORD *)&a4->var2.var2.var1;
  *((_OWORD *)v11 + 1) = *(_OWORD *)&a4->var1.var1;
  *((_OWORD *)v11 + 2) = v15;
  *((_OWORD *)v11 + 3) = v16;
  *((_OWORD *)v11 + 4) = v17;
  v18 = *(_OWORD *)&a4->var3.var2.var0;
  v19 = *(_OWORD *)&a4->var3.var2.var3;
  v20 = *(_OWORD *)&a4->var3.var3.var0.var1;
  *((_QWORD *)v11 + 24) = a4->var3.var3.var1;
  *((_OWORD *)v11 + 10) = v19;
  *((_OWORD *)v11 + 11) = v20;
  *((_OWORD *)v11 + 9) = v18;
  *(_OWORD *)v11 = *(_OWORD *)&a4->var0;
  v21 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v21;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v23, &range);
  range.start = (CMTime)self->super._timeRange.duration;
  time2 = v23;
  CMTimeMaximum(&v24, &range.start, &time2);
  self->super._timeRange.duration = ($95D729B680665BEAEFA1D6FCA8238556)v24;
  return *(int64_t *)((char *)&self->super._segmentInfos->var0 + v7);
}

- (void)appendTimeline:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  int64_t v18;
  uint64_t v19;
  uint64_t i;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *v21;
  __int128 v22;
  signed int v23;
  int64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t j;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *v28;
  __int128 v29;
  signed int v30;
  void *v31;
  _QWORD v32[4];
  __int128 v33;
  CMTimeEpoch var3;
  CMTime v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CMTimeRange v39;
  CMTime v40;
  CMTime v41;
  CMTimeRange range;
  CMTime rhs;

  v5 = a3;
  -[PXStoryConcreteTimeline size](self, "size");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "size");
  if (v7 != v11 || v9 != v10)
  {
    PXAssertGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(range.start.value) = 0;
      _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "timeline sizes aren't compatible", (uint8_t *)&range, 2u);
    }

  }
  -[PXStoryConcreteTimeline resourcesDataSource](self, "resourcesDataSource");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourcesDataSource");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 == v15)
  {

  }
  else
  {
    v16 = v15;
    v17 = objc_msgSend(v14, "isEqual:", v15);

    if ((v17 & 1) != 0)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteTimeline.m"), 582, CFSTR("timeline resources data sources aren't compatible"));
  }

LABEL_13:
  memset(&v41, 0, sizeof(v41));
  -[PXStoryConcreteTimeline timeRange](self, "timeRange");
  range = v39;
  CMTimeRangeGetEnd(&v40, &range);
  if (v5)
  {
    objc_msgSend(v5, "timeRange");
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
    v36 = 0u;
  }
  *(_OWORD *)&rhs.value = v36;
  rhs.epoch = v37;
  range.start = v40;
  CMTimeSubtract(&v41, &range.start, &rhs);
  v18 = -[PXStoryConcreteTimeline numberOfClips](self, "numberOfClips");
  v19 = objc_msgSend(v5, "numberOfClips");
  -[PXStoryConcreteTimeline setNumberOfClips:](self, "setNumberOfClips:", v19 + v18);
  _PXGArrayCopyRangeToArray();
  _PXGArrayCopyRangeToArray();
  _PXGArrayCopyRangeToArray();
  _PXGArrayCopyRangeToArray();
  _PXGArrayCopyRangeToArray();
  _PXGArrayCopyRangeToArray();
  if (v19 >= 1)
  {
    for (i = 0; i != v19; ++i)
    {
      v21 = &self->super._clipTimeRanges[i + v18];
      v33 = *(_OWORD *)&v21->var0.var0;
      var3 = v21->var0.var3;
      rhs = v41;
      *(_OWORD *)&range.start.value = v33;
      range.start.epoch = var3;
      CMTimeAdd(&v35, &range.start, &rhs);
      v22 = *(_OWORD *)&v35.value;
      v21->var0.var3 = v35.epoch;
      *(_OWORD *)&v21->var0.var0 = v22;
      self->super._clipIndicesSortedByTimeRangeEnd[i + v18] += v18;
      do
        v23 = __ldaxr((unsigned int *)&PXStoryClipIdentifierMakeUnique_uniqueIdentifier);
      while (__stlxr(v23 + 1, (unsigned int *)&PXStoryClipIdentifierMakeUnique_uniqueIdentifier));
      *(&self->super._clipInfos->var0 + 96 * i + 96 * v18) = v23;
    }
  }
  v24 = -[PXStoryConcreteTimeline numberOfSegments](self, "numberOfSegments", v5);
  v25 = v31;
  v26 = objc_msgSend(v31, "numberOfSegments");
  -[PXStoryConcreteTimeline setNumberOfSegments:](self, "setNumberOfSegments:", v26 + v24);
  _PXGArrayCopyRangeToArray();
  _PXGArrayCopyRangeToArray();
  if (v26 < 1)
    goto LABEL_28;
  for (j = 0; j != v26; ++j)
  {
    v28 = &self->super._segmentTimeRanges[j + v24];
    v33 = *(_OWORD *)&v28->var0.var0;
    var3 = v28->var0.var3;
    rhs = v41;
    *(_OWORD *)&range.start.value = v33;
    range.start.epoch = var3;
    CMTimeAdd(&v35, &range.start, &rhs);
    v29 = *(_OWORD *)&v35.value;
    v28->var0.var3 = v35.epoch;
    *(_OWORD *)&v28->var0.var0 = v29;
    do
      v30 = __ldaxr((unsigned int *)&PXStorySegmentIdentifierMakeUnique_uniqueIdentifier);
    while (__stlxr(v30 + 1, (unsigned int *)&PXStorySegmentIdentifierMakeUnique_uniqueIdentifier));
    *(&self->super._segmentInfos->var0 + 25 * j + 25 * v24) = v30;
  }
  v25 = v31;
  if (v31)
LABEL_28:
    objc_msgSend(v25, "timeRange");
  else
    memset(v32, 0, sizeof(v32));
  rhs = *(CMTime *)&v32[1];
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->super._timeRange.duration.value;
  range.start.epoch = self->super._timeRange.duration.epoch;
  CMTimeAdd(&v35, &range.start, &rhs);
  self->super._timeRange.duration = ($95D729B680665BEAEFA1D6FCA8238556)v35;

}

- (void)appendTimeRange:(id *)a3 fromTimeline:(id)a4
{
  id v6;
  __int128 v7;
  id v8;
  _OWORD v9[3];
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__PXStoryMutableConcreteTimeline_appendTimeRange_fromTimeline___block_invoke;
  v10[3] = &unk_1E512EDE0;
  v10[4] = self;
  v11 = v6;
  v7 = *(_OWORD *)&a3->var0.var3;
  v9[0] = *(_OWORD *)&a3->var0.var0;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a3->var1.var1;
  v8 = v6;
  objc_msgSend(v8, "enumerateSegmentsInTimeRange:usingBlock:", v9, v10);

}

- (int64_t)_appendSegmentFromTimeline:(id)a3 withIdentifier:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  int64_t v12;
  _OWORD v14[2];
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  uint64_t v27;
  _OWORD v28[12];
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  _BYTE v34[32];
  __int128 v35;
  _OWORD v36[3];
  __int128 v37;
  _OWORD v38[2];

  v6 = a3;
  v7 = v6;
  memset(v38, 0, sizeof(v38));
  v37 = 0u;
  if (v6)
  {
    objc_msgSend(v6, "timeRangeForSegmentWithIdentifier:", a4);
    *(_OWORD *)&v34[8] = *(_OWORD *)((char *)v38 + 8);
    *(_QWORD *)&v34[24] = *((_QWORD *)&v38[1] + 1);
    *(_QWORD *)v34 = 0;
    v33 = PXStoryTimeZero;
    memset(v36, 0, 40);
    v35 = PXStoryTimeMaximum;
    objc_msgSend(v7, "infoForSegmentWithIdentifier:", a4);
  }
  else
  {
    *(_OWORD *)&v34[8] = *(_OWORD *)((char *)v38 + 8);
    *(_QWORD *)&v34[24] = *((_QWORD *)&v38[1] + 1);
    *(_QWORD *)v34 = 0;
    v33 = PXStoryTimeZero;
    memset(v36, 0, 40);
    v35 = PXStoryTimeMaximum;
    v29 = 0;
    memset(v28, 0, sizeof(v28));
  }
  v30 = *(_OWORD *)((char *)v28 + 8);
  v31 = *(_OWORD *)((char *)&v28[1] + 8);
  v32 = *((_QWORD *)&v28[2] + 1);
  v16 = v37;
  v17 = v38[0];
  v18 = v38[1];
  v8 = objc_msgSend(v7, "_smallestRangeOfClipsPotentiallyIntersectingTimeRange:", &v16);
  v10 = v9;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __76__PXStoryMutableConcreteTimeline__appendSegmentFromTimeline_withIdentifier___block_invoke;
  v24[3] = &unk_1E512EE08;
  v26 = v8;
  v27 = v9;
  v25 = v7;
  v20 = v36[0];
  v21 = v36[1];
  v16 = v33;
  v17 = *(_OWORD *)v34;
  v18 = *(_OWORD *)&v34[16];
  v19 = v35;
  v22 = *(_QWORD *)&v36[2];
  v23 = 0;
  v14[0] = v30;
  v14[1] = v31;
  v15 = v32;
  v11 = v7;
  v12 = -[PXStoryMutableConcreteTimeline appendSegmentWithDurationInfo:clipCount:compositionInfo:configuration:](self, "appendSegmentWithDurationInfo:clipCount:compositionInfo:configuration:", &v16, v10, v14, v24);

  return v12;
}

- (void)setTimeline:(id)a3
{
  id v4;

  v4 = a3;
  -[PXStoryMutableConcreteTimeline removeAllClipsAndSegments](self, "removeAllClipsAndSegments");
  -[PXStoryMutableConcreteTimeline appendTimeline:](self, "appendTimeline:", v4);

}

- (int64_t)insertClipInTimeRange:(id *)a3 resourceKind:(int64_t)a4 options:(unint64_t)a5 resourceIndex:(int64_t)a6 frame:(CGRect)a7 transitionInfo:(id *)a8 kenBurnsAnimationInfo:(id *)a9
{
  signed int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  int64_t var3;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  char v30;
  _BYTE v31[7];
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
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
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  int64_t v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  _OWORD v73[3];
  __int128 v74;
  _BYTE v75[32];
  __int128 v76;
  _OWORD v77[3];

  memset(v31, 0, sizeof(v31));
  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v75[8] = a3->var1;
  *(_QWORD *)v75 = 0;
  v74 = PXStoryTimeZero;
  memset(v77, 0, 40);
  v76 = PXStoryTimeMaximum;
  do
    v9 = __ldaxr((unsigned int *)&PXStoryClipIdentifierMakeUnique_uniqueIdentifier);
  while (__stlxr(v9 + 1, (unsigned int *)&PXStoryClipIdentifierMakeUnique_uniqueIdentifier));
  v26 = v76;
  v27 = v77[0];
  v28 = v77[1];
  v29 = *(_QWORD *)&v77[2];
  v23 = v74;
  v24 = *(_OWORD *)v75;
  v25 = *(_OWORD *)&v75[16];
  v10 = *(_OWORD *)&a9->var0.var0.a;
  v11 = *(_OWORD *)&a9->var0.var0.c;
  v12 = *(_OWORD *)&a9->var1.var0.a;
  v60 = *(_OWORD *)&a9->var0.var0.tx;
  v61 = v12;
  v58 = v10;
  v59 = v11;
  var3 = a9->var2.var3;
  v14 = *(_OWORD *)&a9->var1.var0.c;
  v15 = *(_OWORD *)&a9->var2.var0;
  v63 = *(_OWORD *)&a9->var1.var0.tx;
  v64 = v15;
  v62 = v14;
  v65 = var3;
  v16 = *(_OWORD *)&a8->var0;
  v17 = *(_OWORD *)&a8->var2.var1;
  v68 = *(_QWORD *)&a8->var3;
  v66 = v16;
  v67 = v17;
  v35 = xmmword_1A7C0BDE8;
  v36 = xmmword_1A7C0BDF8;
  v33 = PXStoryAssetContentInfoNull;
  v34 = xmmword_1A7C0BDD8;
  v39 = xmmword_1A7C0BE28;
  v40 = xmmword_1A7C0BE38;
  v37 = xmmword_1A7C0BE08;
  v38 = xmmword_1A7C0BE18;
  v18 = *(_OWORD *)&a3->var0.var3;
  v73[0] = *(_OWORD *)&a3->var0.var0;
  v73[1] = v18;
  v73[2] = *(_OWORD *)&a3->var1.var1;
  v22[0] = v9;
  v22[1] = a4;
  v22[2] = *(_QWORD *)&a7.size.width;
  v22[3] = *(_QWORD *)&a7.size.height;
  v22[4] = a5;
  v30 = 0;
  v32 = 0;
  v19 = *(_OWORD *)off_1E50B8020;
  v20 = *((_OWORD *)off_1E50B8020 + 1);
  v41 = xmmword_1A7C0BE48;
  v42 = v19;
  v57 = 0;
  v43 = v20;
  v44 = PXStoryClippingAnimationInfoNone;
  v47 = unk_1A7C0BE88;
  v48 = xmmword_1A7C0BE98;
  v45 = unk_1A7C0BE68;
  v46 = xmmword_1A7C0BE78;
  v51 = unk_1A7C0BEC8;
  v52 = xmmword_1A7C0BED8;
  v49 = unk_1A7C0BEA8;
  v50 = xmmword_1A7C0BEB8;
  v55 = xmmword_1A7C0BF08;
  v56 = xmmword_1A7C0BF18;
  v53 = xmmword_1A7C0BEE8;
  v54 = xmmword_1A7C0BEF8;
  v70 = 0u;
  v71 = 0u;
  v69 = 0u;
  v72 = 0;
  return -[PXStoryMutableConcreteTimeline addClipWithTimeRange:frame:info:resourceIndex:](self, "addClipWithTimeRange:frame:info:resourceIndex:", v73, v22, a6, a7.origin.x, a7.origin.y);
}

- (int64_t)addClipWithTimeRange:(id *)a3 frame:(CGRect)a4 info:(id *)a5 resourceIndex:(int64_t)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *v17;
  __int128 v18;
  __int128 v19;
  CGRect *v20;
  int64_t *clipIndicesSortedByTimeRangeEnd;
  uint64_t v22;
  uint64_t v23;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = -[PXStoryConcreteTimeline numberOfClips](self, "numberOfClips");
  -[PXStoryConcreteTimeline setNumberOfClips:](self, "setNumberOfClips:", v14 + 1);
  v15 = PXFirstIndexInSortedRangePassingTest();
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    v16 = v14;
  else
    v16 = v15;
  _PXGArrayInsertRange();
  self->super._clipResourceKinds[v16] = a5->var1;
  _PXGArrayInsertRange();
  v17 = &self->super._clipTimeRanges[v16];
  v19 = *(_OWORD *)&a3->var0.var3;
  v18 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&v17->var0.var0 = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&v17->var0.var3 = v19;
  *(_OWORD *)&v17->var1.var1 = v18;
  _PXGArrayInsertRange();
  v20 = &self->super._clipFrames[v16];
  v20->origin.x = x;
  v20->origin.y = y;
  v20->size.width = width;
  v20->size.height = height;
  _PXGArrayInsertRange();
  memcpy((char *)self->super._clipInfos + 768 * v16, a5, 0x300uLL);
  _PXGArrayInsertRange();
  self->super._clipResourceIndexes[v16] = a6;
  if (v14 >= 1)
  {
    clipIndicesSortedByTimeRangeEnd = self->super._clipIndicesSortedByTimeRangeEnd;
    v22 = v14;
    do
    {
      if (*clipIndicesSortedByTimeRangeEnd >= v16)
        ++*clipIndicesSortedByTimeRangeEnd;
      ++clipIndicesSortedByTimeRangeEnd;
      --v22;
    }
    while (v22);
  }
  v23 = PXFirstIndexInSortedRangePassingTest();
  if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    v14 = v23;
  _PXGArrayInsertRange();
  self->super._clipIndicesSortedByTimeRangeEnd[v14] = v16;
  return *(&self->super._clipInfos->var0 + 96 * v16);
}

- (void)modifyOptionsForClipWithIdentifier:(int64_t)a3 hintIndex:(int64_t)a4 usingBlock:(id)a5
{
  void (**v9)(id, unint64_t *);
  int64_t v10;
  int64_t v11;
  NSObject *v12;
  $C99EDD0FAA5CC172DE20AC79C6A499CF *clipInfos;
  void *v14;
  uint8_t buf[16];

  v9 = (void (**)(id, unint64_t *))a5;
  v10 = -[PXStoryConcreteTimeline numberOfClips](self, "numberOfClips");
  v11 = v10;
  if (a4 < 0 || v10 <= a4 || *(&self->super._clipInfos->var0 + 96 * a4) != a3)
  {
    PXAssertGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "invalid hint index, this will cause a performance cliff", buf, 2u);
    }

    if (v11 < 1)
    {
      a4 = 0;
    }
    else
    {
      a4 = 0;
      clipInfos = self->super._clipInfos;
      while (clipInfos->var0 != a3)
      {
        clipInfos = ($C99EDD0FAA5CC172DE20AC79C6A499CF *)((char *)clipInfos + 768);
        if (v11 == ++a4)
        {
          a4 = v11;
          goto LABEL_13;
        }
      }
    }
  }
  if (a4 >= v11)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteTimeline.m"), 715, CFSTR("no clip found with identifier %li"), a3);

  }
  v9[2](v9, &self->super._clipInfos->var3 + 96 * a4);

}

- (void)removeAllClipsAndSegments
{
  PXStoryMutableConcreteTimeline *v2;
  __int128 v3;
  CMTimeRange v4;
  CMTime duration;
  CMTime start;

  v2 = self;
  -[PXStoryConcreteTimeline setNumberOfClips:](self, "setNumberOfClips:", 0);
  -[PXStoryConcreteTimeline setNumberOfSegments:](v2, "setNumberOfSegments:", 0);
  v2 = (PXStoryMutableConcreteTimeline *)((char *)v2 + 8);
  *(_OWORD *)&start.value = PXStoryTimeZero;
  start.epoch = 0;
  *(_OWORD *)&duration.value = PXStoryTimeZero;
  duration.epoch = 0;
  CMTimeRangeMake(&v4, &start, &duration);
  v3 = *(_OWORD *)&v4.start.epoch;
  *(_OWORD *)&v2->super.super.super.isa = *(_OWORD *)&v4.start.value;
  *(_OWORD *)&v2->super._timeRange.start.timescale = v3;
  *(_OWORD *)&v2->super._timeRange.duration.value = *(_OWORD *)&v4.duration.timescale;
}

- (void)setStartTime:(id *)a3
{
  __int128 v6;
  void *v7;
  CMTime v8;
  CMTimeRange v9;
  CMTime duration;
  CMTime start;

  if (-[PXStoryConcreteTimeline numberOfClips](self, "numberOfClips")
    || -[PXStoryConcreteTimeline numberOfSegments](self, "numberOfSegments"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteTimeline.m"), 726, CFSTR("currently only supporting changing the start time for an empty timeline"));

  }
  -[PXStoryConcreteTimeline timeRange](self, "timeRange");
  duration = v8;
  start = (CMTime)*a3;
  CMTimeRangeMake(&v9, &start, &duration);
  v6 = *(_OWORD *)&v9.start.epoch;
  *(_OWORD *)&self->super._timeRange.start.value = *(_OWORD *)&v9.start.value;
  *(_OWORD *)&self->super._timeRange.start.epoch = v6;
  *(_OWORD *)&self->super._timeRange.duration.timescale = *(_OWORD *)&v9.duration.timescale;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PXStoryConcreteTimeline initWithTimeline:]([PXStoryConcreteTimeline alloc], "initWithTimeline:", self);
}

BOOL __80__PXStoryMutableConcreteTimeline_addClipWithTimeRange_frame_info_resourceIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  CMTimeRange v4;
  CMTime v5;
  CMTimeRange range;

  v4 = *(CMTimeRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64)
                      + 48 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 8 * a2));
  range = v4;
  CMTimeRangeGetEnd(&v5, &range);
  *(_OWORD *)&v4.start.value = *(_OWORD *)(a1 + 40);
  v4.start.epoch = *(_QWORD *)(a1 + 56);
  range.start = v5;
  return CMTimeCompare(&range.start, &v4.start) > 0;
}

BOOL __80__PXStoryMutableConcreteTimeline_addClipWithTimeRange_frame_info_resourceIndex___block_invoke_2(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  CMTimeRange v4;
  CMTime v5;
  CMTime v6;
  CMTimeRange range;

  v4 = *(CMTimeRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64)
                      + 48 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 8 * a2));
  v2 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&range.start.value = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&range.start.epoch = v2;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 72);
  CMTimeRangeGetEnd(&v6, &range);
  range = v4;
  CMTimeRangeGetEnd(&v5, &range);
  range.start = v6;
  v4.start = v5;
  return CMTimeCompare(&range.start, &v4.start) < 1;
}

__n128 __76__PXStoryMutableConcreteTimeline__appendSegmentFromTimeline_withIdentifier___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _OWORD *a6, _OWORD *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  __n128 result;
  unint64_t v18;
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
  __int128 v37;
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
  __int128 v50;

  _PXGArrayCopyRangeToArray();
  _PXGArrayCopyRangeToArray();
  _PXGArrayCopyRangeToArray();
  if (a1[6])
  {
    v18 = 0;
    v22 = 768 * a1[5];
    do
    {
      v23 = *(_QWORD *)(a1[4] + 88) + v22;
      *(_QWORD *)(a5 + 8 * v18) = *(_QWORD *)(v23 + 152);
      *a6 = *(_OWORD *)(v23 + 160);
      v24 = *(_OWORD *)(v23 + 176);
      v25 = *(_OWORD *)(v23 + 192);
      v26 = *(_OWORD *)(v23 + 224);
      a6[3] = *(_OWORD *)(v23 + 208);
      a6[4] = v26;
      a6[1] = v24;
      a6[2] = v25;
      v27 = *(_OWORD *)(v23 + 240);
      v28 = *(_OWORD *)(v23 + 256);
      v29 = *(_OWORD *)(v23 + 288);
      a6[7] = *(_OWORD *)(v23 + 272);
      a6[8] = v29;
      a6[5] = v27;
      a6[6] = v28;
      v30 = *(_OWORD *)(v23 + 320);
      *a7 = *(_OWORD *)(v23 + 304);
      a7[1] = v30;
      a7 += 2;
      v31 = *(_OWORD *)(v23 + 416);
      v33 = *(_OWORD *)(v23 + 368);
      v32 = *(_OWORD *)(v23 + 384);
      *(_OWORD *)(a8 + 64) = *(_OWORD *)(v23 + 400);
      *(_OWORD *)(a8 + 80) = v31;
      *(_OWORD *)(a8 + 32) = v33;
      *(_OWORD *)(a8 + 48) = v32;
      v34 = *(_OWORD *)(v23 + 480);
      v36 = *(_OWORD *)(v23 + 432);
      v35 = *(_OWORD *)(v23 + 448);
      *(_OWORD *)(a8 + 128) = *(_OWORD *)(v23 + 464);
      *(_OWORD *)(a8 + 144) = v34;
      *(_OWORD *)(a8 + 96) = v36;
      *(_OWORD *)(a8 + 112) = v35;
      v38 = *(_OWORD *)(v23 + 512);
      v37 = *(_OWORD *)(v23 + 528);
      v39 = *(_OWORD *)(v23 + 496);
      *(_QWORD *)(a8 + 208) = *(_QWORD *)(v23 + 544);
      *(_OWORD *)(a8 + 176) = v38;
      *(_OWORD *)(a8 + 192) = v37;
      *(_OWORD *)(a8 + 160) = v39;
      v40 = *(_OWORD *)(v23 + 352);
      *(_OWORD *)a8 = *(_OWORD *)(v23 + 336);
      *(_OWORD *)(a8 + 16) = v40;
      v41 = *(_OWORD *)(v23 + 552);
      v42 = *(_OWORD *)(v23 + 568);
      v43 = *(_OWORD *)(v23 + 600);
      *(_OWORD *)(a9 + 32) = *(_OWORD *)(v23 + 584);
      *(_OWORD *)(a9 + 48) = v43;
      *(_OWORD *)a9 = v41;
      *(_OWORD *)(a9 + 16) = v42;
      v44 = *(_OWORD *)(v23 + 616);
      v45 = *(_OWORD *)(v23 + 632);
      v46 = *(_OWORD *)(v23 + 648);
      *(_QWORD *)(a9 + 112) = *(_QWORD *)(v23 + 664);
      *(_OWORD *)(a9 + 80) = v45;
      *(_OWORD *)(a9 + 96) = v46;
      *(_OWORD *)(a9 + 64) = v44;
      v47 = *(_OWORD *)(v23 + 672);
      v48 = *(_OWORD *)(v23 + 688);
      *(_QWORD *)(a10 + 32) = *(_QWORD *)(v23 + 704);
      *(_OWORD *)a10 = v47;
      *(_OWORD *)(a10 + 16) = v48;
      result = *(__n128 *)(v23 + 712);
      v49 = *(_OWORD *)(v23 + 728);
      v50 = *(_OWORD *)(v23 + 744);
      *(_QWORD *)(a11 + 48) = *(_QWORD *)(v23 + 760);
      *(_OWORD *)(a11 + 16) = v49;
      *(_OWORD *)(a11 + 32) = v50;
      *(__n128 *)a11 = result;
      a11 += 56;
      *(_QWORD *)(a12 + 8 * v18++) = *(_QWORD *)(v23 + 32);
      v22 += 768;
      a10 += 40;
      a9 += 120;
      a8 += 216;
      a6 += 9;
    }
    while (v18 < a1[6]);
  }
  return result;
}

uint64_t __63__PXStoryMutableConcreteTimeline_appendTimeRange_fromTimeline___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a2 >= 1)
  {
    v14 = v7;
    v15 = v6;
    v16 = v5;
    v17 = v4;
    v18 = v8;
    v19 = v9;
    v11 = a2;
    v12 = result;
    do
    {
      v13 = *a4;
      a4 += 25;
      result = objc_msgSend(*(id *)(v12 + 32), "_appendSegmentFromTimeline:withIdentifier:", *(_QWORD *)(v12 + 40), v13, v14, v15, v16, v17, v18, v19);
      --v11;
    }
    while (v11);
  }
  return result;
}

@end
