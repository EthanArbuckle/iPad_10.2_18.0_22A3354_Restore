@implementation CRListOutputRegion

- (CRListOutputRegion)initWithListItems:(id)a3
{
  id v4;
  CRListOutputRegion *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  id v32;
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
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CROutputRegion init](self, "init");
  if (v5 && objc_msgSend(v4, "count"))
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v42;
      v11 = 0.0;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v42 != v10)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v13, "baselineAngle");
          v15 = v14;
          -[CROutputRegion baselineAngle](v5, "baselineAngle");
          v17 = v15 - v16;
          if (v15 - v16 <= 3.14159265)
          {
            if (v17 <= -3.14159265)
              v17 = v17 + 6.28318531;
          }
          else
          {
            v17 = v17 + -6.28318531;
          }
          v18 = v16 + v17 * (float)(1.0 / (float)(v9 + i + 1));
          if (v18 <= 3.14159265)
          {
            if (v18 <= -3.14159265)
              v18 = v18 + 6.28318531;
          }
          else
          {
            v18 = v18 + -6.28318531;
          }
          -[CROutputRegion setBaselineAngle:](v5, "setBaselineAngle:", v18);
          v11 = v11 + (double)objc_msgSend(v13, "confidence");
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        v9 += i;
      }
      while (v8);
    }
    else
    {
      v11 = 0.0;
    }
    v32 = v4;

    -[CROutputRegion setConfidence:](v5, "setConfidence:", (v11 / (double)(unint64_t)objc_msgSend(v6, "count")));
    -[CRCompositeOutputRegion setShouldComputeBoundsFromChildren:](v5, "setShouldComputeBoundsFromChildren:", 1);
    -[CROutputRegion setShouldComputeTranscriptFromChildren:](v5, "setShouldComputeTranscriptFromChildren:", 1);
    -[CROutputRegion setChildren:](v5, "setChildren:", v6);
    v19 = (void *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v20 = v6;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v38 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          objc_msgSend(v25, "paragraphRegions");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v34;
            do
            {
              for (k = 0; k != v28; ++k)
              {
                if (*(_QWORD *)v34 != v29)
                  objc_enumerationMutation(v26);
                objc_msgSend(v19, "addObject:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k));
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
            }
            while (v28);
          }

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v22);
    }

    -[CROutputRegion setParagraphRegions:](v5, "setParagraphRegions:", v19);
    v4 = v32;
  }

  return v5;
}

+ (id)listsWithParagraphs:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CRListItemOutputRegion *v14;
  CRListOutputRegion *v15;
  id obj;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  +[CRLayoutList listsWithRegionGroups:](CRLayoutList, "listsWithRegionGroups:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v18 = *(_QWORD *)v25;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v6);
        v8 = (void *)objc_opt_new();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v7, "items");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v21;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v21 != v12)
                objc_enumerationMutation(v9);
              v14 = -[CRListItemOutputRegion initWithLayoutListItem:]([CRListItemOutputRegion alloc], "initWithLayoutListItem:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13));
              objc_msgSend(v8, "addObject:", v14);

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v11);
        }

        v15 = -[CRListOutputRegion initWithListItems:]([CRListOutputRegion alloc], "initWithListItems:", v8);
        -[CROutputRegion setLayoutDirection:](v15, "setLayoutDirection:", objc_msgSend(v7, "layoutDirection"));
        objc_msgSend(v19, "addObject:", v15);

        ++v6;
      }
      while (v6 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }

  return v19;
}

- (unint64_t)type
{
  return 256;
}

- (BOOL)contributesToDocumentHierarchy
{
  return 0;
}

@end
