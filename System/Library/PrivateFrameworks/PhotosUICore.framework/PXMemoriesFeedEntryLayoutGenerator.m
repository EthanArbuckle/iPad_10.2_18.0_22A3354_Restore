@implementation PXMemoriesFeedEntryLayoutGenerator

- (PXMemoriesFeedEntryLayoutGenerator)initWithMetrics:(id)a3
{
  id v4;
  PXMemoriesFeedEntryLayoutGenerator *v5;
  uint64_t v6;
  PXMemoriesSpec *spec;
  NSIndexSet *v8;
  NSIndexSet *geometryKinds;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXMemoriesFeedEntryLayoutGenerator;
  v5 = -[PXMemoriesFeedLayoutGenerator initWithMetrics:](&v11, sel_initWithMetrics_, v4);
  if (v5)
  {
    objc_msgSend(v4, "spec");
    v6 = objc_claimAutoreleasedReturnValue();
    spec = v5->_spec;
    v5->_spec = (PXMemoriesSpec *)v6;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", 0);
    v8 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
    -[NSIndexSet addIndex:](v8, "addIndex:", 2);
    geometryKinds = v5->_geometryKinds;
    v5->_geometryKinds = v8;

    v5->_layoutAxis = 1;
  }

  return v5;
}

- (CGSize)estimatedSize
{
  double v3;
  double v4;
  CGSize result;

  -[PXMemoriesFeedEntryLayoutGenerator _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  -[PXMemoriesFeedEntryLayoutGenerator size](self, "size");
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  -[PXMemoriesFeedEntryLayoutGenerator _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)geometryKinds
{
  return self->_geometryKinds;
}

- (unint64_t)numberOfGeometriesWithKind:(int64_t)a3
{
  -[PXMemoriesFeedEntryLayoutGenerator _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  if (a3 == 2)
    return -[PXMemoriesFeedLayoutGenerator includeDateHeader](self, "includeDateHeader");
  if (a3)
    return 0;
  return -[PXMemoriesFeedEntryLayoutGenerator itemCount](self, "itemCount");
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length;
  int64_t location;
  CGFloat width;
  CGFloat height;
  CGFloat v12;
  CGFloat v13;
  _OWORD *v14;
  __int128 v15;
  CGPoint v16;
  unint64_t v17;
  NSDictionary *rectsByIndexByKind;
  void *v19;
  unint64_t v20;
  _PXLayoutGeometry *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGPoint v29;
  CGSize v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;

  length = a4.length;
  location = a4.location;
  -[PXMemoriesFeedEntryLayoutGenerator _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  if (a5)
  {
    if (a5 == 2 && !location && length)
    {
      if (-[PXMemoriesFeedLayoutGenerator includeDateHeader](self, "includeDateHeader"))
      {
        width = self->_sectionHeaderRect.size.width;
        height = self->_sectionHeaderRect.size.height;
        PXRectGetCenter();
        a3->var0 = 0;
        a3->var1.x = v12;
        a3->var1.y = v13;
        v14 = (_OWORD *)MEMORY[0x1E0C9BAA8];
        a3->var2.width = width;
        a3->var2.height = height;
        v15 = v14[1];
        *(_OWORD *)&a3->var3.a = *v14;
        *(_OWORD *)&a3->var3.c = v15;
        *(_OWORD *)&a3->var3.tx = v14[2];
        *(_QWORD *)&a3->var4 = 0;
        a3->var5 = 2;
        v16 = *(CGPoint *)off_1E50B86D0;
        a3->var6.size = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
        a3->var6.origin = v16;
        a3->var7.width = width;
        a3->var7.height = height;
      }
    }
  }
  else
  {
    v17 = -[PXMemoriesFeedEntryLayoutGenerator itemCount](self, "itemCount");
    rectsByIndexByKind = self->_rectsByIndexByKind;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](rectsByIndexByKind, "objectForKeyedSubscript:", v19);
    v34 = (id)objc_claimAutoreleasedReturnValue();

    if (v17 >= location + length)
      v20 = location + length;
    else
      v20 = v17;
    if (location <= (uint64_t)(v20 - 1))
    {
      v21 = &a3[location];
      v32 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v33 = *MEMORY[0x1E0C9BAA8];
      v31 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v29 = *(CGPoint *)off_1E50B86D0;
      v30 = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
      do
      {
        objc_msgSend(v34, "objectAtIndexedSubscript:", location, v29, v30, v31, v32, v33);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "CGRectValue");
        v24 = v23;
        v26 = v25;

        PXRectGetCenter();
        v21->var0 = location;
        v21->var1.x = v27;
        v21->var1.y = v28;
        v21->var2.width = v24;
        v21->var2.height = v26;
        *(_OWORD *)&v21->var3.a = v33;
        *(_OWORD *)&v21->var3.c = v32;
        *(_OWORD *)&v21->var3.tx = v31;
        *(_QWORD *)&v21->var4 = 0;
        v21->var5 = 0;
        v21->var6.size = v30;
        v21->var6.origin = v29;
        ++location;
        v21->var7.width = v24;
        v21->var7.height = v26;
        ++v21;
      }
      while (v20 != location);
    }

  }
}

- (void)setLayoutAxis:(int64_t)a3
{
  if (self->_layoutAxis != a3)
  {
    self->_layoutAxis = a3;
    -[PXMemoriesFeedEntryLayoutGenerator invalidate](self, "invalidate");
  }
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMemoriesFeedEntryLayoutGenerator;
  -[PXMemoriesFeedEntryLayoutGenerator invalidate](&v3, sel_invalidate);
  self->_isPrepared = 0;
}

- (void)_prepareLayoutIfNeeded
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  unint64_t v21;
  double v22;
  double v23;
  int64_t v24;
  _BOOL4 v25;
  PXMemoriesSpec *spec;
  double v27;
  double v28;
  _BOOL4 v29;
  CGPoint *v30;
  void *v31;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void (**v40)(_QWORD);
  id v41;
  void (**v42)(_QWORD);
  uint64_t v43;
  char v44;
  void (**v45)(_QWORD);
  CGFloat v46;
  NSDictionary *rectsByIndexByKind;
  NSDictionary *v48;
  NSDictionary *v49;
  _QWORD v50[5];
  id v51;
  uint64_t *v52;
  uint64_t *v53;
  int64_t v54;
  CGFloat v55;
  double v56;
  unint64_t v57;
  double v58;
  SEL v59;
  _QWORD v60[5];
  id v61;
  uint64_t *v62;
  uint64_t *v63;
  int64_t v64;
  CGFloat v65;
  double v66;
  uint64_t v67;
  double v68;
  SEL v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD aBlock[4];
  NSDictionary *v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  double *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  CGPoint *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;

  if (self->_isPrepared)
    return;
  self->_isPrepared = 1;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = -[PXMemoriesFeedEntryLayoutGenerator itemCount](self, "itemCount");
  -[PXMemoriesSpec feedInteritemSpacing](self->_spec, "feedInteritemSpacing");
  v7 = v6;
  -[PXMemoriesSpec feedEntryEdgeInsets](self->_spec, "feedEntryEdgeInsets");
  v9 = v8;
  v11 = v10;
  -[PXMemoriesFeedEntryLayoutGenerator metrics](self, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "referenceSize");
  v14 = v13;
  v16 = v15;

  PXEdgeInsetsInsetSize();
  v18 = v17;
  v20 = v19;
  v87 = 0;
  v88 = (CGPoint *)&v87;
  v89 = 0x3010000000;
  v90 = &unk_1A7E74EE7;
  v91 = v11;
  v92 = v9;
  v21 = -[PXMemoriesSpec feedMemoriesPerRow](self->_spec, "feedMemoriesPerRow");
  -[PXMemoriesSpec feedHeroImagePaddingTop](self->_spec, "feedHeroImagePaddingTop");
  v23 = v22;
  v24 = -[PXMemoriesFeedEntryLayoutGenerator layoutAxis](self, "layoutAxis");
  v25 = -[PXMemoriesFeedLayoutGenerator isFirstHeader](self, "isFirstHeader");
  spec = self->_spec;
  if (v25)
    -[PXMemoriesSpec firstFeedEntryHeaderHeight](spec, "firstFeedEntryHeaderHeight");
  else
    -[PXMemoriesSpec feedEntryHeaderHeight](spec, "feedEntryHeaderHeight");
  v28 = v27;
  v83 = 0;
  v84 = &v83;
  v85 = 0x2020000000;
  v86 = 0;
  v79 = 0;
  v80 = (double *)&v79;
  v81 = 0x2020000000;
  v82 = 0;
  v29 = -[PXMemoriesFeedLayoutGenerator includeDateHeader](self, "includeDateHeader");
  if (v29)
  {
    v30 = v88;
    self->_sectionHeaderRect.origin = v88[2];
    self->_sectionHeaderRect.size.width = v18;
    self->_sectionHeaderRect.size.height = v28;
LABEL_9:
    v30[2].y = v23 + v28 + v30[2].y;
    v20 = v20 - (v23 + v28);
    goto LABEL_10;
  }
  if (v24 == 2)
  {
    v30 = v88;
    goto LABEL_9;
  }
LABEL_10:
  if (v24 == 1)
  {
    v32 = v7;
    if (v29)
      -[PXMemoriesSpec distanceBetweenHeaderBaselineAndImageTop](self->_spec, "distanceBetweenHeaderBaselineAndImageTop", v7);
    v88[2].y = v32 + v88[2].y;
  }
  else if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedEntryLayoutGenerator.m"), 150, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v33 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PXMemoriesFeedEntryLayoutGenerator__prepareLayoutIfNeeded__block_invoke;
  aBlock[3] = &unk_1E512CF58;
  v49 = (NSDictionary *)v4;
  v75 = v49;
  v76 = &v79;
  v77 = &v83;
  v78 = v5;
  v34 = _Block_copy(aBlock);
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = v5;
  -[PXMemoriesFeedEntryLayoutGenerator metrics](self, "metrics");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "spec");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "feedHeroImageAspectRatio");
  v38 = v37;

  v60[0] = v33;
  v60[1] = 3221225472;
  v60[2] = __60__PXMemoriesFeedEntryLayoutGenerator__prepareLayoutIfNeeded__block_invoke_2;
  v60[3] = &unk_1E512CF80;
  v64 = v24;
  v65 = v18;
  v66 = v20;
  v67 = v38;
  v39 = v34;
  v68 = v7;
  v69 = a2;
  v60[4] = self;
  v61 = v39;
  v62 = &v87;
  v63 = &v70;
  v40 = (void (**)(_QWORD))_Block_copy(v60);
  v50[0] = v33;
  v50[1] = 3221225472;
  v50[2] = __60__PXMemoriesFeedEntryLayoutGenerator__prepareLayoutIfNeeded__block_invoke_3;
  v50[3] = &unk_1E512CF80;
  v54 = v24;
  v55 = v18;
  v56 = v20;
  v57 = v21;
  v58 = v7;
  v41 = v39;
  v52 = &v87;
  v53 = &v70;
  v59 = a2;
  v50[4] = self;
  v51 = v41;
  v42 = (void (**)(_QWORD))_Block_copy(v50);
  v40[2](v40);
  v43 = v71[3];
  if (v43 >= 1)
  {
    v44 = 0;
    do
    {
      if (v43 == 1 || (v45 = v42, v43 != 2) && (v45 = v42, (v44 & 1) != 0))
        v45 = v40;
      ((void (*)(void))v45[2])();
      v44 ^= 1u;
      v43 = v71[3];
    }
    while (v43 > 0);
  }
  if (v24 == 1)
  {
    v46 = v80[3];
    self->_size.width = v14;
    self->_size.height = v46;
  }
  else if (v24 == 2)
  {
    *(_QWORD *)&self->_size.width = v84[3];
    self->_size.height = v16;
  }
  rectsByIndexByKind = self->_rectsByIndexByKind;
  self->_rectsByIndexByKind = v49;
  v48 = v49;

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXMemoriesFeedEntryLayoutGenerator;
  result = -[PXMemoriesFeedEntryLayoutGenerator copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 16) = self->_layoutAxis;
  return result;
}

- (int64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rectsByIndexByKind, 0);
  objc_storeStrong((id *)&self->_geometryKinds, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

void __60__PXMemoriesFeedEntryLayoutGenerator__prepareLayoutIfNeeded__block_invoke(_QWORD *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  double x;
  double y;
  double width;
  double height;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v18 = CGRectIntegral(*(CGRect *)&a3);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  v12 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a1[7]);
    v14 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, v15);

  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v16);

  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  if (CGRectGetMaxY(v19) > *(double *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    *(CGFloat *)(*(_QWORD *)(a1[5] + 8) + 24) = CGRectGetMaxY(v20);
  }
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  if (CGRectGetMaxX(v21) > *(double *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    *(CGFloat *)(*(_QWORD *)(a1[6] + 8) + 24) = CGRectGetMaxX(v22);
  }

}

void __60__PXMemoriesFeedEntryLayoutGenerator__prepareLayoutIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  double v3;
  void *v4;
  double v5;

  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    if (v2 == 2)
    {
      v5 = *(double *)(a1 + 80);
      (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5, v5);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v5
                                                                  + *(double *)(a1 + 96)
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 32);
    }
    else if (v2 == 1)
    {
      v3 = *(double *)(a1 + 72) / *(double *)(a1 + 88);
      (*(void (**)(double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v3
                                                                  + *(double *)(a1 + 96)
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 40);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 32), CFSTR("PXMemoriesFeedEntryLayoutGenerator.m"), 195, CFSTR("Unexpected layout axis"));

  }
  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
}

void __60__PXMemoriesFeedEntryLayoutGenerator__prepareLayoutIfNeeded__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  double v3;
  char v4;
  char v5;
  uint64_t v6;
  double v7;
  char v8;
  char v9;
  uint64_t v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    if (v2 == 2)
    {
      v7 = (*(double *)(a1 + 80) - *(double *)(a1 + 96)) * 0.5;
      v8 = 1;
      do
      {
        v9 = v8;
        v10 = *(_QWORD *)(a1 + 40);
        PXPointAdd();
        (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
        v8 = 0;
        --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      }
      while ((v9 & 1) != 0);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v7
                                                                  + *(double *)(a1 + 96)
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 32);
    }
    else if (v2 == 1)
    {
      v3 = (*(double *)(a1 + 72) - (double)(*(_QWORD *)(a1 + 88) - 1) * *(double *)(a1 + 96))
         / (double)*(uint64_t *)(a1 + 88);
      v4 = 1;
      do
      {
        v5 = v4;
        v6 = *(_QWORD *)(a1 + 40);
        PXPointAdd();
        (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
        v4 = 0;
        --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      }
      while ((v5 & 1) != 0);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v3
                                                                  + *(double *)(a1 + 96)
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 40);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 32), CFSTR("PXMemoriesFeedEntryLayoutGenerator.m"), 244, CFSTR("Unexpected layout axis"));

  }
}

@end
