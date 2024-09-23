@implementation WBSElementTargetingResult

- (WBSElementTargetingResult)initWithTarget:(id)a3 element:(id)a4
{
  id v7;
  id v8;
  WBSElementTargetingResult *v9;
  WBSElementTargetingResult *v10;
  uint64_t v11;
  NSMutableSet *elements;
  WBSElementTargetingResult *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSElementTargetingResult;
  v9 = -[WBSElementTargetingResult init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_target, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    elements = v10->_elements;
    v10->_elements = (NSMutableSet *)v11;

    v13 = v10;
  }

  return v10;
}

- (void)addElement:(id)a3
{
  -[NSMutableSet addObject:](self->_elements, "addObject:", a3);
}

- (int64_t)urlSimilarity
{
  void *v3;
  void *v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[_WKTargetedElementInfo mediaAndLinkURLs](self->_target, "mediaAndLinkURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __42__WBSElementTargetingResult_urlSimilarity__block_invoke((uint64_t)v3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_elements;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "mediaAndLinkURLs", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        __42__WBSElementTargetingResult_urlSimilarity__block_invoke((uint64_t)v11, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v4, "isEqualToSet:", v12))
        {

          if (objc_msgSend(v4, "count"))
            v13 = 2;
          else
            v13 = 1;
          goto LABEL_14;
        }
        v8 |= objc_msgSend(v4, "isSubsetOfSet:", v12);

      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }

    v13 = v8 & 1;
  }
  else
  {

    v13 = 0;
  }
LABEL_14:

  return v13;
}

id __42__WBSElementTargetingResult_urlSimilarity__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "safari_URLByRemovingQuery", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)hasSimilarGeometry
{
  double v3;
  double v4;
  BOOL result;
  NSMutableSet *elements;
  _QWORD v7[7];

  -[_WKTargetedElementInfo bounds](self->_target, "bounds");
  result = 0;
  if (v3 != 0.0 && v4 != 0.0)
  {
    elements = self->_elements;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__WBSElementTargetingResult_hasSimilarGeometry__block_invoke;
    v7[3] = &unk_1E5443688;
    v7[4] = self;
    *(double *)&v7[5] = v3;
    *(double *)&v7[6] = v4;
    return -[NSMutableSet safari_containsObjectPassingTest:](elements, "safari_containsObjectPassingTest:", v7);
  }
  return result;
}

BOOL __47__WBSElementTargetingResult_hasSimilarGeometry__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  _BOOL8 v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "positionType");
  if (v4 != objc_msgSend(v3, "positionType")
    || (v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "offsetEdges"), v5 != objc_msgSend(v3, "anchor")))
  {
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v3, "geometry");
  v8 = 0;
  if (v6 != 0.0 && v7 != 0.0)
  {
    v9 = *(double *)(a1 + 40);
    v10 = v9 - v6;
    v11 = -(v9 - v6);
    if (v10 < 0.0)
      v10 = v11;
    if (v10 / v9 > 0.15)
      goto LABEL_8;
    v13 = *(double *)(a1 + 48);
    v14 = v13 - v7;
    v15 = -(v13 - v7);
    if (v14 < 0.0)
      v14 = v15;
    v8 = v14 / v13 <= 0.15;
  }
LABEL_9:

  return v8;
}

- (void)hasSimilarRenderedText:(id)a3
{
  id v4;
  _WKTargetedElementInfo *target;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  target = self->_target;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__WBSElementTargetingResult_hasSimilarRenderedText___block_invoke;
  v7[3] = &unk_1E54436D8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[_WKTargetedElementInfo safari_renderedTextForCheckingSimilarityWithCompletion:](target, "safari_renderedTextForCheckingSimilarityWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __52__WBSElementTargetingResult_hasSimilarRenderedText___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  if (WeakRetained && (objc_msgSend(v6, "safari_isLongEnoughToCheckSimilarity") & 1) != 0)
  {
    v5 = (void *)WeakRetained[1];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__WBSElementTargetingResult_hasSimilarRenderedText___block_invoke_2;
    v7[3] = &unk_1E54436B0;
    v8 = v6;
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, objc_msgSend(v5, "safari_containsObjectPassingTest:", v7));

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }

}

BOOL __52__WBSElementTargetingResult_hasSimilarRenderedText___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  float v5;
  void *v6;
  float v7;
  _BOOL8 v8;

  v3 = a2;
  objc_msgSend(v3, "renderTreeText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") && (objc_msgSend(*(id *)(a1 + 32), "safari_similarityToString:", v4), v5 >= 0.65))
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v3, "imageAnalysisText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "safari_similarityToString:", v6);
      if (v7 >= 0.65)
        v8 = 1;
    }

  }
  return v8;
}

- (_WKTargetedElementInfo)target
{
  return self->_target;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

@end
