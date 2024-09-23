@implementation WBSScribbleValidator

- (WBSScribbleValidator)initWithWebView:(id)a3 elements:(id)a4 excludedTargets:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WBSScribbleValidator *v14;
  WBSScribbleValidator *v15;
  uint64_t v16;
  NSArray *elementsToValidate;
  uint64_t v18;
  NSArray *targetsToExclude;
  uint64_t v20;
  NSMutableArray *targetsToHide;
  uint64_t v22;
  NSMutableArray *targetsToReveal;
  uint64_t v24;
  NSMutableArray *targetingResults;
  WBSScribbleValidator *v26;
  WBSScribbleValidator *v27;
  _QWORD v29[4];
  WBSScribbleValidator *v30;
  id v31;
  objc_super v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)WBSScribbleValidator;
  v14 = -[WBSScribbleValidator init](&v32, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_webView, v10);
    v16 = objc_msgSend(v11, "copy");
    elementsToValidate = v15->_elementsToValidate;
    v15->_elementsToValidate = (NSArray *)v16;

    v18 = objc_msgSend(v12, "copy");
    targetsToExclude = v15->_targetsToExclude;
    v15->_targetsToExclude = (NSArray *)v18;

    v20 = objc_opt_new();
    targetsToHide = v15->_targetsToHide;
    v15->_targetsToHide = (NSMutableArray *)v20;

    v22 = objc_opt_new();
    targetsToReveal = v15->_targetsToReveal;
    v15->_targetsToReveal = (NSMutableArray *)v22;

    v24 = objc_opt_new();
    targetingResults = v15->_targetingResults;
    v15->_targetingResults = (NSMutableArray *)v24;

    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __76__WBSScribbleValidator_initWithWebView_elements_excludedTargets_completion___block_invoke;
    v29[3] = &unk_1E5443108;
    v26 = v15;
    v30 = v26;
    v31 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], v29);
    v27 = v26;

  }
  else
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

  return v15;
}

uint64_t __76__WBSScribbleValidator_initWithWebView_elements_excludedTargets_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_validateElementsWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_validateElementsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11[2];
  id location;

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXScribble();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[WBSScribbleValidator _validateElementsWithCompletionHandler:].cold.1((uint64_t)self, v5);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v7 = v6;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__WBSScribbleValidator__validateElementsWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E5443728;
  v9[4] = self;
  objc_copyWeak(v11, &location);
  v8 = v4;
  v10 = v8;
  v11[1] = v7;
  -[WBSScribbleValidator _collectSimilarTargetsWithCompletion:](self, "_collectSimilarTargetsWithCompletion:", v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

}

void __63__WBSScribbleValidator__validateElementsWithCompletionHandler___block_invoke(id *a1)
{
  NSObject *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6[2];

  v2 = WBS_LOG_CHANNEL_PREFIXScribble();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __63__WBSScribbleValidator__validateElementsWithCompletionHandler___block_invoke_cold_1((uint64_t)a1, v2);
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (objc_msgSend(MEMORY[0x1E0D8A120], "scribbleRequiresVisualSimilarity"))
      objc_msgSend(WeakRetained, "_removeHiddenResultsWithSimilarURLs");
    else
      objc_msgSend(WeakRetained, "_removehiddenResultsAndAddInFlowElements");
    objc_msgSend(WeakRetained, "_removeResultsWithDifferentGeometryAndRevealTargetsIfNeeded");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __63__WBSScribbleValidator__validateElementsWithCompletionHandler___block_invoke_29;
    v4[3] = &unk_1E5443700;
    objc_copyWeak(v6, a1 + 6);
    v5 = a1[5];
    v6[1] = a1[7];
    objc_msgSend(WeakRetained, "_compareRenderedTextWithCompletion:", v4);

    objc_destroyWeak(v6);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }

}

void __63__WBSScribbleValidator__validateElementsWithCompletionHandler___block_invoke_29(uint64_t a1)
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  NSObject *v6;
  void (*v7)(void);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v4 = v3;
    v5 = *(double *)(a1 + 48);
    v6 = WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __63__WBSScribbleValidator__validateElementsWithCompletionHandler___block_invoke_29_cold_1(v6, v4, v5);
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v7();

}

- (NSArray)targetsToHide
{
  return (NSArray *)self->_targetsToHide;
}

- (NSArray)targetsToReveal
{
  return (NSArray *)self->_targetsToReveal;
}

- (void)_collectSimilarTargetsWithCompletion:(id)a3
{
  id v4;
  dispatch_group_t v5;
  NSArray *elementsToValidate;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  WBSScribbleValidator *v10;
  id v11;
  id location;

  v4 = a3;
  v5 = dispatch_group_create();
  objc_initWeak(&location, self);
  elementsToValidate = self->_elementsToValidate;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__WBSScribbleValidator__collectSimilarTargetsWithCompletion___block_invoke;
  v8[3] = &unk_1E5443778;
  objc_copyWeak(&v11, &location);
  v7 = v5;
  v9 = v7;
  v10 = self;
  -[NSArray enumerateObjectsUsingBlock:](elementsToValidate, "enumerateObjectsUsingBlock:", v8);
  dispatch_group_notify(v7, MEMORY[0x1E0C80D38], v4);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __61__WBSScribbleValidator__collectSimilarTargetsWithCompletion___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__WBSScribbleValidator__collectSimilarTargetsWithCompletion___block_invoke_2;
  v6[3] = &unk_1E5443750;
  objc_copyWeak(&v9, a1 + 6);
  v7 = a1[4];
  v4 = v3;
  v8 = v4;
  v5 = (void *)MEMORY[0x1A85D45E4](v6);
  dispatch_group_enter((dispatch_group_t)a1[4]);
  objc_msgSend(a1[5], "_findTargetsUsingHitTest:completion:", v4, v5);
  dispatch_group_enter((dispatch_group_t)a1[4]);
  objc_msgSend(a1[5], "_findTargetsUsingTextSearch:completion:", v4, v5);
  dispatch_group_enter((dispatch_group_t)a1[4]);
  objc_msgSend(a1[5], "_findTargetsUsingSelectors:completion:", v4, v5);

  objc_destroyWeak(&v9);
}

void __61__WBSScribbleValidator__collectSimilarTargetsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_addSimilarTargets:element:", v5, *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)_addSimilarTargets:(id)a3 element:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSArray *targetsToExclude;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  int v21;
  NSMutableArray *targetingResults;
  uint64_t v23;
  WBSScribbleValidator *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26 = a4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    v10 = MEMORY[0x1E0C809B0];
    v24 = self;
    v25 = v6;
    v23 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isNearbyTarget", v23) & 1) == 0)
        {
          targetsToExclude = self->_targetsToExclude;
          v31[0] = v10;
          v31[1] = 3221225472;
          v31[2] = __51__WBSScribbleValidator__addSimilarTargets_element___block_invoke;
          v31[3] = &unk_1E54437A0;
          v31[4] = v12;
          if ((-[NSArray safari_containsObjectPassingTest:](targetsToExclude, "safari_containsObjectPassingTest:", v31) & 1) == 0)
          {
            v29 = 0u;
            v30 = 0u;
            v27 = 0u;
            v28 = 0u;
            v14 = self->_targetingResults;
            v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v28;
              while (2)
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v28 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
                  objc_msgSend(v19, "target");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = objc_msgSend(v20, "isSameElement:", v12);

                  if (v21)
                  {
                    objc_msgSend(v19, "addElement:", v26);
                    self = v24;
                    goto LABEL_18;
                  }
                }
                v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
                if (v16)
                  continue;
                break;
              }
            }

            self = v24;
            targetingResults = v24->_targetingResults;
            v14 = -[WBSElementTargetingResult initWithTarget:element:]([WBSElementTargetingResult alloc], "initWithTarget:element:", v12, v26);
            -[NSMutableArray addObject:](targetingResults, "addObject:", v14);
LABEL_18:

            v6 = v25;
            v9 = v23;
            v10 = MEMORY[0x1E0C809B0];
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v8);
  }

}

uint64_t __51__WBSScribbleValidator__addSimilarTargets_element___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSameElement:", *(_QWORD *)(a1 + 32));
}

- (void)_findTargetsUsingHitTest:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id WeakRetained;
  double v8;
  double v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if ((objc_msgSend(v11, "isOutOfFlow") & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    if (WeakRetained)
    {
      objc_msgSend(v11, "hitTestLocationInWebView:", WeakRetained);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF6D8]), "initWithPoint:", v8, v9);
      objc_msgSend(WeakRetained, "_requestTargetedElementInfo:completionHandler:", v10, v6);

    }
    else
    {
      v6[2](v6, MEMORY[0x1E0C9AA60]);
    }

  }
  else
  {
    v6[2](v6, MEMORY[0x1E0C9AA60]);
  }

}

- (void)_findTargetsUsingTextSearch:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  if (WeakRetained)
  {
    objc_msgSend(v10, "searchableText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF6D8]), "initWithSearchText:", v8);
      objc_msgSend(WeakRetained, "_requestTargetedElementInfo:completionHandler:", v9, v6);

    }
    else
    {
      v6[2](v6, MEMORY[0x1E0C9AA60]);
    }

  }
  else
  {
    v6[2](v6, MEMORY[0x1E0C9AA60]);
  }

}

- (void)_findTargetsUsingSelectors:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  if (WeakRetained)
  {
    v18 = v7;
    v10 = dispatch_group_create();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = v6;
    objc_msgSend(v6, "allSelectorsIncludingShadowHosts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v16, "count", v18))
          {
            dispatch_group_enter(v10);
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF6D8]), "initWithSelectors:", v16);
            v23[0] = MEMORY[0x1E0C809B0];
            v23[1] = 3221225472;
            v23[2] = __62__WBSScribbleValidator__findTargetsUsingSelectors_completion___block_invoke;
            v23[3] = &unk_1E54437C8;
            v24 = v8;
            v25 = v10;
            objc_msgSend(WeakRetained, "_requestTargetedElementInfo:completionHandler:", v17, v23);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v13);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__WBSScribbleValidator__findTargetsUsingSelectors_completion___block_invoke_2;
    block[3] = &unk_1E5443450;
    v7 = v18;
    v22 = v18;
    v21 = v8;
    dispatch_group_notify(v10, MEMORY[0x1E0C80D38], block);

    v6 = v19;
  }
  else
  {
    (*((void (**)(id, void *))v7 + 2))(v7, v8);
  }

}

void __62__WBSScribbleValidator__findTargetsUsingSelectors_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __62__WBSScribbleValidator__findTargetsUsingSelectors_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_removehiddenResultsAndAddInFlowElements
{
  NSMutableArray *targetingResults;
  _QWORD v3[5];

  targetingResults = self->_targetingResults;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__WBSScribbleValidator__removehiddenResultsAndAddInFlowElements__block_invoke;
  v3[3] = &unk_1E54437F0;
  v3[4] = self;
  -[NSMutableArray safari_removeObjectsPassingTest:](targetingResults, "safari_removeObjectsPassingTest:", v3);
}

uint64_t __64__WBSScribbleValidator__removehiddenResultsAndAddInFlowElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInVisibilityAdjustmentSubtree");

  if ((_DWORD)v5)
  {
    objc_msgSend(v3, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "safari_isOutOfFlow");

    if ((v7 & 1) == 0)
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      objc_msgSend(v3, "target");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
  }

  return v5;
}

- (void)_removeHiddenResultsWithSimilarURLs
{
  NSMutableArray *targetingResults;
  _QWORD v3[5];

  targetingResults = self->_targetingResults;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__WBSScribbleValidator__removeHiddenResultsWithSimilarURLs__block_invoke;
  v3[3] = &unk_1E54437F0;
  v3[4] = self;
  -[NSMutableArray safari_removeObjectsPassingTest:](targetingResults, "safari_removeObjectsPassingTest:", v3);
}

uint64_t __59__WBSScribbleValidator__removeHiddenResultsWithSimilarURLs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInVisibilityAdjustmentSubtree");

  if (!v5 || (v6 = objc_msgSend(v3, "urlSimilarity")) == 0)
  {
    v10 = 0;
    goto LABEL_10;
  }
  if (v6 == 1)
    goto LABEL_6;
  if (v6 == 2)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(v3, "target");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

LABEL_6:
    v9 = WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __59__WBSScribbleValidator__removeHiddenResultsWithSimilarURLs__block_invoke_cold_1(v9, v3);
  }
  v10 = 1;
LABEL_10:

  return v10;
}

- (void)_removeResultsWithDifferentGeometryAndRevealTargetsIfNeeded
{
  NSMutableArray *targetingResults;
  _QWORD v3[5];

  targetingResults = self->_targetingResults;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__WBSScribbleValidator__removeResultsWithDifferentGeometryAndRevealTargetsIfNeeded__block_invoke;
  v3[3] = &unk_1E54437F0;
  v3[4] = self;
  -[NSMutableArray safari_removeObjectsPassingTest:](targetingResults, "safari_removeObjectsPassingTest:", v3);
}

uint64_t __83__WBSScribbleValidator__removeResultsWithDifferentGeometryAndRevealTargetsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "hasSimilarGeometry");
  if ((v4 & 1) == 0)
  {
    if (objc_msgSend(MEMORY[0x1E0D8A120], "scribbleRequiresVisualSimilarity"))
    {
      objc_msgSend(v3, "target");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isInVisibilityAdjustmentSubtree");

      if (v6)
      {
        v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        objc_msgSend(v3, "target");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

      }
    }
    v9 = WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __83__WBSScribbleValidator__removeResultsWithDifferentGeometryAndRevealTargetsIfNeeded__block_invoke_cold_1(v9, v3);
  }

  return v4 ^ 1u;
}

- (void)_compareRenderedTextWithCompletion:(id)a3
{
  id v4;
  dispatch_group_t v5;
  NSMutableArray *targetingResults;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  id v10;
  id location;

  v4 = a3;
  v5 = dispatch_group_create();
  objc_initWeak(&location, self);
  targetingResults = self->_targetingResults;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__WBSScribbleValidator__compareRenderedTextWithCompletion___block_invoke;
  v8[3] = &unk_1E5443840;
  v7 = v5;
  v9 = v7;
  objc_copyWeak(&v10, &location);
  -[NSMutableArray enumerateObjectsUsingBlock:](targetingResults, "enumerateObjectsUsingBlock:", v8);
  dispatch_group_notify(v7, MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __59__WBSScribbleValidator__compareRenderedTextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__WBSScribbleValidator__compareRenderedTextWithCompletion___block_invoke_2;
  v5[3] = &unk_1E5443818;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = *(id *)(a1 + 32);
  v4 = v3;
  v7 = v4;
  objc_msgSend(v4, "hasSimilarRenderedText:", v5);

  objc_destroyWeak(&v8);
}

void __59__WBSScribbleValidator__compareRenderedTextWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    goto LABEL_11;
  v5 = WBS_LOG_CHANNEL_PREFIXScribble();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __59__WBSScribbleValidator__compareRenderedTextWithCompletion___block_invoke_2_cold_1(a2, a1, v5);
    if (a2)
    {
LABEL_4:
      objc_msgSend(*(id *)(a1 + 40), "target");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isInVisibilityAdjustmentSubtree");

      if ((v7 & 1) == 0)
      {
        v10 = (void *)WeakRetained[5];
        goto LABEL_10;
      }
    }
  }
  else if (a2)
  {
    goto LABEL_4;
  }
  if (objc_msgSend(MEMORY[0x1E0D8A120], "scribbleRequiresVisualSimilarity"))
  {
    if ((a2 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "target");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isInVisibilityAdjustmentSubtree");

      if (v9)
      {
        v10 = (void *)WeakRetained[6];
LABEL_10:
        objc_msgSend(*(id *)(a1 + 40), "target");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

      }
    }
  }
LABEL_11:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetsToReveal, 0);
  objc_storeStrong((id *)&self->_targetsToHide, 0);
  objc_storeStrong((id *)&self->_targetingResults, 0);
  objc_storeStrong((id *)&self->_targetsToExclude, 0);
  objc_storeStrong((id *)&self->_elementsToValidate, 0);
  objc_destroyWeak((id *)&self->_webView);
}

- (void)_validateElementsWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a2;
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0_3(&dword_1A840B000, v4, v5, "Validating %zu scribble element(s)", v6, v7, v8, v9, 0);

  OUTLINED_FUNCTION_2_1();
}

void __63__WBSScribbleValidator__validateElementsWithCompletionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a2;
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0_3(&dword_1A840B000, v4, v5, "- Found %zu potentially similar target(s)", v6, v7, v8, v9, 0);

  OUTLINED_FUNCTION_2_1();
}

void __63__WBSScribbleValidator__validateElementsWithCompletionHandler___block_invoke_29_cold_1(os_log_t log, double a2, double a3)
{
  int v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = (a2 - a3) * 1000.0;
  _os_log_debug_impl(&dword_1A840B000, log, OS_LOG_TYPE_DEBUG, "- Finished validation in %.0f ms", (uint8_t *)&v3, 0xCu);
}

void __59__WBSScribbleValidator__removeHiddenResultsWithSimilarURLs__block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a1;
  objc_msgSend(a2, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A840B000, v6, v7, "- Found similar URLs: %{private}@", v8, v9, v10, v11, 3u);

  OUTLINED_FUNCTION_2_0();
}

void __83__WBSScribbleValidator__removeResultsWithDifferentGeometryAndRevealTargetsIfNeeded__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isInVisibilityAdjustmentSubtree"))
    v5 = CFSTR(" (hidden)");
  else
    v5 = &stru_1E5449658;
  objc_msgSend(a2, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412547;
  v10 = v5;
  v11 = 2113;
  v12 = v7;
  OUTLINED_FUNCTION_1_3(&dword_1A840B000, v3, v8, "- Found different geometry%@: %{private}@", (uint8_t *)&v9);

}

void __59__WBSScribbleValidator__compareRenderedTextWithCompletion___block_invoke_2_cold_1(char a1, uint64_t a2, void *a3)
{
  const __CFString *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((a1 & 1) != 0)
    v3 = CFSTR("similar text");
  else
    v3 = CFSTR("different text");
  v4 = *(void **)(a2 + 40);
  v5 = a3;
  objc_msgSend(v4, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412547;
  v10 = v3;
  v11 = 2113;
  v12 = v7;
  OUTLINED_FUNCTION_1_3(&dword_1A840B000, v5, v8, "- Found %@: %{private}@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_2_0();
}

@end
