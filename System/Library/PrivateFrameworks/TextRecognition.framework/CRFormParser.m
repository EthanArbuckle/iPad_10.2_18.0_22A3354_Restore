@implementation CRFormParser

- (CRFormParser)init
{
  CRFormParser *v2;
  CRFormContentTypePredictor *v3;
  CRFormContentTypePredictor *predictor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRFormParser;
  v2 = -[CRFormParser init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CRFormContentTypePredictor);
    predictor = v2->_predictor;
    v2->_predictor = v3;

  }
  return v2;
}

+ (id)_orderedGroupsWithFields:(id)a3 lines:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count") + objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v6);
  objc_msgSend(v7, "addObjectsFromArray:", v5);
  if (_MergedGlobals_8 != -1)
    dispatch_once(&_MergedGlobals_8, &__block_literal_global);
  objc_msgSend((id)qword_1ED0B4330, "orderAndGroupRegions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __47__CRFormParser__orderedGroupsWithFields_lines___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CRTextFeatureOrderingUtilities textFeatureOrderWithRevision:angleThresholdForRotatedCrops:optimizeGroupsForStability:](CRTextFeatureOrderingUtilities, "textFeatureOrderWithRevision:angleThresholdForRotatedCrops:optimizeGroupsForStability:", 3, 1, 0.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B4330;
  qword_1ED0B4330 = v0;

}

+ (id)convertDetectedFields:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  CRFormSelectableFieldOutputRegion *v9;
  void *v10;
  uint64_t v11;
  CRFormTextFieldOutputRegion *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v19, "count"));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = v19;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "fieldType");
        if (v8 == 1)
        {
          v12 = [CRFormTextFieldOutputRegion alloc];
          objc_msgSend(v7, "boundingQuad");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v7, "textContentType");
          v14 = objc_msgSend(v7, "fieldSource");
          v15 = objc_msgSend(v7, "hasBoundedWidth");
          LOBYTE(v18) = objc_msgSend(v7, "hasBoundedHeight");
          v11 = -[CRFormTextFieldOutputRegion initWithQuad:labelRegion:subFields:contentType:source:hasBoundedWidth:hasBoundedHeight:](v12, "initWithQuad:labelRegion:subFields:contentType:source:hasBoundedWidth:hasBoundedHeight:", v10, 0, 0, v13, v14, v15, v18);
        }
        else
        {
          if (v8 != 2)
          {
            v16 = 0;
            goto LABEL_13;
          }
          v9 = [CRFormSelectableFieldOutputRegion alloc];
          objc_msgSend(v7, "boundingQuad");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[CRFormSelectableFieldOutputRegion initWithQuad:type:labelRegion:source:](v9, "initWithQuad:type:labelRegion:source:", v10, 0, 0, objc_msgSend(v7, "fieldSource"));
        }
        v16 = (void *)v11;

        if (v16)
          objc_msgSend(v20, "addObject:", v16);
LABEL_13:

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  return v20;
}

+ (BOOL)_isRegion:(id)a3 segmentedBoxLeftOfRegion:(id)a4 withTolerance:(double)a5 modalWidth:(double)a6 modelGap:(double)a7
{
  id v8;
  void *v9;
  void *v10;
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
  double v34;
  BOOL v35;
  BOOL v36;
  double v37;
  double v38;
  double v39;
  double v40;
  BOOL v41;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;

  v8 = a4;
  objc_msgSend(a3, "boundingQuad");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "boundingQuad");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v47 = v11;
  objc_msgSend(v10, "size");
  v46 = v12;
  objc_msgSend(v9, "size");
  v45 = v13;
  objc_msgSend(v10, "size");
  v44 = v14;
  objc_msgSend(v10, "topLeft");
  v43 = v15;
  objc_msgSend(v9, "topRight");
  v17 = v16;
  objc_msgSend(v9, "size");
  v19 = v18;
  objc_msgSend(v10, "size");
  v21 = v20;
  objc_msgSend(v9, "size");
  v23 = v22;
  objc_msgSend(v10, "size");
  v25 = v24;
  objc_msgSend(v9, "midPoint");
  v27 = v26;
  objc_msgSend(v10, "midPoint");
  v29 = v28;
  objc_msgSend(v9, "midPoint");
  v31 = v30;
  objc_msgSend(v10, "midPoint");
  v33 = (v45 + v44) * 0.5;
  v34 = fabs(-(a6 - v33 * 100.0));
  v35 = v27 < v29;
  if (fabs(-(a7 - vabdd_f64(v43, v17) * 100.0)) >= 1.0)
    v35 = 0;
  v36 = v34 < 2.0;
  v37 = vabdd_f64(v23, v25) / v33;
  v38 = (v47 + v46) * 0.5;
  v39 = vabdd_f64(v19, v21) / v38;
  v40 = vabdd_f64(v31, v32);
  if (!v36)
    v35 = 0;
  if (v40 >= v38 * 0.5)
    v35 = 0;
  if (v39 >= 0.4)
    v35 = 0;
  v41 = v37 < 0.2 && v35;

  return v41;
}

+ (double)globalLineHeightInDocument:(id)a3
{
  id v3;
  uint64_t *v4;
  double *v5;
  double *v6;
  double v7;
  double v8;
  double v10;
  double *v11;
  uint64_t *v13;
  double *v14;
  int64_t v15;
  double *v16;
  double v17;
  double *v18;
  double v19;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  __n128 (*v25)(__n128 *, __n128 *);
  void (*v26)(uint64_t);
  void *v27;
  void *__p;
  void *v29;
  uint64_t v30;

  v3 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x4812000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = &unk_1D5168E96;
  __p = 0;
  v29 = 0;
  v30 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __43__CRFormParser_globalLineHeightInDocument___block_invoke;
  v21[3] = &unk_1E98D9B28;
  v21[4] = &v22;
  objc_msgSend(v3, "enumerateContentsWithTypes:usingBlock:", 8, v21);
  v4 = v23;
  v6 = (double *)v23[6];
  v5 = (double *)v23[7];
  if (v6 == v5)
  {
    v10 = 0.0;
  }
  else
  {
    v7 = *(double *)((char *)v6 + ((((char *)v5 - (char *)v6) >> 1) & 0xFFFFFFFFFFFFFFF8));
    v8 = v7 * 3.0;
    while (v8 >= *v6 && *v6 * 3.0 >= v7)
    {
      if (++v6 == v5)
        goto LABEL_26;
    }
    if (v6 == v5 || (v11 = v6 + 1, v6 + 1 == v5))
    {
      v14 = (double *)v23[7];
      v13 = v23;
    }
    else
    {
      do
      {
        if (v8 >= *v11 && *v11 * 3.0 >= v7)
          *v6++ = *v11;
        ++v11;
      }
      while (v11 != v5);
      v13 = v23;
      v14 = (double *)v23[7];
    }
    if (v6 == v14)
    {
      v5 = v14;
    }
    else
    {
      v15 = (char *)v5 - (char *)v14;
      if (v5 != v14)
      {
        memmove(v6, v14, (char *)v5 - (char *)v14);
        v13 = v23;
      }
      v4[7] = (uint64_t)v6 + v15;
      v5 = (double *)v13[7];
    }
    v4 = v13;
LABEL_26:
    v16 = (double *)v4[6];
    v17 = 0.0;
    if (v16 != v5)
    {
      v18 = (double *)v4[6];
      do
      {
        v19 = *v18++;
        v17 = v17 + v19;
      }
      while (v18 != v5);
    }
    v10 = v17 / (double)(unint64_t)(v5 - v16);
  }
  _Block_object_dispose(&v22, 8);
  if (__p)
  {
    v29 = __p;
    operator delete(__p);
  }

  return v10;
}

void __43__CRFormParser_globalLineHeightInDocument___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  _QWORD *v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  id v20;

  v3 = a2;
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v20 = v3;
  objc_msgSend(v3, "boundingQuad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  v8 = v4[8];
  v9 = (char *)v4[7];
  if ((unint64_t)v9 >= v8)
  {
    v11 = (char *)v4[6];
    v12 = (v9 - v11) >> 3;
    if ((unint64_t)(v12 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v13 = v8 - (_QWORD)v11;
    v14 = (uint64_t)(v8 - (_QWORD)v11) >> 2;
    if (v14 <= v12 + 1)
      v14 = v12 + 1;
    if (v13 >= 0x7FFFFFFFFFFFFFF8)
      v15 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v15 = v14;
    if (v15)
    {
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v4 + 8), v15);
      v11 = (char *)v4[6];
      v9 = (char *)v4[7];
    }
    else
    {
      v16 = 0;
    }
    v17 = &v16[8 * v12];
    v18 = &v16[8 * v15];
    *(_QWORD *)v17 = v7;
    v10 = v17 + 8;
    while (v9 != v11)
    {
      v19 = *((_QWORD *)v9 - 1);
      v9 -= 8;
      *((_QWORD *)v17 - 1) = v19;
      v17 -= 8;
    }
    v4[6] = v17;
    v4[7] = v10;
    v4[8] = v18;
    if (v11)
      operator delete(v11);
  }
  else
  {
    *(_QWORD *)v9 = v6;
    v10 = v9 + 8;
  }
  v4[7] = v10;

}

+ (id)predictLineHeightForFields:(id)a3 inDocument:(id)a4 shouldUpdateExternalFields:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  BOOL v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  _BOOL4 v37;
  uint64_t v38;

  v5 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v25 = v8;
  objc_msgSend(v8, "_flattenedFields");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  CROSLogForCategory(6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "+[CRFormParser predictLineHeightForFields:inDocument:shouldUpdateExternalFields:]";
    v34 = 2048;
    v35 = objc_msgSend(v26, "count");
    v36 = 1024;
    v37 = v5;
    _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_DEBUG, "%s: Parsing %lu form fields (updateExcludedFields: %d)", buf, 0x1Cu);
  }

  objc_msgSend(a1, "globalLineHeightInDocument:", v9);
  v12 = v11;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v26;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v28;
    if (v12 <= 0.025)
      v16 = v12;
    else
      v16 = 0.025;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v18, "fieldType") == 1)
        {
          if (objc_msgSend(v18, "fieldSource") == 1
            || objc_msgSend(v18, "fieldSource") == 2
            || (objc_msgSend(v18, "fieldSource") != 3 ? (v19 = !v5) : (v19 = 0), !v19))
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v18, "boundingQuad");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "size");
              v22 = v21;

              v23 = v22 * 0.95;
              if (v22 * 0.95 >= v16)
                v23 = v16;
              objc_msgSend(v18, "setSuggestedLineHeight:", v23);
            }
          }
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  return v25;
}

+ (_NSRange)_rangeOfFirstSegmentedFieldGroupInFields:(id)a3 startIndex:(int64_t)a4 modalWidth:(double)a5 modelGap:(double)a6
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  _NSRange result;

  v9 = a3;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  while (a4 + 1 < (unint64_t)objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4 + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend((id)objc_opt_class(), "_isRegion:segmentedBoxLeftOfRegion:withTolerance:modalWidth:modelGap:", v11, v12, 0.2, a5, a6);
    if (objc_msgSend(v11, "fieldSource") == 1 && objc_msgSend(v11, "fieldType") == 1)
    {
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        v14 = 1;
      else
        v14 = v13;
      if (v14 != 1)
      {
        ++a4;
        goto LABEL_19;
      }
      if (v10 != 0x7FFFFFFFFFFFFFFFLL && ((v13 ^ 1) & 1) == 0 && a4 == objc_msgSend(v9, "count") - 2)
      {
        a4 += 2;
LABEL_19:
        v16 = a4 - v10;

        if (v16)
          goto LABEL_21;
        break;
      }
      if ((v13 & (v10 == 0x7FFFFFFFFFFFFFFFLL)) != 0)
        v15 = a4;
      else
        v15 = v10;
    }
    else
    {
      v15 = 0x7FFFFFFFFFFFFFFFLL;
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_19;
    }

    ++a4;
    v10 = v15;
  }
  v16 = 0;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_21:

  v17 = v10;
  v18 = v16;
  result.length = v18;
  result.location = v17;
  return result;
}

+ (id)horizontalClustersFromFields:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  __n128 (*v20)(__n128 *, __n128 *);
  void **(*v21)(uint64_t);
  void *v22;
  void *v23[4];

  v3 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x4812000000;
  v20 = __Block_byref_object_copy__13;
  v21 = __Block_byref_object_dispose__14;
  v22 = &unk_1D5168E96;
  memset(v23, 0, 24);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__CRFormParser_horizontalClustersFromFields___block_invoke;
  v16[3] = &unk_1E98D9B50;
  v16[4] = &v17;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v16);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0x6DB6DB6DB6DB6DB7 * ((v18[7] - v18[6]) >> 3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v18[6];
  for (i = v18[7]; v5 != i; v5 += 56)
  {
    v14 = 0;
    v15 = 0;
    v13 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v13, *(const void **)(v5 + 32), *(_QWORD *)(v5 + 40), (uint64_t)(*(_QWORD *)(v5 + 40) - *(_QWORD *)(v5 + 32)) >> 3);
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

    v9 = v13;
    v8 = v14;
    if (v13 != v14)
    {
      do
      {
        v10 = *v9;
        objc_msgSend(v4, "lastObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addIndex:", v10);

        ++v9;
      }
      while (v9 != v8);
      v9 = v13;
    }
    if (v9)
    {
      v14 = v9;
      operator delete(v9);
    }
  }
  _Block_object_dispose(&v17, 8);
  std::vector<+[CRFormParser horizontalClustersFromFields:]::ClusteredLine>::~vector[abi:ne180100](v23);

  return v4;
}

+ (void)horizontalClustersFromFields:(void *)a1
{
  char *v2;
  char *v3;
  void *v4;
  void *v5;

  v2 = (char *)*a1;
  if (*a1)
  {
    v3 = (char *)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        v5 = (void *)*((_QWORD *)v3 - 3);
        if (v5)
        {
          *((_QWORD *)v3 - 2) = v5;
          operator delete(v5);
        }
        v3 -= 56;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void __45__CRFormParser_horizontalClustersFromFields___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  _BOOL4 v15;
  double Width;
  double v17;
  _BOOL4 v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double MidY;
  double v24;
  double v25;
  double v26;
  _QWORD *v27;
  uint64_t v28;
  int64x2_t *v29;
  CGFloat *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  char *v46;
  CGFloat *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  __int128 v51;
  int64x2_t v52;
  char *v53;
  char *v54;
  char *v55;
  _QWORD *v56;
  uint64_t v57;
  char *v58;
  int64x2_t v59;
  char *v60;
  int64x2_t *v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v5 = a2;
  objc_msgSend(v5, "boundingQuad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "boundingBox");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  if (objc_msgSend(v5, "fieldSource") == 1
    && (v62.origin.x = v8, v62.origin.y = v10, v62.size.width = v12, v62.size.height = v14, CGRectGetWidth(v62) < 0.2))
  {
    v63.origin.x = v8;
    v63.origin.y = v10;
    v63.size.width = v12;
    v63.size.height = v14;
    v15 = CGRectGetHeight(v63) < 0.2;
  }
  else
  {
    v15 = 0;
  }
  v64.origin.x = v8;
  v64.origin.y = v10;
  v64.size.width = v12;
  v64.size.height = v14;
  Width = CGRectGetWidth(v64);
  v65.origin.x = v8;
  v65.origin.y = v10;
  v65.size.width = v12;
  v65.size.height = v14;
  v17 = Width / CGRectGetHeight(v65);
  v18 = v17 > 0.5 && v15;
  if (v18 && v17 < 2.5)
  {
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v21 = *(_QWORD *)(v20 + 48);
    v22 = *(_QWORD *)(v20 + 56);
    while (v21 != v22)
    {
      v66.origin.x = v8;
      v66.origin.y = v10;
      v66.size.width = v12;
      v66.size.height = v14;
      MidY = CGRectGetMidY(v66);
      if (MidY >= CGRectGetMinY(*(CGRect *)v21))
      {
        v67.origin.x = v8;
        v67.origin.y = v10;
        v67.size.width = v12;
        v67.size.height = v14;
        v24 = CGRectGetMidY(v67);
        if (v24 <= CGRectGetMaxY(*(CGRect *)v21))
          goto LABEL_31;
      }
      v25 = CGRectGetMidY(*(CGRect *)v21);
      v68.origin.x = v8;
      v68.origin.y = v10;
      v68.size.width = v12;
      v68.size.height = v14;
      if (v25 >= CGRectGetMinY(v68))
      {
        v26 = CGRectGetMidY(*(CGRect *)v21);
        v69.origin.x = v8;
        v69.origin.y = v10;
        v69.size.width = v12;
        v69.size.height = v14;
        if (v26 <= CGRectGetMaxY(v69))
        {
LABEL_31:
          v70.origin.x = v8;
          v70.origin.y = v10;
          v70.size.width = v12;
          v70.size.height = v14;
          *(CGRect *)v21 = CGRectUnion(*(CGRect *)v21, v70);
          v39 = *(char **)(v21 + 40);
          v40 = *(_QWORD *)(v21 + 48);
          if ((unint64_t)v39 >= v40)
          {
            v41 = *(char **)(v21 + 32);
            v42 = (v39 - v41) >> 3;
            if ((unint64_t)(v42 + 1) >> 61)
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            v43 = v40 - (_QWORD)v41;
            v44 = (uint64_t)(v40 - (_QWORD)v41) >> 2;
            if (v44 <= v42 + 1)
              v44 = v42 + 1;
            if (v43 >= 0x7FFFFFFFFFFFFFF8)
              v45 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v45 = v44;
            if (v45)
            {
              v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v21 + 48, v45);
              v41 = *(char **)(v21 + 32);
              v39 = *(char **)(v21 + 40);
            }
            else
            {
              v46 = 0;
            }
            v54 = &v46[8 * v42];
            v55 = &v46[8 * v45];
            *(_QWORD *)v54 = a3;
            v56 = v54 + 8;
            while (v39 != v41)
            {
              v57 = *((_QWORD *)v39 - 1);
              v39 -= 8;
              *((_QWORD *)v54 - 1) = v57;
              v54 -= 8;
            }
            *(_QWORD *)(v21 + 32) = v54;
            *(_QWORD *)(v21 + 40) = v56;
            *(_QWORD *)(v21 + 48) = v55;
            if (v41)
              operator delete(v41);
            *(_QWORD *)(v21 + 40) = v56;
          }
          else
          {
            *(_QWORD *)v39 = a3;
            *(_QWORD *)(v21 + 40) = v39 + 8;
          }
          goto LABEL_48;
        }
      }
      v21 += 56;
    }
    v27 = operator new(8uLL);
    *v27 = a3;
    v28 = (uint64_t)(v27 + 1);
    v29 = *(int64x2_t **)(*(_QWORD *)(a1 + 32) + 8);
    v30 = (CGFloat *)v29[3].i64[1];
    v31 = v29[4].u64[0];
    if ((unint64_t)v30 >= v31)
    {
      v33 = v29[3].i64[0];
      v34 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v30 - v33) >> 3);
      if ((unint64_t)(v34 + 1) > 0x492492492492492)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v35 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v31 - v33) >> 3);
      v36 = 2 * v35;
      if (2 * v35 <= v34 + 1)
        v36 = v34 + 1;
      if (v35 >= 0x249249249249249)
        v37 = 0x492492492492492;
      else
        v37 = v36;
      v61 = v29 + 4;
      if (v37)
      {
        if (v37 > 0x492492492492492)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v38 = (char *)operator new(56 * v37);
      }
      else
      {
        v38 = 0;
      }
      v47 = (CGFloat *)&v38[56 * v34];
      v58 = v38;
      v59.i64[0] = (uint64_t)v47;
      v59.i64[1] = (uint64_t)v47;
      v60 = &v38[56 * v37];
      *v47 = v8;
      v47[1] = v10;
      v47[2] = v12;
      v47[3] = v14;
      v47[5] = 0.0;
      v47[6] = 0.0;
      v47[4] = 0.0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>((_QWORD *)v47 + 4, v27, v28, 1uLL);
      v48 = v59.i64[0];
      v32 = v59.i64[1] + 56;
      v59.i64[1] += 56;
      v50 = v29[3].i64[0];
      v49 = v29[3].u64[1];
      if (v49 == v50)
      {
        v52 = vdupq_n_s64(v49);
      }
      else
      {
        do
        {
          v51 = *(_OWORD *)(v49 - 56);
          *(_OWORD *)(v48 - 40) = *(_OWORD *)(v49 - 40);
          *(_OWORD *)(v48 - 56) = v51;
          *(_QWORD *)(v48 - 16) = 0;
          *(_QWORD *)(v48 - 8) = 0;
          *(_QWORD *)(v48 - 24) = 0;
          *(_OWORD *)(v48 - 24) = *(_OWORD *)(v49 - 24);
          *(_QWORD *)(v48 - 8) = *(_QWORD *)(v49 - 8);
          v48 -= 56;
          *(_QWORD *)(v49 - 24) = 0;
          *(_QWORD *)(v49 - 16) = 0;
          *(_QWORD *)(v49 - 8) = 0;
          v49 -= 56;
        }
        while (v49 != v50);
        v52 = v29[3];
        v32 = v59.i64[1];
      }
      v29[3].i64[0] = v48;
      v29[3].i64[1] = v32;
      v59 = v52;
      v53 = (char *)v29[4].i64[0];
      v29[4].i64[0] = (uint64_t)v60;
      v60 = v53;
      v58 = (char *)v52.i64[0];
      std::__split_buffer<+[CRFormParser horizontalClustersFromFields:]::ClusteredLine>::~__split_buffer((uint64_t)&v58);
    }
    else
    {
      *v30 = v8;
      v30[1] = v10;
      v30[2] = v12;
      v30[3] = v14;
      v30[5] = 0.0;
      v30[6] = 0.0;
      v30[4] = 0.0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>((_QWORD *)v30 + 4, v27, v28, 1uLL);
      v32 = (uint64_t)(v30 + 7);
      v29[3].i64[1] = v32;
    }
    v29[3].i64[1] = v32;
    operator delete(v27);
  }
LABEL_48:

}

+ (id)_groupSegmentedFieldsInFields:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v3 = a3;
  +[CRFormParser horizontalClustersFromFields:](CRFormParser, "horizontalClustersFromFields:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __46__CRFormParser__groupSegmentedFieldsInFields___block_invoke;
  v13 = &unk_1E98D9B98;
  v6 = v3;
  v14 = v6;
  v7 = v5;
  v15 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "mutableCopy", v10, v11, v12, v13);
  objc_msgSend(v8, "removeObjectsInArray:", v7);

  return v8;
}

void __46__CRFormParser__groupSegmentedFieldsInFields___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  unint64_t j;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  id v21;
  id obj;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int128 buf;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v21 = a2;
  if ((unint64_t)objc_msgSend(v21, "count") >= 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectsAtIndexes:", v21);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    CROSLogForCategory(6);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v24, "count");
      _os_log_impl(&dword_1D4FB8000, v4, OS_LOG_TYPE_DEBUG, "Force-grouping %ld fields from a line", (uint8_t *)&buf, 0xCu);
    }

    +[CRFormParser _groupSegmentedFieldsInAlignedFields:](CRFormParser, "_groupSegmentedFieldsInAlignedFields:", v24);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    if (v5)
    {
      v23 = *(_QWORD *)v28;
      *(_QWORD *)&v6 = 134218240;
      v20 = v6;
      do
      {
        v25 = v5;
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v28 != v23)
            objc_enumerationMutation(obj);
          objc_msgSend(v24, "objectsAtIndexes:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), v20);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v36 = 0x2020000000;
          v37 = 0x7FFFFFFFFFFFFFFFLL;
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __46__CRFormParser__groupSegmentedFieldsInFields___block_invoke_21;
          v26[3] = &unk_1E98D9B50;
          v26[4] = &buf;
          objc_msgSend(v8, "enumerateObjectsUsingBlock:", v26);
          if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 24) == 0x7FFFFFFFFFFFFFFFLL)
          {
            v9 = 0;
          }
          else
          {
            objc_msgSend(v8, "objectAtIndexedSubscript:");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "boundingQuad");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            for (j = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) + 1; j < objc_msgSend(v8, "count"); ++j)
            {
              objc_msgSend(v8, "objectAtIndexedSubscript:", j);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v12, "boundingQuad");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v14) = 0;
                objc_msgSend(v10, "unionWithNormalizedQuad:baselineAngle:", v13, v14);
                v15 = objc_claimAutoreleasedReturnValue();

                v10 = (void *)v15;
                objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
              }

            }
            objc_msgSend(v9, "setBoundingQuad:", v10);
            objc_msgSend(v9, "setMaxCharacterCount:", objc_msgSend(v8, "count"));

          }
          CROSLogForCategory(6);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v17 = objc_msgSend(v21, "count");
            v18 = objc_msgSend(*(id *)(a1 + 32), "count");
            v19 = objc_msgSend(*(id *)(a1 + 40), "count");
            *(_DWORD *)v31 = v20;
            v32 = v17;
            v33 = 2048;
            v34 = v18 - v19;
            _os_log_impl(&dword_1D4FB8000, v16, OS_LOG_TYPE_DEBUG, "Removing %ld fields from global list, remaining field count = %ld", v31, 0x16u);
          }

          _Block_object_dispose(&buf, 8);
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
      }
      while (v5);
    }

  }
}

uint64_t __46__CRFormParser__groupSegmentedFieldsInFields___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  double MidX;
  void *v7;
  double v8;
  uint64_t v9;
  CGRect v11;
  CGRect v12;

  v4 = a3;
  objc_msgSend(a2, "boundingQuad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundingBox");
  MidX = CGRectGetMidX(v11);
  objc_msgSend(v4, "boundingQuad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "boundingBox");
  v8 = CGRectGetMidX(v12);

  if (MidX >= v8)
    v9 = 1;
  else
    v9 = -1;

  return v9;
}

void __46__CRFormParser__groupSegmentedFieldsInFields___block_invoke_21(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }

}

+ (id)_groupSegmentedFieldsInAlignedFields:(id)a3
{
  id v3;
  unint64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  unint64_t v10;
  void *v11;
  void *v12;
  double MinX;
  void *v14;
  void *v15;
  double MaxX;
  int v17;
  int v18;
  _QWORD *v19;
  _QWORD **v20;
  _QWORD *v21;
  _QWORD **v22;
  int v23;
  _QWORD *v24;
  uint64_t **v25;
  _QWORD *v26;
  _QWORD **v27;
  _QWORD *v28;
  _QWORD **v29;
  int v30;
  _QWORD *v31;
  uint64_t **v32;
  uint64_t *v33;
  unint64_t v34;
  int v35;
  uint64_t *v38;
  uint64_t *v39;
  BOOL v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;
  uint64_t *v46;
  uint64_t *v47;
  NSObject *v48;
  double v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  void *v53;
  __int128 v54;
  NSObject *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  __int128 v60;
  int v62;
  uint64_t *v63;
  _QWORD *v64[2];
  uint64_t *v65;
  _QWORD *v66[2];
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  _BYTE v70[20];
  __int16 v71;
  unint64_t v72;
  uint64_t v73;
  CGRect v74;
  CGRect v75;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = 0;
  v5 = 0;
  v66[0] = 0;
  v66[1] = 0;
  v64[1] = 0;
  v65 = (uint64_t *)v66;
  v63 = (uint64_t *)v64;
  v64[0] = 0;
  while (v4 < objc_msgSend(v3, "count") - 1)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "boundingQuad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "size");
    v9 = v8;

    v10 = v4 + 1;
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "boundingQuad");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "boundingBox");
    MinX = CGRectGetMinX(v74);
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "boundingQuad");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "boundingBox");
    MaxX = CGRectGetMaxX(v75);

    v17 = (int)(v9 * 100.0);
    *(_DWORD *)buf = v17;
    v18 = (int)((MinX - MaxX) * 100.0);
    v62 = v18;
    if (v17 <= 9 && MinX - MaxX >= 0.0 && v18 <= 5)
    {
      v19 = v64[0];
      if (!v64[0])
        goto LABEL_15;
      v20 = v64;
      do
      {
        v21 = v19;
        v22 = v20;
        v23 = *((_DWORD *)v19 + 8);
        v24 = v19 + 1;
        if (v23 >= v17)
        {
          v24 = v21;
          v20 = (_QWORD **)v21;
        }
        v19 = (_QWORD *)*v24;
      }
      while (v19);
      if (v20 == v64)
        goto LABEL_15;
      if (v23 < v17)
        v21 = v22;
      if (*((_DWORD *)v21 + 8) > v17)
LABEL_15:
        std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v63, (int)(v9 * 100.0), buf)[5] = 0;
      v25 = std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v63, (int)(v9 * 100.0), buf);
      v25[5] = (uint64_t *)((char *)v25[5] + 1);
      v26 = v66[0];
      if (!v66[0])
        goto LABEL_25;
      v27 = v66;
      do
      {
        v28 = v26;
        v29 = v27;
        v30 = *((_DWORD *)v26 + 8);
        v31 = v26 + 1;
        if (v30 >= v18)
        {
          v31 = v28;
          v27 = (_QWORD **)v28;
        }
        v26 = (_QWORD *)*v31;
      }
      while (v26);
      if (v27 == v66)
        goto LABEL_25;
      if (v30 < v18)
        v28 = v29;
      if (*((_DWORD *)v28 + 8) > v18)
LABEL_25:
        std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v65, v18, &v62)[5] = 0;
      v32 = std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v65, v18, &v62);
      ++v5;
      v32[5] = (uint64_t *)((char *)v32[5] + 1);
    }
    v4 = v10;
  }
  v33 = v65;
  if (v65 == (uint64_t *)v66)
  {
    v35 = -1;
    v34 = -1;
  }
  else
  {
    v34 = -1;
    v35 = -1;
    do
    {
      if (v35 == -1 || v33[5] > v34)
      {
        v34 = v33[5];
        v35 = *((_DWORD *)v33 + 8);
      }
      v38 = (uint64_t *)v33[1];
      if (v38)
      {
        do
        {
          v39 = v38;
          v38 = (uint64_t *)*v38;
        }
        while (v38);
      }
      else
      {
        do
        {
          v39 = (uint64_t *)v33[2];
          v40 = *v39 == (_QWORD)v33;
          v33 = v39;
        }
        while (!v40);
      }
      v33 = v39;
    }
    while (v39 != (uint64_t *)v66);
  }
  v41 = v63;
  if (v63 == (uint64_t *)v64)
  {
    v43 = -1;
    v42 = -1;
  }
  else
  {
    v42 = -1;
    v43 = -1;
    do
    {
      if (v43 == -1 || v41[5] > v34)
      {
        v42 = v41[5];
        v43 = *((_DWORD *)v41 + 8);
      }
      v46 = (uint64_t *)v41[1];
      if (v46)
      {
        do
        {
          v47 = v46;
          v46 = (uint64_t *)*v46;
        }
        while (v46);
      }
      else
      {
        do
        {
          v47 = (uint64_t *)v41[2];
          v40 = *v47 == (_QWORD)v41;
          v41 = v47;
        }
        while (!v40);
      }
      v41 = v47;
    }
    while (v47 != (uint64_t *)v64);
  }
  CROSLogForCategory(6);
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219008;
    v68 = v5;
    v69 = 1024;
    *(_DWORD *)v70 = v43;
    *(_WORD *)&v70[4] = 2048;
    *(_QWORD *)&v70[6] = v42;
    *(_WORD *)&v70[14] = 1024;
    *(_DWORD *)&v70[16] = v35;
    v71 = 2048;
    v72 = v34;
    _os_log_impl(&dword_1D4FB8000, v48, OS_LOG_TYPE_DEBUG, "Line analysis with %ld fields: modal width = %d (%ld fields) gap width = %d (%ld fields)", buf, 0x2Cu);
  }

  v49 = (double)v35;
  v50 = objc_msgSend(a1, "_rangeOfFirstSegmentedFieldGroupInFields:startIndex:modalWidth:modelGap:", v3, 0, (double)v43, (double)v35);
  v52 = v51;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v54 = 136315650;
  v60 = v54;
  while (v50 != 0x7FFFFFFFFFFFFFFFLL)
  {
    CROSLogForCategory(6);
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v60;
      v68 = "+[CRFormParser _groupSegmentedFieldsInAlignedFields:]";
      v69 = 2048;
      *(_QWORD *)v70 = v50;
      *(_WORD *)&v70[8] = 2048;
      *(_QWORD *)&v70[10] = v52;
      _os_log_impl(&dword_1D4FB8000, v55, OS_LOG_TYPE_DEBUG, "%s: Found a range of small fields to be merged together (%ld, %ld)", buf, 0x20u);
    }

    if (v52 >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v50, v52);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addObject:", v56);

    }
    v50 = objc_msgSend(a1, "_rangeOfFirstSegmentedFieldGroupInFields:startIndex:modalWidth:modelGap:", v3, v50 + v52, (double)v43, v49, v60);
    v52 = v57;
  }
  if (v52 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0x7FFFFFFFFFFFFFFFLL, v52);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addObject:", v58);

  }
  std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::destroy(v64[0]);
  std::__tree<std::__value_type<int,unsigned long>,std::__map_value_compare<int,std::__value_type<int,unsigned long>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned long>>>::destroy(v66[0]);

  return v53;
}

+ (id)_textFieldsAndRegionsFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __42__CRFormParser__textFieldsAndRegionsFrom___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _BOOL8 v7;

  v2 = a2;
  CRCastAsClass<CROutputRegion>(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "type") != 0x2000)
  {
    v7 = 1;
    goto LABEL_10;
  }
  v5 = v2;
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EFF19038) & 1) == 0)
  {

    v6 = 0;
    goto LABEL_7;
  }
  v6 = v5;

  if (!v6)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v7 = objc_msgSend(v6, "fieldType") == 1;
LABEL_8:

LABEL_10:
  return v7;
}

- (void)_parseFieldsWithLabelFinderAndKeywords:(id)a3 fieldsAndRegions:(id)a4 updateExternal:(BOOL)a5 locale:(id)a6
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  char v23;
  id v24;
  id obj;
  void *v26;
  _QWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void **v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  objc_msgSend(a4, "_nonFieldRegions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v24;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        memset(v27, 0, sizeof(v27));
        +[CRFormLabelFinder parseAndAssignLabelForField:regions:associatedLabels:labelRegions:](CRFormLabelFinder, "parseAndAssignLabelForField:regions:associatedLabels:labelRegions:", v11, v26, v7, v27);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "fieldType") == 1
          && objc_msgSend(v11, "fieldSource") == 1
          && objc_msgSend(v11, "textContentType"))
        {
          objc_msgSend(v11, "setTextContentType:", 0);
        }
        if (objc_msgSend(v11, "fieldType") == 1 && objc_msgSend(v11, "fieldSource") == 7)
        {
          objc_msgSend(v11, "fieldValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "length") == 0;

          if (!v14)
            objc_msgSend(v11, "setTextContentType:", 50);
        }
        else
        {
          objc_msgSend(v12, "text");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15 == 0;

          if (!v16)
          {
            objc_msgSend(v12, "text");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = +[CRFormContentTypeKeywordBasedPredictor predictContentTypeWithKeywordMatching:locale:keyword:withPriorityKeywords:](CRFormContentTypeKeywordBasedPredictor, "predictContentTypeWithKeywordMatching:locale:keyword:withPriorityKeywords:", v17, 0, 0, 1);

            if (v18)
              goto LABEL_20;
            objc_msgSend(v12, "text");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = +[CRFormContentTypeKeywordBasedPredictor predictContentTypeWithKeywordMatching:locale:keyword:withPriorityKeywords:](CRFormContentTypeKeywordBasedPredictor, "predictContentTypeWithKeywordMatching:locale:keyword:withPriorityKeywords:", v19, 0, 0, 0);

            +[CRFormContentTypeKeywordBasedPredictor useKeywordTypes](CRFormContentTypeKeywordBasedPredictor, "useKeywordTypes");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v20, "containsObject:", v21);

            v23 = v18 ? v22 : 0;
            if ((v23 & 1) != 0)
            {
LABEL_20:
              if (objc_msgSend(v11, "fieldType") == 1)
                objc_msgSend(v11, "setTextContentType:", v18);
            }
          }
        }

        v32 = (void **)v27;
        std::vector<std::tuple<double,CRFormFieldLabelPosition,CROutputRegion * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v32);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v8);
  }

}

- (void)_parseFieldsWithTransformer:(id)a3 fieldsAndRegions:(id)a4 updateExternal:(BOOL)a5 locale:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  CRFormContentTypePredictor *predictor;
  void *v13;
  void *v14;
  id v15;

  v7 = a5;
  v15 = a3;
  v10 = a4;
  v11 = a6;
  -[CRFormParser _parseFieldsWithLabelFinderAndKeywords:fieldsAndRegions:updateExternal:locale:](self, "_parseFieldsWithLabelFinderAndKeywords:fieldsAndRegions:updateExternal:locale:", v15, v10, v7, v11);
  predictor = self->_predictor;
  objc_msgSend(v15, "_fieldsOfType:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_textFieldsAndRegionsFrom:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRFormContentTypePredictor predictAndAssignContentTypesForFields:fieldsAndRegions:locale:updateExternal:](predictor, "predictAndAssignContentTypesForFields:fieldsAndRegions:locale:updateExternal:", v13, v14, v11, v7);

}

+ (id)_mergedFieldsWithUnifiedQuadsFromFields:(id)a3 needsFieldReplacement:(BOOL *)a4 originalField:(id)a5 replacementField:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  BOOL *v34;
  _QWORD v35[6];

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = objc_msgSend(v9, "indexOfObjectPassingTest:", &__block_literal_global_111);
  v13 = objc_msgSend(v9, "indexOfObjectPassingTest:", &__block_literal_global_112);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL || v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v25 = v9;
  }
  else
  {
    v14 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "boundingQuad");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "normalizationSize");
    v18 = v17;
    v20 = v19;

    v21 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __109__CRFormParser__mergedFieldsWithUnifiedQuadsFromFields_needsFieldReplacement_originalField_replacementField___block_invoke_3;
    v35[3] = &__block_descriptor_48_e39_B32__0___CRFormFieldProviding__8Q16_B24l;
    v35[4] = v18;
    v35[5] = v20;
    objc_msgSend(v9, "indexesOfObjectsPassingTest:", v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v21;
    v27[1] = 3221225472;
    v27[2] = __109__CRFormParser__mergedFieldsWithUnifiedQuadsFromFields_needsFieldReplacement_originalField_replacementField___block_invoke_4;
    v27[3] = &unk_1E98D9C40;
    v28 = v9;
    v32 = v18;
    v33 = v20;
    v29 = v10;
    v30 = v11;
    v23 = v14;
    v31 = v23;
    v34 = a4;
    objc_msgSend(v22, "enumerateIndexesUsingBlock:", v27);
    v24 = v31;
    v25 = v23;

  }
  return v25;
}

BOOL __109__CRFormParser__mergedFieldsWithUnifiedQuadsFromFields_needsFieldReplacement_originalField_replacementField___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "fieldSource") == 4
    || objc_msgSend(v2, "fieldSource") == 5
    || objc_msgSend(v2, "fieldSource") == 6;

  return v3;
}

BOOL __109__CRFormParser__mergedFieldsWithUnifiedQuadsFromFields_needsFieldReplacement_originalField_replacementField___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "fieldSource") == 1
    || objc_msgSend(v2, "fieldSource") == 2
    || objc_msgSend(v2, "fieldSource") == 3;

  return v3;
}

BOOL __109__CRFormParser__mergedFieldsWithUnifiedQuadsFromFields_needsFieldReplacement_originalField_replacementField___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  _BOOL8 v6;

  objc_msgSend(a2, "boundingQuad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "normalizationSize");
  v6 = v5 != *(double *)(a1 + 40) || v4 != *(double *)(a1 + 32);

  return v6;
}

void __109__CRFormParser__mergedFieldsWithUnifiedQuadsFromFields_needsFieldReplacement_originalField_replacementField___block_invoke_4(uint64_t a1, uint64_t a2)
{
  CRNormalizedQuad *v4;
  void *v5;
  CRNormalizedQuad *v6;
  CRFormField *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [CRNormalizedQuad alloc];
  objc_msgSend(v8, "boundingQuad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundingBox");
  v6 = -[CRNormalizedQuad initWithNormalizedBoundingBox:size:](v4, "initWithNormalizedBoundingBox:size:");

  v7 = -[CRFormField initWithQuad:type:source:value:contentType:maxCharacterCount:]([CRFormField alloc], "initWithQuad:type:source:value:contentType:maxCharacterCount:", v6, objc_msgSend(v8, "fieldType"), objc_msgSend(v8, "fieldSource"), 0, objc_msgSend(v8, "textContentType"), objc_msgSend(v8, "maxCharacterCount"));
  -[CRFormField setOriginalField:](v7, "setOriginalField:", v8);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
  objc_msgSend(*(id *)(a1 + 56), "setObject:atIndexedSubscript:", v7, a2);
  **(_BYTE **)(a1 + 80) = 1;

}

+ (id)_restoredFieldsWithFields:(id)a3 originalField:(id)a4 replacementField:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
        if (objc_msgSend(v14, "fieldSource") == 4
          || objc_msgSend(v14, "fieldSource") == 5
          || objc_msgSend(v14, "fieldSource") == 6)
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v9, "indexOfObject:", v14));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v15);
        }
        else
        {
          CRCastAsClass<CRFormFieldOutputRegion>(v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v16;
          if (v16)
          {
            objc_msgSend(v16, "precedingExternalField");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17 == 0;

            if (!v18)
            {
              objc_msgSend(v15, "precedingExternalField");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v9, "indexOfObject:", v19));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setPrecedingExternalField:", v20);

            }
          }
          objc_msgSend(v10, "addObject:", v14);
        }

        ++v13;
      }
      while (v11 != v13);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v11 = v21;
    }
    while (v21);
  }

  return v10;
}

- (id)_orderAndGroupLinesInDocument:(id)a3 allFields:(id)a4 regions:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char v45;
  uint8_t v46[128];
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v36 = a5;
  v28 = v7;
  v29 = v8;
  objc_msgSend(v7, "contentsWithTypes:", 8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_groupSegmentedFieldsInFields:", v8);
  v45 = 0;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v32, "count"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v32, "count"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_mergedFieldsWithUnifiedQuadsFromFields:needsFieldReplacement:originalField:replacementField:", v32, &v45, v33, v34);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRFormParser _orderedGroupsWithFields:lines:](CRFormParser, "_orderedGroupsWithFields:lines:", v30, v31);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        CROSLogForCategory(6);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v12, "boundingQuad");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "description");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v48 = "-[CRFormParser _orderAndGroupLinesInDocument:allFields:regions:]";
          v49 = 2112;
          v50 = (uint64_t)v15;
          _os_log_impl(&dword_1D4FB8000, v13, OS_LOG_TYPE_DEBUG, "%s: Sorting groups: %@", buf, 0x16u);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    }
    while (v9);
  }

  CROSLogForCategory(6);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = objc_msgSend(v32, "count");
    v18 = objc_msgSend(v31, "count");
    v19 = objc_msgSend(obj, "count");
    *(_DWORD *)buf = 136315906;
    v48 = "-[CRFormParser _orderAndGroupLinesInDocument:allFields:regions:]";
    v49 = 2048;
    v50 = v17;
    v51 = 2048;
    v52 = v18;
    v53 = 2048;
    v54 = v19;
    _os_log_impl(&dword_1D4FB8000, v16, OS_LOG_TYPE_DEBUG, "%s: Parsing %lu form fields with %lu text lines (%lu groups)", buf, 0x2Au);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v20 = obj;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "subregions");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObjectsFromArray:", v24);

      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v21);
  }

  objc_msgSend(v36, "_flattenedFields");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    objc_msgSend((id)objc_opt_class(), "_restoredFieldsWithFields:originalField:replacementField:", v25, v33, v34);
    v26 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v26;
  }

  return v25;
}

+ (id)_dominantLocaleInRegions:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v24;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[4];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v3 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = v24;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(v4);
        CRCastAsClass<CROutputRegion>(*(void **)(*((_QWORD *)&v33 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          if (objc_msgSend(v8, "type") != 0x2000
            || (objc_msgSend(v9, "labelRegion"),
                v10 = objc_claimAutoreleasedReturnValue(),
                v9,
                (v9 = (void *)v10) != 0))
          {
            objc_msgSend(v9, "text");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "length") == 0;

            if (!v12)
            {
              objc_msgSend(v9, "text");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v13, "length") == 1)
              {
                objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "text");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v14, "characterIsMember:", objc_msgSend(v15, "characterAtIndex:", 0));

                if ((v16 & 1) != 0)
                  goto LABEL_19;
              }
              else
              {

              }
              objc_msgSend(v9, "recognizedLocale");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                v18 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v3, "objectForKeyedSubscript:", v17);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = v19;
                if (!v19)
                  v19 = &unk_1E9926568;
                objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "integerValue") + 1);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, v17);

              }
            }
          }
        }
LABEL_19:

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v5);
  }

  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__119;
  v30 = __Block_byref_object_dispose__120;
  v31 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __41__CRFormParser__dominantLocaleInRegions___block_invoke;
  v25[3] = &unk_1E98D9C68;
  v25[4] = v32;
  v25[5] = &v26;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v25);
  v22 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(v32, 8);
  return v22;
}

void __41__CRFormParser__dominantLocaleInRegions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "integerValue") > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "integerValue");
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

+ (void)_setPrecedingExternalFieldsForFields:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "fieldSource", (_QWORD)v12) != 4 || objc_msgSend(v8, "fieldType") == -1)
        {
          CRCastAsClass<CRFormFieldOutputRegion>(v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v11;
          if (v11)
            objc_msgSend(v11, "setPrecedingExternalField:", v4);
        }
        else
        {
          v9 = v8;
          v10 = v4;
          v4 = v9;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (BOOL)_localeIsEnabled:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
    v5 = +[CRImageReader languageIsLatin:](CRImageReader, "languageIsLatin:", v4)
      || +[CRImageReader languageIsJapanese:](CRImageReader, "languageIsJapanese:", v4)
      || +[CRImageReader languageIsKorean:](CRImageReader, "languageIsKorean:", v4)
      || +[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v4)
      || +[CRImageReader languageIsVietnamese:](CRImageReader, "languageIsVietnamese:", v4)
      || +[CRImageReader languageIsThai:](CRImageReader, "languageIsThai:", v4)
      || +[CRImageReader languageIsCyrillic:](CRImageReader, "languageIsCyrillic:", v4);
  else
    v5 = 0;

  return v5;
}

- (id)parseFieldsInDocument:(id)a3 allFields:(id)a4 shouldUpdateExternalFields:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  id v17;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  -[CRFormParser _orderAndGroupLinesInDocument:allFields:regions:](self, "_orderAndGroupLinesInDocument:allFields:regions:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_setPrecedingExternalFieldsForFields:", v11);
  objc_msgSend((id)objc_opt_class(), "_dominantLocaleInRegions:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CRFormParser _localeIsEnabled:](self, "_localeIsEnabled:", v12);
  CROSLogForCategory(6);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      v19 = 136315394;
      v20 = "-[CRFormParser parseFieldsInDocument:allFields:shouldUpdateExternalFields:]";
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1D4FB8000, v14, OS_LOG_TYPE_DEFAULT, "%s: Content type prediction for locale %@ is enabled.", (uint8_t *)&v19, 0x16u);
    }

    -[CRFormParser _parseFieldsWithTransformer:fieldsAndRegions:updateExternal:locale:](self, "_parseFieldsWithTransformer:fieldsAndRegions:updateExternal:locale:", v11, v10, v5, v12);
    +[CRFormContentTypeRefiner groupAndAssignStructuralContentTypesForFields:locale:updateExternalFields:](CRFormContentTypeRefiner, "groupAndAssignStructuralContentTypesForFields:locale:updateExternalFields:", v11, v12, v5);
    v14 = objc_claimAutoreleasedReturnValue();
    v16 = -[NSObject mutableCopy](v14, "mutableCopy");

    v11 = (void *)v16;
  }
  else if (v15)
  {
    v19 = 136315394;
    v20 = "-[CRFormParser parseFieldsInDocument:allFields:shouldUpdateExternalFields:]";
    v21 = 2112;
    v22 = v12;
    _os_log_impl(&dword_1D4FB8000, v14, OS_LOG_TYPE_DEFAULT, "%s: Content type prediction for locale %@ is disabled.", (uint8_t *)&v19, 0x16u);
  }

  v17 = v11;
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictor, 0);
}

+ (uint64_t)horizontalClustersFromFields:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != v3)
  {
    *(_QWORD *)(a1 + 16) = v2 - 56;
    v4 = *(void **)(v2 - 24);
    if (v4)
    {
      *(_QWORD *)(v2 - 16) = v4;
      operator delete(v4);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 56;
    }
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

@end
