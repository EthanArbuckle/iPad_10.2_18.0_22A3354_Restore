@implementation CRRecognizerAsyncFeatureBatchProviderV1

- (CRRecognizerAsyncFeatureBatchProviderV1)initWithConfiguration:(id)a3 inputProvider:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  CRRecognizerAsyncFeatureBatchProviderV1 *v10;
  CRRecognizerAsyncFeatureBatchProviderV1 *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CRRecognizerAsyncFeatureBatchProviderV1;
  v10 = -[CRRecognizerAsyncFeatureBatchProviderV1 init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_configuration, a3);
    objc_storeStrong((id *)&v11->_inputProvider, a4);
  }

  return v11;
}

- (void)enumerateInputsForImage:(id)a3 lineRegions:(id)a4 rectifier:(id)a5 usingBlock:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double y;
  double x;
  double height;
  double width;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  _BOOL4 v35;
  double v36;
  double v37;
  void *v38;
  float v39;
  uint64_t v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  CRMetalPolygonRectifier *v56;
  CRMetalPolygonRectifier *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  CRMetalPolygonRectifier *v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  id obj;
  char v73;
  uint64_t v74;
  _QWORD v75[4];
  id v76;
  CRRecognizerAsyncFeatureBatchProviderV1 *v77;
  id v78;
  id v79;
  CRMetalPolygonRectifier *v80;
  id v81;
  id v82;
  _QWORD *v83;
  _QWORD *v84;
  _QWORD *v85;
  _QWORD v86[4];
  _QWORD v87[5];
  id v88;
  _QWORD v89[5];
  id v90;
  _QWORD v91[4];
  id v92;
  CRRecognizerAsyncFeatureBatchProviderV1 *v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  uint64_t v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;

  v100 = *MEMORY[0x1E0C80C00];
  v70 = a3;
  v10 = a4;
  v71 = a5;
  v68 = v10;
  v69 = a6;
  objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_40);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (!v13)
  {
    v73 = 0;
    goto LABEL_20;
  }
  v73 = 0;
  v74 = *(_QWORD *)v96;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v96 != v74)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
      objc_msgSend(v19, "polygon");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(v19, "polygon");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v21, "pointCount") <= 3)
        {

        }
        else
        {
          -[CRRecognizerAsyncFeatureBatchProviderV1 configuration](self, "configuration");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "rectifyPolygons");

          if (v23)
          {
            objc_msgSend(v19, "polygon");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "denormalizedPolyline");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "boundingRect");
            goto LABEL_13;
          }
        }
      }
      objc_msgSend(v19, "boundingQuad");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "baselineAngle");
      v32 = v31;
      -[CRRecognizerAsyncFeatureBatchProviderV1 configuration](self, "configuration");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "angleThresholdForRotatedCrops");
      v35 = fabs(v32) > v34;

      if (!v35)
        goto LABEL_14;
      objc_msgSend(v19, "boundingQuad");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "denormalizedQuad");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "boundingBox");
LABEL_13:
      v103.origin.x = v26;
      v103.origin.y = v27;
      v103.size.width = v28;
      v103.size.height = v29;
      v101.origin.x = x;
      v101.origin.y = y;
      v101.size.width = width;
      v101.size.height = height;
      v102 = CGRectUnion(v101, v103);
      x = v102.origin.x;
      y = v102.origin.y;
      width = v102.size.width;
      height = v102.size.height;

      v73 = 1;
LABEL_14:
      objc_msgSend(v19, "aspectRatio");
      v37 = v36;
      -[CRRecognizerAsyncFeatureBatchProviderV1 configuration](self, "configuration");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v37;
      v40 = objc_msgSend(v38, "bestFitWidthIndexForAspectRatio:", v39);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42 == 0;

      if (v43)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], v44);

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "arrayByAddingObject:", v19);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v47, v48);

    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
  }
  while (v13);
LABEL_20:

  objc_msgSend(v12, "allKeys");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "sortedArrayUsingSelector:", sel_compare_);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = MEMORY[0x1E0C809B0];
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __100__CRRecognizerAsyncFeatureBatchProviderV1_enumerateInputsForImage_lineRegions_rectifier_usingBlock___block_invoke_2;
  v91[3] = &unk_1E98DBDA8;
  v52 = v12;
  v92 = v52;
  v93 = self;
  v53 = v50;
  v94 = v53;
  objc_msgSend(v53, "enumerateObjectsWithOptions:usingBlock:", 2, v91);
  v89[0] = 0;
  v89[1] = v89;
  v89[2] = 0x3032000000;
  v89[3] = __Block_byref_object_copy__23;
  v89[4] = __Block_byref_object_dispose__23;
  v90 = (id)objc_opt_new();
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x3032000000;
  v87[3] = __Block_byref_object_copy__23;
  v87[4] = __Block_byref_object_dispose__23;
  v88 = (id)objc_opt_new();
  -[CRRecognizerAsyncFeatureBatchProviderV1 configuration](self, "configuration");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "inputWidths");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x2020000000;
  v86[3] = 0;
  if (v71)
  {
    v56 = (CRMetalPolygonRectifier *)v71;
  }
  else if ((v73 & 1) != 0 && _os_feature_enabled_impl())
  {
    v57 = [CRMetalPolygonRectifier alloc];
    -[CRRecognizerAsyncFeatureBatchProviderV1 configuration](self, "configuration");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "metalDevice");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[CRMetalPolygonRectifier initWithDevice:sourceImage:regionOfInterest:](v57, "initWithDevice:sourceImage:regionOfInterest:", v59, v70, x, y, width, height);

  }
  else
  {
    v56 = 0;
  }
  objc_msgSend(v52, "allKeys");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "sortedArrayUsingSelector:", sel_compare_);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v75[0] = v51;
  v75[1] = 3221225472;
  v75[2] = __100__CRRecognizerAsyncFeatureBatchProviderV1_enumerateInputsForImage_lineRegions_rectifier_usingBlock___block_invoke_9;
  v75[3] = &unk_1E98DBDD0;
  v62 = v52;
  v83 = v87;
  v84 = v86;
  v76 = v62;
  v77 = self;
  v63 = v70;
  v78 = v63;
  v64 = v55;
  v79 = v64;
  v65 = v56;
  v80 = v65;
  v85 = v89;
  v66 = obj;
  v81 = v66;
  v67 = v69;
  v82 = v67;
  objc_msgSend(v61, "enumerateObjectsWithOptions:usingBlock:", 2, v75);

  _Block_object_dispose(v86, 8);
  _Block_object_dispose(v87, 8);

  _Block_object_dispose(v89, 8);
}

uint64_t __100__CRRecognizerAsyncFeatureBatchProviderV1_enumerateInputsForImage_lineRegions_rectifier_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "aspectRatio");
  v6 = v5;
  objc_msgSend(v4, "aspectRatio");
  v8 = v7;

  if (v6 > v8)
    return 1;
  else
    return -1;
}

void __100__CRRecognizerAsyncFeatureBatchProviderV1_enumerateInputsForImage_lineRegions_rectifier_usingBlock___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(a1[5], "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "batchSize");

  v9 = a3 - 1;
  if (v9 >= 0)
  {
    v10 = v6 % v8;
    if (v6 % v8 >= 1)
    {
      do
      {
        objc_msgSend(a1[6], "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        objc_msgSend(a1[5], "configuration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "batchSize") - v10;

        if (v15 >= v13)
          v16 = v13;
        else
          v16 = v15;
        objc_msgSend(a1[4], "objectForKeyedSubscript:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "subarrayWithRange:", 0, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1[4], "objectForKeyedSubscript:", v26);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v20, v26);
        if (v13 <= v15)
        {
          objc_msgSend(a1[4], "removeObjectForKey:", v11);
        }
        else
        {
          objc_msgSend(a1[4], "objectForKeyedSubscript:", v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "subarrayWithRange:", v16, v13 - v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v22, v11);
        }
        objc_msgSend(a1[4], "objectForKeyedSubscript:", v26);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        objc_msgSend(a1[5], "configuration");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v24 % objc_msgSend(v25, "batchSize");

        if (v10 < 1)
          break;
        --v9;
      }
      while ((v9 & 0x8000000000000000) == 0);
    }
  }

}

void __100__CRRecognizerAsyncFeatureBatchProviderV1_enumerateInputsForImage_lineRegions_rectifier_usingBlock___block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v4;
  v46 = objc_msgSend(v4, "integerValue");
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        if (!a3)
        {
          objc_msgSend(obj, "lastObject");

        }
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "addObject:", v10);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
        v11 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count");
        objc_msgSend(*(id *)(a1 + 40), "configuration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "batchSize");

        if (v11 == v13)
        {
          objc_msgSend(*(id *)(a1 + 40), "inputProvider");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
          v16 = *(_QWORD *)(a1 + 48);
          objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", v46);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "doubleValue");
          v19 = v18;
          objc_msgSend(*(id *)(a1 + 40), "configuration");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "inputBatchFromLineRegions:image:regionWidth:configuration:rectifier:", v15, v16, v20, *(_QWORD *)(a1 + 64), v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "addObject:", v21);
          v22 = objc_opt_new();
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
          v24 = *(void **)(v23 + 40);
          *(_QWORD *)(v23 + 40) = v22;

        }
        v25 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "count");
        objc_msgSend(*(id *)(a1 + 40), "configuration");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "maxConcurrentBatches");

        if (v25 == v27)
        {
          (*(void (**)(double))(*(_QWORD *)(a1 + 80) + 16))((double)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24)/ (double)(unint64_t)objc_msgSend(*(id *)(a1 + 72), "count"));
          v28 = objc_opt_new();
          v29 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
          v30 = *(void **)(v29 + 40);
          *(_QWORD *)(v29 + 40) = v28;

          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 0;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v7);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "inputProvider");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    v33 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", v46);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleValue");
    v36 = v35;
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "inputBatchFromLineRegions:image:regionWidth:configuration:rectifier:", v32, v33, v37, *(_QWORD *)(a1 + 64), v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "addObject:", v38);
    v39 = objc_opt_new();
    v40 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v41 = *(void **)(v40 + 40);
    *(_QWORD *)(v40 + 40) = v39;

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "count"))
  {
    (*(void (**)(double))(*(_QWORD *)(a1 + 80) + 16))((double)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24)/ (double)(unint64_t)objc_msgSend(*(id *)(a1 + 72), "count"));
    v42 = objc_opt_new();
    v43 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v44 = *(void **)(v43 + 40);
    *(_QWORD *)(v43 + 40) = v42;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 0;
  }

}

- (CRTextRecognizerModelInputProvider)inputProvider
{
  return (CRTextRecognizerModelInputProvider *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInputProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CRNeuralRecognizerConfiguration)configuration
{
  return (CRNeuralRecognizerConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_inputProvider, 0);
}

@end
