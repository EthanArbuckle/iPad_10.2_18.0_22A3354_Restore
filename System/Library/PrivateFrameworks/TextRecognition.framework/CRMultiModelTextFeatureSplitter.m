@implementation CRMultiModelTextFeatureSplitter

- (CRMultiModelTextFeatureSplitter)initWithConfiguration:(id)a3
{
  id v5;
  CRMultiModelTextFeatureSplitter *v6;
  CRMultiModelTextFeatureSplitter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRMultiModelTextFeatureSplitter;
  v6 = -[CRMultiModelTextFeatureSplitter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, a3);

  return v7;
}

- (void)enumerateLineRegions:(id)a3 usingBlock:(id)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Feature splitter enumeration must be overridden"));
}

+ (id)_recognizerRegionsFromLineRegions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "regionFragments");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v11);

        }
        else
        {
          objc_msgSend(v4, "addObject:", v10, (_QWORD)v13);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)_regionsAreLikelyStackedTextResults:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  BOOL v18;
  BOOL v19;
  float v20;
  BOOL v21;
  id obj;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v3)
  {
    v4 = v3;
    v24 = 0;
    v25 = 0;
    v5 = 0;
    v26 = *(_QWORD *)v28;
    while (1)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v28 != v26)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v7, "locale");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!+[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v8))
        {
          objc_msgSend(v7, "locale");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (!+[CRImageReader languageIsJapanese:](CRImageReader, "languageIsJapanese:", v9))
          {
            objc_msgSend(v7, "locale");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = +[CRImageReader languageIsKorean:](CRImageReader, "languageIsKorean:", v17);

            if (!v18)
              continue;
            goto LABEL_10;
          }

        }
LABEL_10:
        objc_msgSend(v7, "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
        {
          objc_msgSend(v7, "text");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "rangeOfComposedCharacterSequenceAtIndex:", 0);
          v13 = v12;
          objc_msgSend(v7, "text");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");

          if (v13 == v15)
          {
            ++v24;
            continue;
          }
        }
        else
        {

        }
        ++v5;
        objc_msgSend(v7, "confidence");
        if (v16 < 0.300000012)
          ++v25;
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (!v4)
        goto LABEL_21;
    }
  }
  v24 = 0;
  v25 = 0;
  v5 = 0;
LABEL_21:
  v19 = 0;
  if (v24 + v5 >= 0x32)
  {
    v20 = (float)v24 / (float)(unint64_t)objc_msgSend(obj, "count");
    if (v20 > 0.6 || v5 >= 5 && (v20 > 0.3 ? (v21 = (float)((float)v25 / (float)v5) <= 0.5) : (v21 = 1), !v21))
      v19 = 1;
  }

  return v19;
}

+ (id)_legacySortTextRegions:(id)a3 point:(CGPoint)a4 angle:(float)a5 sortingWithinLine:(BOOL)a6
{
  _QWORD v7[4];
  CGPoint v8;
  float v9;
  BOOL v10;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__CRMultiModelTextFeatureSplitter__legacySortTextRegions_point_angle_sortingWithinLine___block_invoke;
  v7[3] = &__block_descriptor_53_e35_q24__0___CRRegion__8___CRRegion__16l;
  v8 = a4;
  v9 = a5;
  v10 = a6;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __88__CRMultiModelTextFeatureSplitter__legacySortTextRegions_point_angle_sortingWithinLine___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  float v42;
  float v43;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "boundingQuad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topLeft");
  v53 = v8;
  v54 = v9;
  objc_msgSend(v6, "boundingQuad");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topRight");
  v55 = v11;
  v56 = v12;
  objc_msgSend(v6, "boundingQuad");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomRight");
  v57 = v14;
  v58 = v15;
  objc_msgSend(v6, "boundingQuad");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "bottomLeft");
  v59 = v17;
  v60 = v18;

  objc_msgSend(v5, "boundingQuad");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topLeft");
  v45 = v20;
  v46 = v21;
  objc_msgSend(v5, "boundingQuad");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topRight");
  v47 = v23;
  v48 = v24;
  objc_msgSend(v5, "boundingQuad");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomRight");
  v49 = v26;
  v50 = v27;
  objc_msgSend(v5, "boundingQuad");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "bottomLeft");
  v51 = v29;
  v52 = v30;

  v31 = *(float *)(a1 + 48);
  v32 = *(double *)(a1 + 32);
  v33 = *(double *)(a1 + 40);
  rotatePolygon(&v53, &v53, v32, v33, v31);
  rotatePolygon(&v45, &v45, v32, v33, v31);
  v34 = fmin(fmin(v54, v56), fmin(v58, v60));
  v35 = fmin(fmin(v46, v48), fmin(v50, v52));
  v36 = fmax(fmax(v54, v56), fmax(v58, v60)) - v34;
  if (v35 >= v34 + v36)
    return -1;
  v37 = fmax(fmax(v46, v48), fmax(v50, v52)) - v35;
  if (v34 >= v35 + v37)
    return 1;
  v38 = fmin(fmin(v53, v55), fmin(v57, v59));
  v39 = fmin(fmin(v45, v47), fmin(v49, v51));
  v40 = fmax(fmax(v53, v55), fmax(v57, v59)) - v38;
  if (v39 >= v38 + v40)
    return -1;
  v41 = fmax(fmax(v45, v47), fmax(v49, v51)) - v39;
  if (v38 >= v39 + v41)
    return 1;
  if (*(_BYTE *)(a1 + 52))
  {
    v36 = v40;
    v34 = v38;
    v37 = v41;
    v35 = v39;
  }
  v42 = v35 + v37 * 0.5;
  v43 = v34 + v36 * 0.5;
  if (v42 < v43)
    return 1;
  else
    return -1;
}

- (id)pruneLineRegions:(id)a3 recognitionResult:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  float v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  CRMultiModelTextFeatureSplitter *v40;
  void *v41;
  void *v42;
  id obj;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  void *v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v46 = a4;
  v7 = (void *)objc_opt_new();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v6;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v47)
  {
    v45 = *(_QWORD *)v56;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v56 != v45)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v8);
        v10 = (void *)objc_opt_class();
        v61 = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_recognizerRegionsFromLineRegions:", v11);
        v12 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "recognizedRegionsForDetectedLineRegions:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_29);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "filteredArrayUsingPredicate:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v48 = (void *)v12;
        v49 = v8;
        if (objc_msgSend(v15, "count") && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "boundingQuad");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "midPoint");
          v18 = v17;
          v20 = v19;

          objc_msgSend(v9, "boundingQuad");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "baselineAngle");
          v23 = v22;

          v24 = (void *)objc_opt_class();
          *(float *)&v25 = v23;
          objc_msgSend(v24, "_legacySortTextRegions:point:angle:sortingWithinLine:", v15, 1, v18, v20, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          -[CRMultiModelTextFeatureSplitter combineRegions:lineRegion:](self, "combineRegions:lineRegion:", v26, v9);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v27;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v28 = v15;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v52;
          do
          {
            v32 = 0;
            do
            {
              if (*(_QWORD *)v52 != v31)
                objc_enumerationMutation(v28);
              v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v32), "mutableCopy");
              objc_msgSend(v33, "text");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "length");

              if (v35)
              {
                -[CRMultiModelTextFeatureSplitter configuration](self, "configuration");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v36, "falsePositiveFilteringDisabled"))
                {
                  -[CRMultiModelTextFeatureSplitter configuration](self, "configuration");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((unint64_t)objc_msgSend(v37, "revision") > 2)
                  {
                    objc_msgSend(v33, "subregions");
                    v38 = v31;
                    v39 = v28;
                    v40 = self;
                    v41 = v7;
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    v50 = objc_msgSend(v42, "count");

                    v7 = v41;
                    self = v40;
                    v28 = v39;
                    v31 = v38;

                    if (v50)
                      objc_msgSend(v33, "adjustBoundsBasedOnSubregions");
                    goto LABEL_21;
                  }

                }
LABEL_21:
                objc_msgSend(v7, "addObject:", v33);
              }

              ++v32;
            }
            while (v30 != v32);
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
          }
          while (v30);
        }

        v8 = v49 + 1;
      }
      while (v49 + 1 != v47);
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v47);
  }

  return v7;
}

BOOL __70__CRMultiModelTextFeatureSplitter_pruneLineRegions_recognitionResult___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)groupLineRegions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[CRMultiModelTextFeatureSplitter configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textFeatureOrder");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "orderAndGroupRegions:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  -[CRMultiModelTextFeatureSplitter configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "falsePositiveFilteringDisabled");

  v10 = v8;
  if ((v6 & 1) == 0)
  {
    -[CRMultiModelTextFeatureSplitter configuration](self, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textFeatureFilter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "filterBlocks:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)groupLineRegions:(id)a3 tableGroups:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a4;
  v7 = a3;
  -[CRMultiModelTextFeatureSplitter configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textFeatureOrder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  -[CRMultiModelTextFeatureSplitter configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textFeatureOrder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v10 & 1) != 0)
    objc_msgSend(v12, "orderAndGroupRegions:tableGroups:", v7, v6);
  else
    objc_msgSend(v12, "orderAndGroupRegions:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v14;
  -[CRMultiModelTextFeatureSplitter configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "falsePositiveFilteringDisabled");

  v18 = v15;
  if ((v17 & 1) == 0)
  {
    -[CRMultiModelTextFeatureSplitter configuration](self, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "textFeatureFilter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "filterBlocks:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

- (id)pruneAndFilterLineRegions:(id)a3 recognitionResult:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  -[CRMultiModelTextFeatureSplitter pruneLineRegions:recognitionResult:](self, "pruneLineRegions:recognitionResult:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CRMultiModelTextFeatureSplitter configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "falsePositiveFilteringDisabled");

  v8 = v5;
  if ((v7 & 1) == 0)
  {
    -[CRMultiModelTextFeatureSplitter configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textFeatureFilter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filterLineRegions:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)combineRegions:(id)a3 lineRegion:(id)a4
{
  id v5;
  CRMutableRecognizedTextRegion *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  float v13;
  __CFString *v14;
  float v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  double v22;
  double v23;
  void *v24;
  uint64_t i;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  CRMutableRecognizedTextRegion *v38;
  id v39;
  void *v41;
  id v42;
  id obj;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v42 = a4;
  v6 = -[CRRecognizedTextRegion initWithType:detectedLineRegion:]([CRMutableRecognizedTextRegion alloc], "initWithType:detectedLineRegion:", 2, v42);
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRRecognizedTextRegion setLocale:](v6, "setLocale:", v8);

    v44 = (void *)objc_opt_new();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v39 = v5;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v50;
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      v13 = 0.0;
      v14 = &stru_1E98DC948;
      v15 = 0.0;
      do
      {
        v16 = 0;
        v17 = v14;
        do
        {
          if (*(_QWORD *)v50 != v11)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v16);
          objc_msgSend(v18, "subregions");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObjectsFromArray:", v19);

          -[CRRecognizedTextRegion setWhitespaceInjected:](v6, "setWhitespaceInjected:", objc_msgSend(v18, "whitespaceInjected") | -[CRRecognizedTextRegion whitespaceInjected](v6, "whitespaceInjected"));
          objc_msgSend(v18, "candidates");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          if (v12 >= v21)
            v12 = v21;
          objc_msgSend(v18, "confidence");
          v15 = v22 + v15;
          objc_msgSend(v18, "activationProbability");
          v13 = v23 + v13;
          objc_msgSend(v18, "text");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingFormat:](v17, "stringByAppendingFormat:", CFSTR(" %@"), v24);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v16;
          v17 = v14;
        }
        while (v10 != v16);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v10);
    }
    else
    {
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      v13 = 0.0;
      v14 = &stru_1E98DC948;
      v15 = 0.0;
    }
    v38 = v6;

    v41 = (void *)objc_opt_new();
    if (v12)
    {
      for (i = 0; i != v12; ++i)
      {
        v26 = (void *)objc_opt_new();
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v27 = obj;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v46;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v46 != v30)
                objc_enumerationMutation(v27);
              objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "candidates");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectAtIndexedSubscript:", i);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "addObject:", v33);

            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
          }
          while (v29);
        }

        -[CRMultiModelTextFeatureSplitter combineRegions:lineRegion:](self, "combineRegions:lineRegion:", v26, v42);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addObject:", v34);

      }
    }
    v6 = v38;
    -[CRRecognizedTextRegion setSubregions:](v38, "setSubregions:", v44);
    -[CRRecognizedTextRegion setCandidates:](v38, "setCandidates:", v41);
    -[CRRecognizedTextRegion setConfidence:](v38, "setConfidence:", (float)(v15 / (float)(unint64_t)objc_msgSend(obj, "count")));
    -[CRRecognizedTextRegion setActivationProbability:](v38, "setActivationProbability:", (float)(v13 / (float)(unint64_t)objc_msgSend(obj, "count")));
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByTrimmingCharactersInSet:](v14, "stringByTrimmingCharactersInSet:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRRecognizedTextRegion setText:](v38, "setText:", v36);

    v5 = v39;
  }

  return v6;
}

- (CRRecognizerConfiguration)configuration
{
  return (CRRecognizerConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
