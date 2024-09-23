@implementation VKCaptureTextDetectionResult

- (VKCaptureTextDetectionResult)initWithBlock:(id)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  id v8;
  void *v9;
  VKCaptureTextDetectionResult *v10;
  id v12;
  uint64_t v13;

  height = a4.height;
  width = a4.width;
  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[VKCaptureTextDetectionResult initWithBlocks:imageSize:](self, "initWithBlocks:imageSize:", v9, width, height, v12, v13);
  return v10;
}

- (VKCaptureTextDetectionResult)initWithBlocks:(id)a3 imageSize:(CGSize)a4
{
  id v5;
  VKCaptureTextDetectionResult *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  uint64_t v10;
  VKCaptureTextDetectionResult *v11;
  uint64_t v12;
  NSArray *blockQuads;
  void *v14;
  uint64_t v15;
  NSArray *normalizedLineQuads;
  NSArray *v17;
  VKCaptureTextDetectionResult *v18;
  uint64_t v19;
  NSArray *lineQuads;
  const char *v21;
  void *v22;
  double v23;
  uint64_t v24;
  VKQuad *boundingQuad;
  uint64_t v27;
  uint64_t v28;
  VKQuad *(*v29)(uint64_t, void *);
  void *v30;
  VKCaptureTextDetectionResult *v31;
  _QWORD v32[4];
  VKCaptureTextDetectionResult *v33;
  objc_super v34;

  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)VKCaptureTextDetectionResult;
  v6 = -[VKCaptureTextDetectionResult init](&v34, sel_init);
  if (v6)
  {
    v6->__imageBounds.origin.x = VKMRectWithSize();
    v6->__imageBounds.origin.y = v7;
    v6->__imageBounds.size.width = v8;
    v6->__imageBounds.size.height = v9;
    v10 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __57__VKCaptureTextDetectionResult_initWithBlocks_imageSize___block_invoke;
    v32[3] = &unk_1E94627A8;
    v11 = v6;
    v33 = v11;
    objc_msgSend(v5, "vk_compactMap:", v32);
    v12 = objc_claimAutoreleasedReturnValue();
    blockQuads = v11->_blockQuads;
    v11->_blockQuads = (NSArray *)v12;

    objc_msgSend(v5, "vk_flatMap:", &__block_literal_global_0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "vk_compactMap:", &__block_literal_global_27);
    v15 = objc_claimAutoreleasedReturnValue();
    normalizedLineQuads = v11->_normalizedLineQuads;
    v11->_normalizedLineQuads = (NSArray *)v15;

    v17 = v11->_normalizedLineQuads;
    v27 = v10;
    v28 = 3221225472;
    v29 = __57__VKCaptureTextDetectionResult_initWithBlocks_imageSize___block_invoke_4;
    v30 = &unk_1E9462830;
    v18 = v11;
    v31 = v18;
    -[NSArray vk_compactMap:](v17, "vk_compactMap:", &v27);
    v19 = objc_claimAutoreleasedReturnValue();
    lineQuads = v18->_lineQuads;
    v18->_lineQuads = (NSArray *)v19;

    VKVNBaselineAngles(v14, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = VKVNGlobalBaselineAngleFromAngles(v22);
    +[VKQuad quadFromUnionOfQuads:baselineAngle:](VKQuad, "quadFromUnionOfQuads:baselineAngle:", v18->_lineQuads, v27, v28, v29, v30);
    v24 = objc_claimAutoreleasedReturnValue();
    boundingQuad = v18->_boundingQuad;
    v18->_boundingQuad = (VKQuad *)v24;

    v18->_baselineAngle = v23;
  }

  return v6;
}

VKQuad *__57__VKCaptureTextDetectionResult_initWithBlocks_imageSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;
  double v23;
  double v24;
  double v25;

  v3 = a2;
  objc_msgSend(v3, "bottomLeft");
  VKMFlipPoint();
  v6 = VKMPointFromNormalizedRect(v4, v5, *(double *)(*(_QWORD *)(a1 + 32) + 48), *(double *)(*(_QWORD *)(a1 + 32) + 56), *(double *)(*(_QWORD *)(a1 + 32) + 64));
  v24 = v7;
  v25 = v6;
  objc_msgSend(v3, "bottomRight");
  VKMFlipPoint();
  v10 = VKMPointFromNormalizedRect(v8, v9, *(double *)(*(_QWORD *)(a1 + 32) + 48), *(double *)(*(_QWORD *)(a1 + 32) + 56), *(double *)(*(_QWORD *)(a1 + 32) + 64));
  v22 = v11;
  v23 = v10;
  objc_msgSend(v3, "topLeft");
  VKMFlipPoint();
  v14 = VKMPointFromNormalizedRect(v12, v13, *(double *)(*(_QWORD *)(a1 + 32) + 48), *(double *)(*(_QWORD *)(a1 + 32) + 56), *(double *)(*(_QWORD *)(a1 + 32) + 64));
  v16 = v15;
  objc_msgSend(v3, "topRight");

  VKMFlipPoint();
  v19 = VKMPointFromNormalizedRect(v17, v18, *(double *)(*(_QWORD *)(a1 + 32) + 48), *(double *)(*(_QWORD *)(a1 + 32) + 56), *(double *)(*(_QWORD *)(a1 + 32) + 64));
  return -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v25, v24, v23, v22, v14, v16, v19, v20);
}

uint64_t __57__VKCaptureTextDetectionResult_initWithBlocks_imageSize___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "getLines");
}

VKQuad *__57__VKCaptureTextDetectionResult_initWithBlocks_imageSize___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v14;
  double v15;
  double v16;
  double v17;

  v2 = a2;
  objc_msgSend(v2, "bottomLeft");
  VKMFlipPoint();
  v16 = v4;
  v17 = v3;
  objc_msgSend(v2, "bottomRight");
  VKMFlipPoint();
  v14 = v6;
  v15 = v5;
  objc_msgSend(v2, "topLeft");
  VKMFlipPoint();
  v8 = v7;
  v10 = v9;
  objc_msgSend(v2, "topRight");

  VKMFlipPoint();
  return -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v17, v16, v15, v14, v8, v10, v11, v12);
}

VKQuad *__57__VKCaptureTextDetectionResult_initWithBlocks_imageSize___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v3 = a2;
  objc_msgSend(v3, "bottomLeft");
  v6 = VKMPointFromNormalizedRect(v4, v5, *(double *)(*(_QWORD *)(a1 + 32) + 48), *(double *)(*(_QWORD *)(a1 + 32) + 56), *(double *)(*(_QWORD *)(a1 + 32) + 64));
  v8 = v7;
  objc_msgSend(v3, "bottomRight");
  v11 = VKMPointFromNormalizedRect(v9, v10, *(double *)(*(_QWORD *)(a1 + 32) + 48), *(double *)(*(_QWORD *)(a1 + 32) + 56), *(double *)(*(_QWORD *)(a1 + 32) + 64));
  v13 = v12;
  objc_msgSend(v3, "topLeft");
  v16 = VKMPointFromNormalizedRect(v14, v15, *(double *)(*(_QWORD *)(a1 + 32) + 48), *(double *)(*(_QWORD *)(a1 + 32) + 56), *(double *)(*(_QWORD *)(a1 + 32) + 64));
  v18 = v17;
  objc_msgSend(v3, "topRight");
  v20 = v19;
  v22 = v21;

  v23 = VKMPointFromNormalizedRect(v20, v22, *(double *)(*(_QWORD *)(a1 + 32) + 48), *(double *)(*(_QWORD *)(a1 + 32) + 56), *(double *)(*(_QWORD *)(a1 + 32) + 64));
  return -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v6, v8, v11, v13, v16, v18, v23, v24);
}

- (CGRect)boundingBox
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[VKCaptureTextDetectionResult boundingQuad](self, "boundingQuad");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boundingBox");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)groupedPath
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  CGAffineTransform v12;

  -[VKCaptureTextDetectionResult _imageBounds](self, "_imageBounds");
  v4 = v3;
  v6 = v5;
  v7 = VKMAspectRatio(v3, v5);
  v8 = (void *)MEMORY[0x1E0CEA390];
  -[VKCaptureTextDetectionResult normalizedLineQuads](self, "normalizedLineQuads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vk_roundAndGroupNormalizedQuadsForHighlight:aspectRatio:expansionScale:radiusToAvgHeightRatio:", v9, v7, 0.3, 0.35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CGAffineTransformMakeScale(&v12, v4, v6);
  objc_msgSend(v10, "applyTransform:", &v12);
  return v10;
}

- (id)boundingPathWithPadding:(double)a3 cornerRadius:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const CGPath *v15;
  void *v16;

  -[VKCaptureTextDetectionResult boundingQuad](self, "boundingQuad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "vk_expandWithOffset:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CEA390];
  -[VKCaptureTextDetectionResult _imageBounds](self, "_imageBounds");
  objc_msgSend(v10, "bezierPathWithRect:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vk_intersectAndFlattenWithPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CEA390];
  objc_msgSend(v12, "vk_allPoints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (const CGPath *)objc_msgSend(v13, "vk_newRoundedPathWithRadius:points:", v14, a4);

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithCGPath:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(v15);

  return v16;
}

- (id)groupedPathForLinesWithPadding:(double)a3 cornerRadius:(double)a4
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinX;
  CGFloat MaxX;
  CGFloat MinY;
  CGFloat MaxY;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const CGPath *v23;
  id v24;
  const CGPath *v25;
  void *v26;
  id obj;
  _QWORD block[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[9];
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v38 = *MEMORY[0x1E0C80C00];
  -[VKCaptureTextDetectionResult _imageBounds](self, "_imageBounds");
  x = v39.origin.x;
  y = v39.origin.y;
  width = v39.size.width;
  height = v39.size.height;
  MinX = CGRectGetMinX(v39);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  MaxX = CGRectGetMaxX(v40);
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  MinY = CGRectGetMinY(v41);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  MaxY = CGRectGetMaxY(v42);
  -[VKCaptureTextDetectionResult lineQuads](self, "lineQuads");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __76__VKCaptureTextDetectionResult_groupedPathForLinesWithPadding_cornerRadius___block_invoke;
  v36[3] = &__block_descriptor_72_e22__32__0__VKQuad_8q16q24l;
  *(CGFloat *)&v36[4] = MinX;
  *(double *)&v36[5] = a3;
  *(CGFloat *)&v36[6] = MinY;
  *(CGFloat *)&v36[7] = MaxX;
  *(CGFloat *)&v36[8] = MaxY;
  objc_msgSend(v14, "vk_compactMap:", v36);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUsesEvenOddFillRule:", 0);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v15;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v20);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (const CGPath *)objc_msgSend(objc_retainAutorelease(v21), "CGPath");
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __76__VKCaptureTextDetectionResult_groupedPathForLinesWithPadding_cornerRadius___block_invoke_2;
        block[3] = &unk_1E9462878;
        v31 = v22;
        v24 = v22;
        CGPathApplyWithBlock(v23, block);
        v25 = (const CGPath *)objc_msgSend(MEMORY[0x1E0CEA390], "vk_newRoundedPathWithRadius:points:", v24, a4);
        objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithCGPath:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendPath:", v26);

        CGPathRelease(v25);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v18);
  }

  return v16;
}

id __76__VKCaptureTextDetectionResult_groupedPathForLinesWithPadding_cornerRadius___block_invoke(double *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
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
  double v31;
  double v32;
  double v33;
  void *v34;

  v3 = a2;
  objc_msgSend(v3, "bottomLeft");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "bottomRight");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "topLeft");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v3, "topRight");
  v17 = v16;
  v19 = v18;

  v20 = a1[4];
  v21 = a1[5];
  if (v20 >= v13 - v21)
    v22 = a1[4];
  else
    v22 = v13 - v21;
  v23 = a1[6];
  v24 = a1[7];
  if (v23 >= v15 - v21)
    v25 = a1[6];
  else
    v25 = v15 - v21;
  if (v24 >= v17 + v21)
    v26 = v17 + v21;
  else
    v26 = a1[7];
  if (v23 >= v19 - v21)
    v27 = a1[6];
  else
    v27 = v19 - v21;
  if (v20 >= v5 - v21)
    v28 = a1[4];
  else
    v28 = v5 - v21;
  v29 = a1[8];
  if (v29 >= v7 + v21)
    v30 = v7 + v21;
  else
    v30 = a1[8];
  if (v24 >= v9 + v21)
    v31 = v9 + v21;
  else
    v31 = a1[7];
  v32 = v11 + v21;
  if (v29 >= v32)
    v33 = v32;
  else
    v33 = a1[8];
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "moveToPoint:", v22, v25);
  objc_msgSend(v34, "addLineToPoint:", v26, v27);
  objc_msgSend(v34, "addLineToPoint:", v31, v33);
  objc_msgSend(v34, "addLineToPoint:", v28, v30);
  objc_msgSend(v34, "closePath");
  return v34;
}

void __76__VKCaptureTextDetectionResult_groupedPathForLinesWithPadding_cornerRadius___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "count") != 4)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", **(double **)(a2 + 8), *(double *)(*(_QWORD *)(a2 + 8) + 8));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (VKQuad)boundingQuad
{
  return self->_boundingQuad;
}

- (NSArray)lineQuads
{
  return self->_lineQuads;
}

- (NSArray)blockQuads
{
  return self->_blockQuads;
}

- (NSArray)normalizedLineQuads
{
  return self->_normalizedLineQuads;
}

- (double)baselineAngle
{
  return self->_baselineAngle;
}

- (CGRect)_imageBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__imageBounds.origin.x;
  y = self->__imageBounds.origin.y;
  width = self->__imageBounds.size.width;
  height = self->__imageBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedLineQuads, 0);
  objc_storeStrong((id *)&self->_blockQuads, 0);
  objc_storeStrong((id *)&self->_lineQuads, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
}

@end
