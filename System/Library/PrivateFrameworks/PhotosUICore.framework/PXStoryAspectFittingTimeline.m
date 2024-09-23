@implementation PXStoryAspectFittingTimeline

- (PXStoryAspectFittingTimeline)initWithOriginalTimeline:(id)a3 keySegmentMix:(id *)a4
{
  PXStoryAspectFittingTimeline *v5;
  PXStoryAspectFittingTimeline *v6;
  $7DA682ECC7253F641496E0B6E9C98204 *p_var2;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXStoryAspectFittingTimeline;
  v5 = -[PXStoryDerivedTimeline initWithOriginalTimeline:](&v9, sel_initWithOriginalTimeline_, a3);
  v6 = v5;
  if (v5)
  {
    p_var2 = ($7DA682ECC7253F641496E0B6E9C98204 *)&a4->var2;
    if (a4->var1 <= 0.5)
      p_var2 = a4;
    v5->_keySegmentIdentifier = p_var2->var0;
    -[PXStoryAspectFittingTimeline _setupKeySegmentDisplayAssetClips](v5, "_setupKeySegmentDisplayAssetClips");
  }
  return v6;
}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  objc_super v17;
  CMTime v18;
  CMTime v19;
  CMTime v20;
  CMTime v21;
  CMTimeRange rhs;
  CMTime v23;
  CMTimeRange v24;
  objc_super v25;
  CMTimeRange v26[2];
  CMTime duration;
  CMTimeRange lhs;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  memset(&v26[1], 0, sizeof(CMTimeRange));
  -[PXStoryDerivedTimeline timeRangeForSegmentWithIdentifier:](self, "timeRangeForSegmentWithIdentifier:", -[PXStoryAspectFittingTimeline keySegmentIdentifier](self, "keySegmentIdentifier"));
  v12 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&lhs.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&lhs.start.epoch = v12;
  *(_OWORD *)&lhs.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v26[0] = v26[1];
  if (PXStoryTimeRangeIntersectsTimeRange(&lhs, v26))
  {
    memset(v26, 0, 48);
    v13 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&lhs.start.epoch = v13;
    *(_OWORD *)&lhs.duration.timescale = *(_OWORD *)&a3->var1.var1;
    v24 = v26[1];
    PXStoryTimeRangeIntersection(&lhs, &v24, v26);
    memset(&v24, 0, sizeof(v24));
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&v26[0].start.value;
    lhs.start.epoch = v26[0].start.epoch;
    *(_OWORD *)&rhs.start.value = *(_OWORD *)&a3->var0.var0;
    rhs.start.epoch = a3->var0.var3;
    CMTimeSubtract(&v23, &lhs.start, &rhs.start);
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&v26[0].start.value;
    lhs.start.epoch = v26[0].start.epoch;
    rhs.start = v23;
    CMTimeRangeMake(&v24, &lhs.start, &rhs.start);
    memset(&rhs, 0, sizeof(rhs));
    lhs = v26[0];
    CMTimeRangeGetEnd(&v21, &lhs);
    v14 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&lhs.start.epoch = v14;
    *(_OWORD *)&lhs.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd(&v19, &lhs);
    lhs = v26[0];
    CMTimeRangeGetEnd(&v18, &lhs);
    lhs.start = v19;
    duration = v18;
    CMTimeSubtract(&v20, &lhs.start, &duration);
    lhs.start = v21;
    duration = v20;
    CMTimeRangeMake(&rhs, &lhs.start, &duration);
    v17.receiver = self;
    v17.super_class = (Class)PXStoryAspectFittingTimeline;
    lhs = v24;
    -[PXStoryDerivedTimeline enumerateClipsInTimeRange:rect:usingBlock:](&v17, sel_enumerateClipsInTimeRange_rect_usingBlock_, &lhs, v11, x, y, width, height);
    lhs = v26[0];
    -[PXStoryAspectFittingTimeline _enumerateClipsKeySegmentWithTimeRange:rect:usingBlock:](self, "_enumerateClipsKeySegmentWithTimeRange:rect:usingBlock:", &lhs, v11, x, y, width, height);
    lhs = rhs;
    -[PXStoryDerivedTimeline enumerateClipsInTimeRange:rect:usingBlock:](&v16, sel_enumerateClipsInTimeRange_rect_usingBlock_, &lhs, v11, x, y, width, height, self, PXStoryAspectFittingTimeline);
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)PXStoryAspectFittingTimeline;
    v15 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&lhs.start.epoch = v15;
    *(_OWORD *)&lhs.duration.timescale = *(_OWORD *)&a3->var1.var1;
    -[PXStoryDerivedTimeline enumerateClipsInTimeRange:rect:usingBlock:](&v25, sel_enumerateClipsInTimeRange_rect_usingBlock_, &lhs, v11, x, y, width, height, v16.receiver, v16.super_class);
  }

}

- (void)_setupKeySegmentDisplayAssetClips
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  NSArray *v19;
  void (**v20)(_QWORD);
  double v21;
  double v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t i;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  NSArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  char **v41;
  void *v42;
  double v43;
  double v44;
  CGFloat height;
  CGFloat width;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  CGFloat x;
  CGFloat y;
  uint64_t k;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t m;
  void *v68;
  NSArray *keySegmentDisplayAssetClips;
  NSArray *v70;
  double v71;
  PXStoryAspectFittingTimeline *v72;
  NSArray *v73;
  double v74;
  double v75;
  void (**v76)(_QWORD);
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  double v81;
  double v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  double v87;
  double v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD aBlock[4];
  NSArray *v98;
  unint64_t v99;
  objc_super v100;
  _QWORD v101[5];
  id v102;
  SEL v103;
  char v104[48];
  objc_super v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;

  v110 = *MEMORY[0x1E0C80C00];
  if (self->_keySegmentDisplayAssetClips)
    return;
  v105.receiver = self;
  v105.super_class = (Class)PXStoryAspectFittingTimeline;
  -[PXStoryDerivedTimeline frameForSegmentWithIdentifier:](&v105, sel_frameForSegmentWithIdentifier_, -[PXStoryAspectFittingTimeline keySegmentIdentifier](self, "keySegmentIdentifier"));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  PXSizeGetAspectRatio();
  v13 = 3;
  if (v12 < 1.0)
    v13 = 1;
  if (v12 > 1.0)
    v13 = 2;
  if (v13 == 3)
    v14 = 1;
  else
    v14 = v13;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXStoryDerivedTimeline timeRange](self, "timeRange");
  v16 = MEMORY[0x1E0C809B0];
  v101[0] = MEMORY[0x1E0C809B0];
  v101[1] = 3221225472;
  v101[2] = __65__PXStoryAspectFittingTimeline__setupKeySegmentDisplayAssetClips__block_invoke;
  v101[3] = &unk_1E513C5D8;
  v101[4] = self;
  v103 = a2;
  v17 = v15;
  v102 = v17;
  v72 = self;
  v100.receiver = self;
  v100.super_class = (Class)PXStoryAspectFittingTimeline;
  -[PXStoryDerivedTimeline enumerateClipsInTimeRange:rect:usingBlock:](&v100, sel_enumerateClipsInTimeRange_rect_usingBlock_, v104, v101, v5, v7, v9, v11);
  v18 = objc_msgSend(v17, "count");
  aBlock[0] = v16;
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PXStoryAspectFittingTimeline__setupKeySegmentDisplayAssetClips__block_invoke_2;
  aBlock[3] = &unk_1E5144EB8;
  v19 = (NSArray *)v17;
  v98 = v19;
  v99 = v18;
  v20 = (void (**)(_QWORD))_Block_copy(aBlock);
  v73 = v19;
  if ((v18 & 0xFFFFFFFFFFFFFFFELL) != 2)
    goto LABEL_34;
  PXSizeValueForAxis();
  v22 = v21;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v23 = v19;
  v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
  if (v24)
  {
    v25 = v24;
    v76 = v20;
    v26 = 0;
    v27 = *(_QWORD *)v94;
    v28 = 0.0;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v94 != v27)
          objc_enumerationMutation(v23);
        v30 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
        if (objc_msgSend(v30, "orientation") == v14)
        {
          ++v26;
        }
        else
        {
          objc_msgSend(v30, "displayAsset");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          MEMORY[0x1A85CD660](objc_msgSend(v31, "aspectRatio"));

          PXSizeValueForAxis();
          *(float *)&v32 = v32 / v22;
          v33 = *(float *)&v32;
          objc_msgSend(v30, "setWeight:", *(float *)&v32);
          v28 = v28 + v33;
        }
      }
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
    }
    while (v25);

    v20 = v76;
    if (v26)
    {
      v34 = (1.0 - v28) / (double)v26;
      v19 = v73;
      if (v34 > 0.5 / (double)v18)
      {
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v35 = v23;
        v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v89, v108, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v90;
          do
          {
            for (j = 0; j != v37; ++j)
            {
              if (*(_QWORD *)v90 != v38)
                objc_enumerationMutation(v35);
              v40 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
              if (objc_msgSend(v40, "orientation") == v14)
                objc_msgSend(v40, "setWeight:", v34);
            }
            v37 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v89, v108, 16);
          }
          while (v37);
        }

        v19 = v73;
        goto LABEL_35;
      }
      goto LABEL_34;
    }
    v19 = v73;
    if (v28 > 1.1)
LABEL_34:
      v20[2](v20);
  }
  else
  {

  }
LABEL_35:
  v41 = &selRef_compareByClipFrameOriginY_;
  if (v14 != 1)
    v41 = &selRef_compareByClipFrameOriginX_;
  -[NSArray sortedArrayUsingSelector:](v19, "sortedArrayUsingSelector:", *v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = *MEMORY[0x1E0C9D628];
  v44 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v87 = v5;
  v88 = v7;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v47 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v83, v107, 16);
  v71 = v7;
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v84;
    x = v43;
    y = v44;
    v74 = v11;
    v75 = v9;
    do
    {
      for (k = 0; k != v48; ++k)
      {
        if (*(_QWORD *)v84 != v49)
          objc_enumerationMutation(v42);
        v53 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * k);
        v81 = v9;
        v82 = v11;
        objc_msgSend(v53, "weight", *(_QWORD *)&v71);
        PXSizeValueForAxis();
        PXSizeSetValueForAxis();
        PXRectWithOriginAndSize();
        objc_msgSend(v53, "displayAsset");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        MEMORY[0x1A85CD660](objc_msgSend(v54, "aspectRatio"));

        PXRectWithSizeAlignedToRectEdges();
        v56 = v55;
        v58 = v57;
        v60 = v59;
        v62 = v61;
        v111.origin.x = x;
        v111.origin.y = y;
        v111.size.width = width;
        v111.size.height = height;
        if (CGRectIsNull(v111))
        {
          height = v62;
          width = v60;
          y = v58;
          x = v56;
        }
        else
        {
          v112.origin.x = x;
          v112.origin.y = y;
          v112.size.width = width;
          v112.size.height = height;
          v114.origin.x = v56;
          v114.origin.y = v58;
          v114.size.width = v60;
          v114.size.height = v62;
          v113 = CGRectUnion(v112, v114);
          x = v113.origin.x;
          y = v113.origin.y;
          width = v113.size.width;
          height = v113.size.height;
        }
        objc_msgSend(v53, "setTransformedFrame:", v56, v58, v60, v62);
        PXRectGetMaxForAxis();
        PXPointSetValueForAxis();
        v11 = v74;
        v9 = v75;
      }
      v48 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v83, v107, 16);
    }
    while (v48);
  }
  PXRectGetCenter();
  PXRectGetCenter();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v63 = v42;
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v77, v106, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v78;
    do
    {
      for (m = 0; m != v65; ++m)
      {
        if (*(_QWORD *)v78 != v66)
          objc_enumerationMutation(v63);
        v68 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * m);
        objc_msgSend(v68, "transformedFrame", *(_QWORD *)&v71);
        objc_msgSend(v68, "transformedFrame");
        PXPointSubtract();
        PXPointSubtract();
        objc_msgSend(v68, "setTransformedFrame:");
      }
      v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v77, v106, 16);
    }
    while (v65);
  }

  keySegmentDisplayAssetClips = v72->_keySegmentDisplayAssetClips;
  v72->_keySegmentDisplayAssetClips = v73;
  v70 = v73;

}

- (void)_enumerateClipsKeySegmentWithTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  __int128 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD v24[48];
  _OWORD v25[3];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char v32;
  objc_super v33;
  _QWORD v34[4];
  id v35;
  _BYTE v36[128];
  uint64_t v37;
  CGRect v38;
  CGRect v39;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v37 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __87__PXStoryAspectFittingTimeline__enumerateClipsKeySegmentWithTimeRange_rect_usingBlock___block_invoke;
  v34[3] = &unk_1E513C600;
  v12 = v11;
  v35 = v12;
  v33.receiver = self;
  v33.super_class = (Class)PXStoryAspectFittingTimeline;
  v13 = *(_OWORD *)&a3->var0.var3;
  v24[0] = *(_OWORD *)&a3->var0.var0;
  v24[1] = v13;
  v24[2] = *(_OWORD *)&a3->var1.var1;
  -[PXStoryDerivedTimeline enumerateClipsInTimeRange:rect:usingBlock:](&v33, sel_enumerateClipsInTimeRange_rect_usingBlock_, v24, v34, x, y, width, height);
  v32 = 0;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[PXStoryAspectFittingTimeline keySegmentDisplayAssetClips](self, "keySegmentDisplayAssetClips");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
LABEL_3:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v18);
      objc_msgSend(v19, "clipFrame");
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      if (CGRectIntersectsRect(v38, v39))
      {
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v19, "transformedFrame");
        *(_QWORD *)&v26 = v20;
        *((_QWORD *)&v26 + 1) = v21;
        *(_QWORD *)&v27 = v22;
        *((_QWORD *)&v27 + 1) = v23;
        memset(v25, 0, sizeof(v25));
        if (v19)
        {
          objc_msgSend(v19, "clipTimeRange");
          memset(&v24[30], 0, 32);
          objc_msgSend(v19, "clipInfo", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0);
        }
        else
        {
          bzero(v24, 0x300uLL);
        }
        (*((void (**)(id, uint64_t, _OWORD *, __int128 *, _OWORD *, char *))v12 + 2))(v12, 1, v25, &v26, v24, &v32);
        if (v32)
          break;
      }
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v16)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (int64_t)keySegmentIdentifier
{
  return self->_keySegmentIdentifier;
}

- (NSArray)keySegmentDisplayAssetClips
{
  return self->_keySegmentDisplayAssetClips;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keySegmentDisplayAssetClips, 0);
}

uint64_t __87__PXStoryAspectFittingTimeline__enumerateClipsKeySegmentWithTimeRange_rect_usingBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;

  if (a2)
  {
    v8 = a2;
    v9 = result;
    do
    {
      if (*(_QWORD *)(a5 + 8) != 1)
        result = (*(uint64_t (**)(void))(*(_QWORD *)(v9 + 32) + 16))();
      a4 += 32;
      a3 += 48;
      a5 += 768;
      --v8;
    }
    while (v8);
  }
  return result;
}

void __65__PXStoryAspectFittingTimeline__setupKeySegmentDisplayAssetClips__block_invoke(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v7;
  double *v9;
  void *v10;
  _PXStoryAspectFittingTimeline_DisplayAssetClip *v11;
  __int128 v12;
  void *v13;
  void *v14;
  _BYTE v15[768];
  _OWORD v16[4];

  if (a2)
  {
    v7 = a2;
    v9 = (double *)(a4 + 16);
    do
    {
      if (a5[1] == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", *a5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_alloc_init(_PXStoryAspectFittingTimeline_DisplayAssetClip);
        -[_PXStoryAspectFittingTimeline_DisplayAssetClip setClipFrame:](v11, "setClipFrame:", *(v9 - 2), *(v9 - 1), *v9, v9[1]);
        v12 = a3[1];
        v16[0] = *a3;
        v16[1] = v12;
        v16[2] = a3[2];
        -[_PXStoryAspectFittingTimeline_DisplayAssetClip setClipTimeRange:](v11, "setClipTimeRange:", v16);
        memcpy(v15, a5, sizeof(v15));
        -[_PXStoryAspectFittingTimeline_DisplayAssetClip setClipInfo:](v11, "setClipInfo:", v15);
        objc_msgSend(v10, "resource");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "px_storyResourceDisplayAsset");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PXStoryAspectFittingTimeline_DisplayAssetClip setDisplayAsset:](v11, "setDisplayAsset:", v14);

        objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
      }
      a3 += 3;
      v9 += 4;
      a5 += 96;
      --v7;
    }
    while (v7);
  }
}

void __65__PXStoryAspectFittingTimeline__setupKeySegmentDisplayAssetClips__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setWeight:", (float)(1.0 / (float)*(unint64_t *)(a1 + 40)), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

@end
