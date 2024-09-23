@implementation CRCTLD

- (CRCTLD)initWithDelegate:(id)a3
{
  id v4;
  CRCTLD *v5;
  CRCTLD *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRCTLD;
  v5 = -[CRCTLD init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)enforceQuadrilateralOrder:(CGPoint *)a3
{
  uint64_t v3;
  uint64_t v4;
  CGPoint v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGPoint *v9;
  double y;
  CGPoint *v11;
  double v12;
  CGPoint *v13;
  CGPoint v14;
  CGPoint *v15;
  double v16;
  double v17;
  CGPoint *v18;
  CGPoint v19;
  CGPoint v20;

  v3 = 1;
  v4 = 16;
  do
  {
    v5 = a3[v3];
    v6 = v4;
    v7 = v3;
    while (1)
    {
      v8 = v7 - 1;
      v9 = &a3[(v7 - 1)];
      if (v9->x <= v5.x)
        break;
      *(CGPoint *)((char *)a3 + v6) = *v9;
      v6 -= 16;
      --v7;
      if (v8 + 1 <= 1)
      {
        LODWORD(v7) = 0;
        break;
      }
    }
    a3[(int)v7] = v5;
    ++v3;
    v4 += 16;
  }
  while (v3 != 4);
  y = a3->y;
  v11 = a3 + 1;
  v12 = a3[1].y;
  if (y >= v12)
    v13 = a3 + 1;
  else
    v13 = a3;
  if (y >= v12)
    v11 = a3;
  v14 = *v11;
  v15 = a3 + 2;
  v16 = a3[2].y;
  v17 = a3[3].y;
  if (v16 >= v17)
    v18 = a3 + 3;
  else
    v18 = a3 + 2;
  if (v16 < v17)
    v15 = a3 + 3;
  v19 = *v15;
  v20 = *v18;
  *a3 = *v13;
  a3[1] = v20;
  a3[2] = v14;
  a3[3] = v19;
}

- (double)getBaselineAngle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v3 = a3;
  objc_msgSend(v3, "boundingQuad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "denormalizedQuad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomLeft");
  v7 = v6;
  v9 = v8;

  objc_msgSend(v3, "boundingQuad");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "denormalizedQuad");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomRight");
  v13 = v12;
  v15 = v14;

  v16 = atan2(-(v15 - v9), v13 - v7);
  return v16;
}

- (void)mirrorAxisX:(CGPoint *)a3
{
  uint64_t i;
  CGPoint v4;
  CGPoint v5;

  for (i = 0; i != 4; ++i)
    a3[i].x = -a3[i].x;
  v4 = *a3;
  *a3 = a3[1];
  a3[1] = v4;
  v5 = a3[2];
  a3[2] = a3[3];
  a3[3] = v5;
}

- (CTLDRegion)CTLDRegionFromCRRegion:(SEL)a3 index:(id)a4 imageSize:(int)a5 rotationAngle:(CGSize)a6 mainDirection:(float)a7
{
  double height;
  double width;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  CTLDRegion *result;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  height = a6.height;
  width = a6.width;
  v32 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  objc_msgSend(v15, "boundingQuad");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "denormalizedQuad");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "topLeft");
  *(_QWORD *)&v28 = v18;
  *((_QWORD *)&v28 + 1) = v19;
  objc_msgSend(v17, "topRight");
  *(_QWORD *)&v29 = v20;
  *((_QWORD *)&v29 + 1) = v21;
  objc_msgSend(v17, "bottomLeft");
  *(_QWORD *)&v30 = v22;
  *((_QWORD *)&v30 + 1) = v23;
  objc_msgSend(v17, "bottomRight");
  *(_QWORD *)&v31 = v24;
  *((_QWORD *)&v31 + 1) = v25;
  -[CRCTLD angleThresholdForRotationCorrection](self, "angleThresholdForRotationCorrection");
  if (v26 < fabsf(a7))
    rotatePolygon(&v28, (double *)&v28, width * 0.5, height * 0.5, a7);
  -[CRCTLD enforceQuadrilateralOrder:](self, "enforceQuadrilateralOrder:", &v28);
  if (a8 == 2)
    -[CRCTLD mirrorAxisX:](self, "mirrorAxisX:", &v28);
  CRTextRecognition::CRCTLD::CTLDRegion::CTLDRegion((uint64_t)retstr, &v28, &v29, &v30, &v31, a5, v15);

  return result;
}

- (double)getQuadrantOrientation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  double v8;
  double v9;
  int v10;
  uint64_t v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v19[0] = 0;
  v19[1] = 0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        -[CRCTLD getBaselineAngle:](self, "getBaselineAngle:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
        if (v8 <= 3.14159265)
        {
          if (v8 <= -3.14159265)
            v8 = v8 + 6.28318531;
        }
        else
        {
          v8 = v8 + -6.28318531;
        }
        v9 = (v8 + 0.785398163 + 3.14159265) / 1.57079633;
        if ((int)v9 <= 0)
          v10 = -(-(int)v9 & 3);
        else
          v10 = (int)v9 & 3;
        ++*((_DWORD *)v19 + v10);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  v11 = 0;
  v12 = 0;
  do
  {
    if (*((_DWORD *)v19 + v12) < *((_DWORD *)v19 + v11))
      v12 = v11;
    ++v11;
  }
  while (v11 != 4);

  return (double)v12 * 1.57079633 + -3.14159265;
}

- (float)getFeaturesGlobalAngle:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  double v20;
  float v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[CRCTLD getQuadrantOrientation:](self, "getQuadrantOrientation:", v4);
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v8);
          -[CRCTLD getBaselineAngle:](self, "getBaselineAngle:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
          v13 = v12 - v6;
          if (v13 <= 3.14159265)
          {
            if (v13 <= -3.14159265)
              v13 = v13 + 6.28318531;
          }
          else
          {
            v13 = v13 + -6.28318531;
          }
          v14 = -v13;
          if (v13 >= 0.0)
            v14 = v13;
          if (v14 > 0.785398163)
          {
            if (v14 <= 2.35619449)
            {
              if (v13 >= 0.0)
                v13 = v13 + -1.57079633;
              else
                v13 = v13 + 1.57079633;
            }
            else
            {
              v13 = v13 + 3.14159265;
              if (v13 <= 3.14159265)
              {
                if (v13 <= -3.14159265)
                  v13 = v13 + 6.28318531;
              }
              else
              {
                v13 = v13 + -6.28318531;
              }
            }
          }
          *(float *)&v13 = v13;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v16, "count") >> 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    v19 = v6 + v18;
    if (v19 <= 3.14159265)
    {
      if (v19 > -3.14159265)
      {
LABEL_33:

        v21 = v19;
        goto LABEL_34;
      }
      v20 = 6.28318531;
    }
    else
    {
      v20 = -6.28318531;
    }
    v19 = v19 + v20;
    goto LABEL_33;
  }
  v21 = 0.0;
LABEL_34:

  return v21;
}

- (unint64_t)getFeaturesMainLayoutDirection:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  _QWORD v17[6];
  _QWORD v18[4];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v8), "layoutDirection"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (v11)
        {
          v13 = 0;
        }
        else
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "integerValue");

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13 + 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41__CRCTLD_getFeaturesMainLayoutDirection___block_invoke;
  v17[3] = &unk_1E98DA948;
  v17[4] = v18;
  v17[5] = &v19;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v17);
  v15 = v20[3];
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);

  return v15;
}

void __41__CRCTLD_getFeaturesMainLayoutDirection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "integerValue") > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v5, "integerValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "integerValue");
  }

}

- (id)singleCTLDGroupingPass:(CRConstrainedTextLineDetectionImpl *)a3 textRegions:(id)a4
{
  double v4;
  double v5;
  id v8;
  float v9;
  float v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  unint64_t i;
  void *v17;
  double v18;
  _DWORD *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  id WeakRetained;
  void **v27;
  unint64_t v28;
  double v29;
  double v30;
  void **v31;
  double v32;
  CRNormalizedQuad *v33;
  CRImageSpaceQuad *v34;
  CRImageSpaceQuad *v35;
  CRNormalizedQuad *v36;
  void *v37;
  _BYTE *v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  id v42;
  char v43;
  id v44;
  CRGroupRegion *v45;
  NSObject *v46;
  id v48;
  uint8_t buf[16];
  void **v50;
  void **v51;
  uint64_t v52;
  _DWORD *v53;
  unint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  int v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[CRCTLD getFeaturesGlobalAngle:](self, "getFeaturesGlobalAngle:", v8);
  v10 = v9;
  v11 = -[CRCTLD getFeaturesMainLayoutDirection:](self, "getFeaturesMainLayoutDirection:", v8);
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "boundingQuad");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "normalizationSize");
    v4 = v14;
    v5 = v15;

  }
  v52 = 0;
  v53 = 0;
  v54 = 0;
  std::vector<CRTextRecognition::CRCTLD::CTLDRegion>::reserve(&v52, objc_msgSend(v8, "count"));
  for (i = 0; objc_msgSend(v8, "count") > i; ++i)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v18 = v10;
    -[CRCTLD CTLDRegionFromCRRegion:index:imageSize:rotationAngle:mainDirection:](self, "CTLDRegionFromCRRegion:index:imageSize:rotationAngle:mainDirection:", v17, i, v11, v4, v5, v18);
    v19 = v53;
    if ((unint64_t)v53 >= v54)
    {
      v25 = std::vector<CRTextRecognition::CRCTLD::CTLDRegion>::__emplace_back_slow_path<CRTextRecognition::CRCTLD::CTLDRegion>(&v52, (uint64_t)&v55);
    }
    else
    {
      *v53 = v55;
      v20 = *((_QWORD *)&v55 + 1);
      *((_QWORD *)&v55 + 1) = 0;
      *((_QWORD *)v19 + 1) = v20;
      v21 = v57;
      *((_OWORD *)v19 + 1) = v56;
      *((_OWORD *)v19 + 2) = v21;
      v22 = v58;
      v23 = v59;
      v24 = v60;
      v19[24] = v61;
      *((_OWORD *)v19 + 4) = v23;
      *((_OWORD *)v19 + 5) = v24;
      *((_OWORD *)v19 + 3) = v22;
      *((_QWORD *)v19 + 13) = 0;
      *((_QWORD *)v19 + 14) = 0;
      *((_QWORD *)v19 + 15) = 0;
      *(_OWORD *)(v19 + 26) = v62;
      *((_QWORD *)v19 + 15) = v63;
      v62 = 0uLL;
      v63 = 0;
      v25 = (uint64_t)(v19 + 32);
    }
    v53 = (_DWORD *)v25;
    v50 = (void **)&v62;
    std::vector<CRTextRecognition::CRCTLD::CTLDRegion>::__destroy_vector::operator()[abi:ne180100](&v50);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  CRTextRecognition::CRCTLD::CRConstrainedTextLineDetectionImpl::groupRegions((CRTextRecognition::CRCTLD::CRConstrainedTextLineDetectionImpl *)a3, (uint64_t)&v52, v11, WeakRetained, (uint64_t *)&v50);

  v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = v50;
  if (v51 != v50)
  {
    v28 = 0;
    v29 = fabsf(v10);
    v30 = (float)-v10;
    do
    {
      v31 = &v27[16 * v28];
      v55 = *((_OWORD *)v31 + 2);
      v56 = *((_OWORD *)v31 + 3);
      v57 = *((_OWORD *)v31 + 4);
      v58 = *((_OWORD *)v31 + 5);
      if (v11 == 2)
        -[CRCTLD mirrorAxisX:](self, "mirrorAxisX:", &v55);
      -[CRCTLD angleThresholdForRotationCorrection](self, "angleThresholdForRotationCorrection");
      if (v32 < v29)
        rotatePolygon(&v55, (double *)&v55, v4 * 0.5, v5 * 0.5, v30);
      v33 = [CRNormalizedQuad alloc];
      v34 = [CRImageSpaceQuad alloc];
      v35 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](v34, "initWithTopLeft:topRight:bottomRight:bottomLeft:", v55, *(double *)&v56, *((double *)&v56 + 1), *(double *)&v58, *((double *)&v58 + 1), *(double *)&v57, *((double *)&v57 + 1));
      v36 = -[CRNormalizedQuad initWithDenormalizedQuad:size:](v33, "initWithDenormalizedQuad:size:", v35, v4, v5);

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", ((_BYTE *)v50[16 * v28 + 14] - (_BYTE *)v50[16 * v28 + 13]) >> 7);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v50[16 * v28 + 13];
      if (v50[16 * v28 + 14] != v38)
      {
        v39 = 0;
        v40 = 0;
        do
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", *(int *)&v38[v39]);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v41);

          ++v40;
          v38 = v50[16 * v28 + 13];
          v39 += 128;
        }
        while (v40 < ((_BYTE *)v50[16 * v28 + 14] - v38) >> 7);
      }
      v42 = objc_loadWeakRetained((id *)&self->_delegate);
      v43 = objc_opt_respondsToSelector();

      if ((v43 & 1) != 0)
      {
        v44 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v44, "groupWithQuad:layoutDirection:subregions:", v36, 0, v37);
        v45 = (CRGroupRegion *)objc_claimAutoreleasedReturnValue();

        if (!v45)
          goto LABEL_22;
      }
      else
      {
        v45 = -[CRGroupRegion initWithBoundingQuad:layoutDirection:subregions:]([CRGroupRegion alloc], "initWithBoundingQuad:layoutDirection:subregions:", v36, 0, v37);
        if (!v45)
        {
LABEL_22:
          CROSLogForCategory(0);
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D4FB8000, v46, OS_LOG_TYPE_FAULT, "GroupRegion is NULL in singleCTLDGroupingPass", buf, 2u);
          }

          goto LABEL_25;
        }
      }
      objc_msgSend(v48, "addObject:", v45);
LABEL_25:

      ++v28;
      v27 = v50;
    }
    while (v28 < ((char *)v51 - (char *)v50) >> 7);
  }
  *(_QWORD *)&v55 = &v50;
  std::vector<CRTextRecognition::CRCTLD::CTLDRegion>::__destroy_vector::operator()[abi:ne180100]((void ***)&v55);
  *(_QWORD *)&v55 = &v52;
  std::vector<CRTextRecognition::CRCTLD::CTLDRegion>::__destroy_vector::operator()[abi:ne180100]((void ***)&v55);

  return v48;
}

- (id)groupAndOrderRegions:(id)a3 config:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  char v29;
  int v30;
  float v31;
  void *v32;
  _DWORD v34[12];
  char v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "allowedOverlap");
  v12 = v11;
  v13 = objc_msgSend(v9, "maxRegions");
  v14 = objc_msgSend(v9, "maxQueueCapacity");
  objc_msgSend(v9, "minWhitespaceWidth");
  v16 = v15;
  objc_msgSend(v9, "minWhitespaceHeight");
  v18 = v17;
  v19 = objc_msgSend(v9, "numLookupElements");
  v20 = objc_msgSend(v9, "numPointsForSegmentsIntersection");
  objc_msgSend(v9, "qualityHeightFactor");
  v22 = v21;
  objc_msgSend(v9, "qualityWidthFactor");
  v24 = v23;
  objc_msgSend(v9, "minSubRectangleSize");
  v26 = v25;
  objc_msgSend(v9, "minQuadrilateralRotation");
  v28 = v27;
  v29 = objc_msgSend(v9, "flatMergeJumps");
  objc_msgSend(v9, "minWhitespaceHeightForReadingOrder");
  v34[0] = v12;
  v34[1] = v13;
  v34[2] = v14;
  v34[3] = v16;
  v34[4] = v18;
  v34[5] = v26;
  v34[6] = v28;
  v34[7] = v30;
  v34[8] = v19;
  v34[9] = v20;
  v34[10] = v22;
  v34[11] = v24;
  v35 = v29;
  objc_msgSend(v9, "angleThresholdForRotationCorrection");
  self->_angleThresholdForRotationCorrection = v31;
  objc_storeWeak((id *)&self->_delegate, v10);
  -[CRCTLD singleCTLDGroupingPass:textRegions:](self, "singleCTLDGroupingPass:textRegions:", v34, v8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)groupAndOrderRegions:(id)a3 config:(id)a4
{
  -[CRCTLD groupAndOrderRegions:config:delegate:](self, "groupAndOrderRegions:config:delegate:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)angleThresholdForRotationCorrection
{
  return self->_angleThresholdForRotationCorrection;
}

- (void)setAngleThresholdForRotationCorrection:(double)a3
{
  self->_angleThresholdForRotationCorrection = a3;
}

- (CRCTLDDelegate)delegate
{
  return (CRCTLDDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
