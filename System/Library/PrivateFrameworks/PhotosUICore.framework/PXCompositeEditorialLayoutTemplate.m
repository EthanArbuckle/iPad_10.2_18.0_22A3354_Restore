@implementation PXCompositeEditorialLayoutTemplate

- (PXCompositeEditorialLayoutTemplate)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCompositeEditorialLayoutTemplate.m"), 36, CFSTR("%s is not available as initializer"), "-[PXCompositeEditorialLayoutTemplate init]");

  abort();
}

- (PXCompositeEditorialLayoutTemplate)initWithDescriptorDictionary:(id)a3
{
  id v4;
  PXCompositeEditorialLayoutTemplate *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXCompositeEditorialLayoutTemplate;
  v5 = -[PXCompositeEditorialLayoutTemplate init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfColumns"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_numberOfColumns = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aspectRatio"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v5->_tileAspectRatio = v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_identifier = objc_msgSend(v9, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rects"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCompositeEditorialLayoutTemplate _initRectsStorageWithDescriptors:](v5, "_initRectsStorageWithDescriptors:", v10);

  }
  return v5;
}

- (void)_initRectsStorageWithDescriptors:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  double v8;
  _QWORD v9[7];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  self->_numberOfRects = v5;
  self->_rects = (CGRect *)malloc_type_malloc(32 * v5, 0x1000040E0EAB150uLL);
  self->_rectWeights = (double *)malloc_type_malloc(8 * self->_numberOfRects, 0x100004000313F17uLL);
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0x47EFFFFFE0000000;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__PXCompositeEditorialLayoutTemplate__initRectsStorageWithDescriptors___block_invoke;
  v9[3] = &unk_1E513B2E8;
  v9[4] = self;
  v9[5] = &v14;
  v9[6] = &v10;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  if ((PXFloatApproximatelyEqualToFloat() & 1) != 0)
  {
    self->_shouldIgnoreWeights = 1;
  }
  else if (self->_numberOfRects >= 1)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      PXRectArea();
      self->_rectWeights[v7++] = (v8 - v11[3]) / (v15[3] - v11[3]);
      v6 += 32;
    }
    while (v7 < self->_numberOfRects);
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

}

- (void)dealloc
{
  objc_super v3;

  free(self->_rects);
  free(self->_rectWeights);
  v3.receiver = self;
  v3.super_class = (Class)PXCompositeEditorialLayoutTemplate;
  -[PXCompositeEditorialLayoutTemplate dealloc](&v3, sel_dealloc);
}

- (void)_enumerateRectsUsingBlock:(id)a3
{
  uint64_t v5;
  int64_t v6;
  char v7;

  if (self->_numberOfRects >= 1)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = 0;
      (*((void (**)(id, int64_t, char *, CGFloat, CGFloat, CGFloat, CGFloat, double))a3 + 2))(a3, v6, &v7, self->_rects[v5].origin.x, self->_rects[v5].origin.y, self->_rects[v5].size.width, self->_rects[v5].size.height, self->_rectWeights[v6]);
      if (v7)
        break;
      ++v6;
      ++v5;
    }
    while (v6 < self->_numberOfRects);
  }
}

- (void)getComputedRects:(CGRect *)a3 contentSize:(CGSize *)a4 forReferenceSize:(CGSize)a5 interTileSpacing:(double)a6
{
  double width;
  uint64_t v11;
  double v12;
  __int128 v13;
  double v14;
  double v15;
  CGFloat v16;
  _QWORD v17[9];
  uint64_t v18;
  double *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;

  if (a3)
  {
    width = a5.width;
    v11 = -[PXCompositeEditorialLayoutTemplate numberOfColumns](self, "numberOfColumns", a5.width, a5.height);
    -[PXCompositeEditorialLayoutTemplate tileAspectRatio](self, "tileAspectRatio");
    v12 = (width - a6 * (double)(v11 - 1)) / (double)v11;
    v18 = 0;
    v19 = (double *)&v18;
    v20 = 0x4010000000;
    v21 = &unk_1A7E74EE7;
    v13 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v22 = *MEMORY[0x1E0C9D648];
    v23 = v13;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __101__PXCompositeEditorialLayoutTemplate_getComputedRects_contentSize_forReferenceSize_interTileSpacing___block_invoke;
    v17[3] = &unk_1E513B310;
    v17[4] = &v18;
    *(double *)&v17[5] = v12;
    *(double *)&v17[6] = a6;
    v15 = v12 / v14;
    *(double *)&v17[7] = v12 / v14;
    v17[8] = a3;
    -[PXCompositeEditorialLayoutTemplate _enumerateRectsUsingBlock:](self, "_enumerateRectsUsingBlock:", v17);
    if (a4)
    {
      v16 = v19[7] * (v15 + a6) - a6;
      a4->width = v19[6] * (v12 + a6) - a6;
      a4->height = v16;
    }
    _Block_object_dispose(&v18, 8);
  }
}

- (double)costForFittingLayoutItemInputs:(id)a3 inRange:(_NSRange)a4 ofTotalItemCount:(int64_t)a5 normalizedWeights:(double *)a6 useSaliency:(BOOL)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  int64_t v14;
  int64_t v15;
  id v16;
  int64_t v17;
  double v18;
  double v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, CGFloat, CGFloat, CGFloat, CGFloat);
  void *v24;
  id v25;
  PXCompositeEditorialLayoutTemplate *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  NSUInteger v30;
  NSUInteger v31;
  int64_t v32;
  int64_t v33;
  int64_t v34;
  double *v35;
  BOOL v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double *v46;
  uint64_t v47;
  uint64_t v48;

  length = a4.length;
  location = a4.location;
  v13 = a3;
  v45 = 0;
  v46 = (double *)&v45;
  v47 = 0x2020000000;
  v48 = 0;
  v41 = 0;
  v42 = (double *)&v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = (double *)&v37;
  v39 = 0x2020000000;
  v40 = 0;
  v14 = -[PXCompositeEditorialLayoutTemplate numberOfRects](self, "numberOfRects");
  v15 = -[PXCompositeEditorialLayoutTemplate numberOfColumns](self, "numberOfColumns");
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __124__PXCompositeEditorialLayoutTemplate_costForFittingLayoutItemInputs_inRange_ofTotalItemCount_normalizedWeights_useSaliency___block_invoke;
  v24 = &unk_1E513B338;
  v16 = v13;
  v25 = v16;
  v26 = self;
  v31 = length;
  v32 = v14;
  v33 = a5;
  v34 = v15;
  v36 = a7;
  v27 = &v37;
  v28 = &v45;
  v35 = a6;
  v29 = &v41;
  v30 = location;
  -[PXCompositeEditorialLayoutTemplate _enumerateRectsUsingBlock:](self, "_enumerateRectsUsingBlock:", &v21);
  v17 = -[PXCompositeEditorialLayoutTemplate numberOfRects](self, "numberOfRects", v21, v22, v23, v24);
  v18 = 100.000001;
  if (v17 + location != a5 - 1)
    v18 = 0.0;
  v19 = (v18 + v46[3] + v42[3] + v38[3]) / 0.100000001 / (double)self->_numberOfRects;

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  return v19;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (int64_t)numberOfRects
{
  return self->_numberOfRects;
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (double)tileAspectRatio
{
  return self->_tileAspectRatio;
}

void __124__PXCompositeEditorialLayoutTemplate_costForFittingLayoutItemInputs_inRange_ofTotalItemCount_normalizedWeights_useSaliency___block_invoke(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double Width;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  _BOOL4 v22;
  int v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  id v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v49.origin.x = a3;
  v49.origin.y = a4;
  v49.size.width = a5;
  v49.size.height = a6;
  Width = CGRectGetWidth(v49);
  v50.origin.x = a3;
  v50.origin.y = a4;
  v50.size.width = a5;
  v50.size.height = a6;
  v13 = Width / CGRectGetHeight(v50);
  objc_msgSend(*(id *)(a1 + 40), "tileAspectRatio");
  v15 = v13 * v14;
  objc_msgSend(v48, "size");
  v17 = v16;
  objc_msgSend(v48, "size");
  v19 = v17 / v18;
  if (v15 - v19 >= 0.0)
    v20 = v15 - v19;
  else
    v20 = -(v15 - v19);
  if (a2)
    v21 = 1;
  else
    v21 = *(_QWORD *)(a1 + 72) != 0;
  v22 = *(_QWORD *)(a1 + 88) - 1 != a2 || *(_QWORD *)(a1 + 80) + *(_QWORD *)(a1 + 72) != *(_QWORD *)(a1 + 96);
  v51.origin.x = a3;
  v51.origin.y = a4;
  v51.size.width = a5;
  v51.size.height = a6;
  if (*(_QWORD *)(a1 + 104) == (int)CGRectGetWidth(v51))
  {
    v23 = v19 > 2.5 || v22;
    if ((v21 & v23 & 1) == 0)
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 24)
                                                                  + 100.000001;
  }
  v47 = v20;
  if (!*(_BYTE *)(a1 + 120))
  {
    if (v20 < 0.400000006)
    {
      if (v20 >= 0.100000001)
        goto LABEL_31;
LABEL_28:
      v42 = -0.100000001;
LABEL_30:
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                              + 24)
                                                                  + v42;
      goto LABEL_31;
    }
LABEL_29:
    v42 = 0.100000001;
    goto LABEL_30;
  }
  v46 = v15;
  objc_msgSend(v48, "acceptableCropRect");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  objc_msgSend(v48, "preferredCropRect");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v52.origin.x = v25;
  v52.origin.y = v27;
  v52.size.width = v29;
  v52.size.height = v31;
  if (!CGRectIsNull(v52))
  {
    v53.origin.x = v33;
    v53.origin.y = v35;
    v53.size.width = v37;
    v53.size.height = v39;
    if (!CGRectIsNull(v53))
    {
      PXSizeGetAspectRatio();
      v41 = v46 - v40;
      if (v41 < 0.0)
        v41 = -v41;
      v47 = v41;
      PXRectWithAspectRatioFittingRect();
      PXRectGetCenter();
      PXRectWithCenterAndSize();
      v55.origin.x = v25;
      v55.origin.y = v27;
      v55.size.width = v29;
      v55.size.height = v31;
      if (!CGRectContainsRect(v54, v55))
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                                + 24)
                                                                    + 100.000001;
      if (v47 < 0.300000012)
      {
        if (v47 >= 0.0500000007)
          goto LABEL_31;
        goto LABEL_28;
      }
      goto LABEL_29;
    }
  }
LABEL_31:
  v43 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v43 + 24))
  {
    if (v47 >= 0.400000006)
    {
      v45 = 0.100000001;
      goto LABEL_38;
    }
    v44 = *(double *)(*(_QWORD *)(v43 + 16) + 8 * a2) - *(double *)(*(_QWORD *)(a1 + 112) + 8 * a2);
    if (v44 < 0.0)
      v44 = -v44;
    if (v44 < 0.100000001)
    {
      v45 = -0.100000001;
LABEL_38:
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 24)
                                                                  + v45;
    }
  }

}

double __101__PXCompositeEditorialLayoutTemplate_getComputedRects_contentSize_forReferenceSize_interTileSpacing___block_invoke(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v12;
  double v13;
  double v14;
  double v15;
  double result;
  double *v17;
  CGRect v18;

  v18.origin.x = a3;
  v18.origin.y = a4;
  v18.size.width = a5;
  v18.size.height = a6;
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), v18);
  v12 = *(double *)(a1 + 48);
  v13 = *(double *)(a1 + 40) + v12;
  v14 = a3 * v13;
  v15 = v12 + *(double *)(a1 + 56);
  result = -(v12 - a5 * v13);
  v17 = (double *)(*(_QWORD *)(a1 + 64) + 32 * a2);
  *v17 = v14;
  v17[1] = a4 * v15;
  v17[2] = result;
  v17[3] = -(v12 - a6 * v15);
  return result;
}

uint64_t __71__PXCompositeEditorialLayoutTemplate__initRectsStorageWithDescriptors___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  float v13;
  double v14;
  void *v15;
  float v16;
  double v17;
  double *v18;
  uint64_t result;
  double v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  v14 = v13;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "floatValue");
  v17 = v16;

  v18 = (double *)(*(_QWORD *)(a1[4] + 8) + 32 * a3);
  *v18 = v8;
  v18[1] = v11;
  v18[2] = v14;
  v18[3] = v17;
  result = PXRectArea();
  v21 = *(_QWORD *)(a1[5] + 8);
  if (v20 > *(double *)(v21 + 24))
    *(double *)(v21 + 24) = v20;
  v22 = *(_QWORD *)(a1[6] + 8);
  if (v20 < *(double *)(v22 + 24))
    *(double *)(v22 + 24) = v20;
  return result;
}

@end
