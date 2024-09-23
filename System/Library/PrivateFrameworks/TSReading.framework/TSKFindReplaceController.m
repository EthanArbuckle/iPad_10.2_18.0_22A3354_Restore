@implementation TSKFindReplaceController

- (void)setDocumentRootProvider:(id)a3
{
  if (self->_documentRootProvider != a3)
  {
    self->_documentRootProvider = (TSKDocumentRootProvider *)a3;
    -[TSKFindReplaceController p_stopCountingHits](self, "p_stopCountingHits");
  }
}

- (TSKFindReplaceController)initWithDocumentRootProvider:(id)a3 delegate:(id)a4
{
  return -[TSKFindReplaceController initWithDocumentRootProvider:delegate:targetProvider:onlySearchesAnnotations:](self, "initWithDocumentRootProvider:delegate:targetProvider:onlySearchesAnnotations:", a3, a4, 0, 0);
}

- (TSKFindReplaceController)initWithDocumentRootProvider:(id)a3 delegate:(id)a4 onlySearchesAnnotations:(BOOL)a5
{
  return -[TSKFindReplaceController initWithDocumentRootProvider:delegate:targetProvider:onlySearchesAnnotations:](self, "initWithDocumentRootProvider:delegate:targetProvider:onlySearchesAnnotations:", a3, a4, objc_msgSend(a3, "documentRoot"), a5);
}

- (TSKFindReplaceController)initWithDocumentRootProvider:(id)a3 delegate:(id)a4 targetProvider:(id)a5 onlySearchesAnnotations:(BOOL)a6
{
  TSKFindReplaceController *v10;
  TSKFindReplaceController *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSKFindReplaceController;
  v10 = -[TSKFindReplaceController init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    -[TSKFindReplaceController setDocumentRootProvider:](v10, "setDocumentRootProvider:", a3);
    -[TSKFindReplaceController setLayoutSearchResults:](v11, "setLayoutSearchResults:", objc_msgSend(MEMORY[0x24BDBCEB8], "array"));
    -[TSKFindReplaceController setAnnotationDisplayStringTypes:](v11, "setAnnotationDisplayStringTypes:", objc_msgSend(MEMORY[0x24BDBCEF0], "set"));
    v11->_searchTargetProvider = (TSKSearchTargetProvider *)a5;
    -[TSKFindReplaceController setLayoutSearchCountForRootIndexMap:](v11, "setLayoutSearchCountForRootIndexMap:", objc_msgSend(MEMORY[0x24BDBCED8], "dictionary"));
    v11->_findReplaceDelegate = (TSKFindReplaceDelegate *)a4;
    v11->_searchOptions = 16;
    v11->_countSearchHits = 1;
    -[TSKFindReplaceController setSearchResultComparator:](v11, "setSearchResultComparator:", &__block_literal_global_17);
    v12 = (void *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    if ((objc_msgSend(v12, "BOOLForKey:", CFSTR("FindReplaceMatchCaseKey")) & 1) == 0)
      v11->_searchOptions |= 1uLL;
    if (objc_msgSend(v12, "BOOLForKey:", CFSTR("FindReplaceWholeWordsKey")))
      v11->_searchOptions |= 8uLL;
    v11->_onlySearchesAnnotations = a6;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[TSKFindReplaceController setLayoutSearchResults:](self, "setLayoutSearchResults:", 0);
  -[TSKFindReplaceController setLayoutSearchCountForRootIndexMap:](self, "setLayoutSearchCountForRootIndexMap:", 0);
  -[TSKFindReplaceController setAnnotationDisplayStringTypes:](self, "setAnnotationDisplayStringTypes:", 0);

  v3.receiver = self;
  v3.super_class = (Class)TSKFindReplaceController;
  -[TSKFindReplaceController dealloc](&v3, sel_dealloc);
}

- (void)setSearchProgressBlock:(id)a3
{
  if (-[TSKFindReplaceController progressBlock](self, "progressBlock") != a3)
  {
    -[TSKFindReplaceController p_stopCountingHits](self, "p_stopCountingHits");
    -[TSKFindReplaceController setProgressBlock:](self, "setProgressBlock:", a3);
    if (-[TSKFindReplaceController progressBlock](self, "progressBlock"))
      -[TSKFindReplaceController p_startCountingHits](self, "p_startCountingHits");
  }
}

- (void)setSearchOptions:(unint64_t)a3
{
  void *v5;

  if (self->_searchOptions != a3)
  {
    self->_searchOptions = a3;
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    objc_msgSend(v5, "setBool:forKey:", (a3 & 1) == 0, CFSTR("FindReplaceMatchCaseKey"));
    objc_msgSend(v5, "setBool:forKey:", (a3 >> 3) & 1, CFSTR("FindReplaceWholeWordsKey"));
    -[TSKFindReplaceController invalidateSearchResults](self, "invalidateSearchResults");
  }
}

- (unint64_t)searchResultsCount
{
  unint64_t v3;
  unint64_t result;

  v3 = -[NSMutableArray count](-[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults"), "count");
  result = self->_searchResultsCount;
  if (v3 > result)
    return -[NSMutableArray count](-[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults"), "count");
  return result;
}

- (void)setSearchResultComparator:(id)a3
{
  id v3;
  id searchResultComparator;

  if (a3)
    v3 = a3;
  else
    v3 = &__block_literal_global_17;
  searchResultComparator = self->_searchResultComparator;
  if (v3 != searchResultComparator)
  {

    self->_searchResultComparator = (id)objc_msgSend(v3, "copy");
  }
}

- (id)documentRoot
{
  return (id)-[TSKDocumentRootProvider documentRoot](-[TSKFindReplaceController documentRootProvider](self, "documentRootProvider"), "documentRoot");
}

- (void)setCommentsIncludedInAnnotationSearch:(BOOL)a3
{
  self->_commentsIncludedInAnnotationSearch = a3;
  -[TSKFindReplaceController invalidateSearchResults](self, "invalidateSearchResults");
}

- (BOOL)p_shouldCountAnnotation:(id)a3
{
  void *v5;
  uint64_t v6;

  if (a3)
    return objc_msgSend(a3, "annotationType") != 1 || self->_commentsIncludedInAnnotationSearch;
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKFindReplaceController p_shouldCountAnnotation:]");
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 251, CFSTR("invalid nil value for '%s'"), "annotation");
  return 0;
}

- (BOOL)p_searchCriteriaIsValid
{
  return -[NSString length](-[TSKFindReplaceController searchString](self, "searchString"), "length")
      || self->_onlySearchesAnnotations;
}

- (void)p_continueCountingHits
{
  void *v3;
  uint64_t v4;
  TSKSearchable *currentSearchable;
  _BOOL4 v6;
  id v7;
  char v8;
  char v9;
  char v10;
  void *v11;
  uint64_t v12;
  TSKSearchable *v13;
  void *v14;
  TSKSearchable *v15;
  NSString *v16;
  unint64_t v17;
  TSKSearch *currentSearch;
  _BOOL4 v19;
  TSKSearch *v20;
  uint64_t v21;
  void (**v22)(id, unint64_t, uint64_t);
  _QWORD block[5];
  _QWORD v24[5];
  _QWORD v25[5];

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKFindReplaceController p_continueCountingHits]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 319, CFSTR("This operation must only be performed on the main thread."));
  }
  if (self->_currentModelEnumerator
    && -[TSKFindReplaceController p_searchCriteriaIsValid](self, "p_searchCriteriaIsValid"))
  {
    currentSearchable = self->_currentSearchable;
    if (currentSearchable)
    {
      v6 = 0;
    }
    else
    {
      v7 = -[NSEnumerator nextObject](self->_currentModelEnumerator, "nextObject");
      v6 = v7 == 0;
      if (v7)
      {
        currentSearchable = (TSKSearchable *)TSUProtocolCast();
        self->_currentSearchable = currentSearchable;
        if (!currentSearchable)
          goto LABEL_29;
      }
      else
      {
        currentSearchable = self->_currentSearchable;
        if (!currentSearchable)
          goto LABEL_29;
      }
    }
    if (self->_currentSearch)
    {
      if (self->_onlySearchesAnnotations)
        -[TSKSearchable continueAnnotationSearch:](currentSearchable, "continueAnnotationSearch:");
      else
        -[TSKSearchable continueSearch:](currentSearchable, "continueSearch:");
LABEL_25:
      currentSearch = self->_currentSearch;
      if (!currentSearch)
        goto LABEL_31;
LABEL_26:
      v19 = -[TSKSearch isComplete](currentSearch, "isComplete");
      v20 = self->_currentSearch;
      if (v19)
      {

        self->_currentSearch = 0;
        goto LABEL_31;
      }
      if (v20)
      {
LABEL_29:
        if (v6)
        {
LABEL_32:

          self->_currentModelEnumerator = 0;
          v21 = 1;
LABEL_33:
          if (-[TSKFindReplaceController progressBlock](self, "progressBlock"))
          {
            v22 = -[TSKFindReplaceController progressBlock](self, "progressBlock");
            v22[2](v22, self->_searchResultsCount, v21);
          }
          return;
        }
LABEL_30:
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __50__TSKFindReplaceController_p_continueCountingHits__block_invoke_3;
        block[3] = &unk_24D829278;
        block[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
        v21 = 0;
        goto LABEL_33;
      }
LABEL_31:
      self->_currentSearchable = 0;
      if (v6)
        goto LABEL_32;
      goto LABEL_30;
    }
    v8 = objc_opt_respondsToSelector();
    v9 = objc_opt_respondsToSelector();
    v10 = v9;
    if ((v8 & 1) == 0 && (v9 & 1) == 0)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKFindReplaceController p_continueCountingHits]");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 347, CFSTR("Every searchable should respond to atleast a string search or an annotation search"));
    }
    if (self->_onlySearchesAnnotations)
    {
      if ((v10 & 1) == 0)
        goto LABEL_25;
      v13 = self->_currentSearchable;
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __50__TSKFindReplaceController_p_continueCountingHits__block_invoke_2;
      v24[3] = &unk_24D82ACA8;
      v24[4] = self;
      v14 = (void *)-[TSKSearchable searchForAnnotationsWithHitBlock:](v13, "searchForAnnotationsWithHitBlock:", v24);
    }
    else
    {
      if ((v8 & 1) == 0)
        goto LABEL_25;
      v15 = self->_currentSearchable;
      v16 = -[TSKFindReplaceController searchString](self, "searchString");
      v17 = -[TSKFindReplaceController searchOptions](self, "searchOptions");
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __50__TSKFindReplaceController_p_continueCountingHits__block_invoke;
      v25[3] = &unk_24D82ACA8;
      v25[4] = self;
      v14 = (void *)-[TSKSearchable searchForString:options:onHit:](v15, "searchForString:options:onHit:", v16, v17, v25);
    }
    currentSearch = v14;
    self->_currentSearch = currentSearch;
    if (!currentSearch)
      goto LABEL_31;
    goto LABEL_26;
  }
}

uint64_t __50__TSKFindReplaceController_p_continueCountingHits__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

uint64_t __50__TSKFindReplaceController_p_continueCountingHits__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "p_shouldCountAnnotation:", objc_msgSend(a2, "annotation"));
  if ((_DWORD)result)
  {
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend((id)objc_msgSend(a2, "annotation"), "annotationDisplayStringType")));
  }
  return result;
}

uint64_t __50__TSKFindReplaceController_p_continueCountingHits__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_continueCountingHits");
}

- (void)p_stopCountingHits
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKFindReplaceController p_stopCountingHits]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 414, CFSTR("This operation must only be performed on the main thread."));
  }
  self->_searchResultsCount = 0;

  self->_currentModelEnumerator = 0;
  self->_currentSearch = 0;
}

- (void)p_startCountingHits
{
  void *v3;
  uint64_t v4;
  _QWORD block[5];

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKFindReplaceController p_startCountingHits]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 423, CFSTR("This operation must only be performed on the main thread."));
  }
  self->_currentSearchable = 0;
  self->_currentModelEnumerator = (NSEnumerator *)(id)objc_msgSend(-[TSKFindReplaceController documentRoot](self, "documentRoot"), "modelEnumeratorWithFlags:", 1);
  self->_searchResultsCount = 0;
  -[NSMutableSet removeAllObjects](self->_annotationDisplayStringTypes, "removeAllObjects");
  self->_currentSearchStartTime = CFAbsoluteTimeGetCurrent();
  if (self->_currentModelEnumerator)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__TSKFindReplaceController_p_startCountingHits__block_invoke;
    block[3] = &unk_24D829278;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __47__TSKFindReplaceController_p_startCountingHits__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_continueCountingHits");
}

+ (void)_recursiveSearchWithSearchTarget:(id)a3 forString:(id)a4 options:(unint64_t)a5 hitBlock:(id)a6
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_assertSearchTargetImplementsProperMethods:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a3, "layoutSearchForString:options:hitBlock:", a4, a5, a6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = (void *)objc_msgSend(a3, "childSearchTargets", 0);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(a1, "_recursiveSearchWithSearchTarget:forString:options:hitBlock:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), a4, a5, a6);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }
  }
}

+ (void)_recursiveSearchWithSearchTarget:(id)a3 forAnnotationsWithHitBlock:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_assertSearchTargetImplementsProperMethods:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a3, "layoutSearchForAnnotationWithHitBlock:", a4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = (void *)objc_msgSend(a3, "childAnnotationSearchTargets");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(a1, "_recursiveSearchWithSearchTarget:forAnnotationsWithHitBlock:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), a4);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = (void *)objc_msgSend(a3, "childSearchTargets", 0);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(a1, "_recursiveSearchWithSearchTarget:forAnnotationsWithHitBlock:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), a4);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }
  }
}

- (id)searchReferencesToHighlightInVisibleRootObjectRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  uint64_t v7;
  TSKSearchTargetProvider *v8;
  _QWORD v10[6];

  length = a3.length;
  location = a3.location;
  v6 = (void *)objc_msgSend(MEMORY[0x24BEB3CE0], "dictionary");
  if (-[TSKFindReplaceController searchString](self, "searchString")
    && -[NSString length](-[TSKFindReplaceController searchString](self, "searchString"), "length")
    && location < location + length)
  {
    v7 = MEMORY[0x24BDAC760];
    do
    {
      v8 = -[TSKFindReplaceController searchTargetProvider](self, "searchTargetProvider");
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __80__TSKFindReplaceController_searchReferencesToHighlightInVisibleRootObjectRange___block_invoke;
      v10[3] = &unk_24D82ACD0;
      v10[4] = self;
      v10[5] = v6;
      -[TSKSearchTargetProvider withRootSearchTargetAtIndex:executeBlock:](v8, "withRootSearchTargetAtIndex:executeBlock:", location++, v10);
      --length;
    }
    while (length);
  }
  return v6;
}

uint64_t __80__TSKFindReplaceController_searchReferencesToHighlightInVisibleRootObjectRange___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];

  v4 = (void *)objc_opt_class();
  v5 = objc_msgSend(*(id *)(a1 + 32), "searchString");
  v6 = objc_msgSend(*(id *)(a1 + 32), "searchOptions");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __80__TSKFindReplaceController_searchReferencesToHighlightInVisibleRootObjectRange___block_invoke_2;
  v8[3] = &unk_24D82ACA8;
  v8[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v4, "_recursiveSearchWithSearchTarget:forString:options:hitBlock:", a2, v5, v6, v8);
}

uint64_t __80__TSKFindReplaceController_searchReferencesToHighlightInVisibleRootObjectRange___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;

  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", objc_msgSend(a2, "model"));
  if (!v4)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    objc_msgSend(*(id *)(a1 + 32), "setObject:forUncopiedKey:", v4, objc_msgSend(a2, "model"));
  }
  return objc_msgSend(v4, "addObject:", a2);
}

- (void)invalidateSearchResults
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKFindReplaceController invalidateSearchResults]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 525, CFSTR("This operation must only be performed on the main thread."));
  }
  -[NSMutableArray removeAllObjects](-[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults"), "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_annotationDisplayStringTypes, "removeAllObjects");
  -[TSKFindReplaceController setCurrentRootSearchTargetRange:](self, "setCurrentRootSearchTargetRange:", *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8));
  if (self->_countSearchHits)
  {
    -[TSKFindReplaceController p_stopCountingHits](self, "p_stopCountingHits");
    if (-[TSKFindReplaceController progressBlock](self, "progressBlock"))
    {
      if (-[TSKFindReplaceController p_searchCriteriaIsValid](self, "p_searchCriteriaIsValid"))
        -[TSKFindReplaceController p_startCountingHits](self, "p_startCountingHits");
    }
  }
}

- (void)sortLayoutSearchResultsArray:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_97);
}

- (void)_buildLayoutSearchResultsForRootSearchTargetsInRange:(_NSRange)a3 resultsArray:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  uint64_t v17;
  _QWORD v18[6];

  length = a3.length;
  location = a3.location;
  if (a3.location != -[TSKFindReplaceController currentRootSearchTargetRange](self, "currentRootSearchTargetRange")
    || length != v8)
  {
    -[TSKFindReplaceController setCurrentRootSearchTargetRange:](self, "setCurrentRootSearchTargetRange:", location, length);
    objc_msgSend(a4, "removeAllObjects");
    if (self->_onlySearchesAnnotations)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __94__TSKFindReplaceController__buildLayoutSearchResultsForRootSearchTargetsInRange_resultsArray___block_invoke;
      v18[3] = &unk_24D82AD38;
      v18[4] = self;
      v18[5] = a4;
      v17 = MEMORY[0x24BDAC760];
      v9 = v18;
      v10 = __94__TSKFindReplaceController__buildLayoutSearchResultsForRootSearchTargetsInRange_resultsArray___block_invoke_2;
      v11 = &v17;
    }
    else
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __94__TSKFindReplaceController__buildLayoutSearchResultsForRootSearchTargetsInRange_resultsArray___block_invoke_3;
      v16[3] = &unk_24D82ACA8;
      v16[4] = self;
      v15 = MEMORY[0x24BDAC760];
      v9 = v16;
      v10 = __94__TSKFindReplaceController__buildLayoutSearchResultsForRootSearchTargetsInRange_resultsArray___block_invoke_4;
      v11 = &v15;
    }
    v11[1] = 3221225472;
    v11[2] = (uint64_t)v10;
    v11[3] = (uint64_t)&unk_24D82AD60;
    v11[4] = (uint64_t)self;
    v11[5] = (uint64_t)v9;
    if (location < location + length)
    {
      do
      {
        v12 = objc_msgSend(a4, "count");
        -[TSKSearchTargetProvider withRootSearchTargetAtIndex:executeBlock:](-[TSKFindReplaceController searchTargetProvider](self, "searchTargetProvider"), "withRootSearchTargetAtIndex:executeBlock:", location, v11);
        v13 = objc_msgSend(a4, "count");
        v14 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", location);
        -[NSMutableDictionary setObject:forKey:](-[TSKFindReplaceController layoutSearchCountForRootIndexMap](self, "layoutSearchCountForRootIndexMap"), "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13 - v12), v14);
        ++location;
        --length;
      }
      while (length);
    }
    -[TSKFindReplaceController sortLayoutSearchResultsArray:](self, "sortLayoutSearchResultsArray:", a4);
  }
}

uint64_t __94__TSKFindReplaceController__buildLayoutSearchResultsForRootSearchTargetsInRange_resultsArray___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v5;
  uint64_t v6;

  result = objc_msgSend(*(id *)(a1 + 32), "p_shouldCountAnnotation:", objc_msgSend(a2, "annotation"));
  if ((_DWORD)result)
  {
    objc_msgSend(a2, "searchReferencePoint");
    if ((TSUPointIsFinite() & 1) == 0)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKFindReplaceController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:]_block_invoke");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 564, CFSTR("the hit reference should have a valid point"));
    }
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
  }
  return result;
}

uint64_t __94__TSKFindReplaceController__buildLayoutSearchResultsForRootSearchTargetsInRange_resultsArray___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_opt_class(), "_recursiveSearchWithSearchTarget:forAnnotationsWithHitBlock:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __94__TSKFindReplaceController__buildLayoutSearchResultsForRootSearchTargetsInRange_resultsArray___block_invoke_3(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t result;

  objc_msgSend(a2, "searchReferencePoint");
  if ((TSUPointIsFinite() & 1) == 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKFindReplaceController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:]_block_invoke_3");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 575, CFSTR("the hit reference should have a valid point"));
  }
  objc_msgSend(*(id *)(a1 + 32), "findReplaceDelegate");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layoutSearchResults"), "addObject:", a2);
  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "findReplaceDelegate"), "findReplaceController:shouldSkipSearchReference:", *(_QWORD *)(a1 + 32), a2);
  if ((result & 1) == 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layoutSearchResults"), "addObject:", a2);
  return result;
}

uint64_t __94__TSKFindReplaceController__buildLayoutSearchResultsForRootSearchTargetsInRange_resultsArray___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_opt_class(), "_recursiveSearchWithSearchTarget:forString:options:hitBlock:", a2, objc_msgSend(*(id *)(a1 + 32), "searchString"), objc_msgSend(*(id *)(a1 + 32), "searchOptions"), *(_QWORD *)(a1 + 40));
}

- (unint64_t)_nextRootSearchTargetFromIndex:(unint64_t)a3 inDirection:(unint64_t)a4 wrapped:(BOOL *)a5
{
  TSKSearchTargetProvider *v9;
  NSString *v10;
  unint64_t result;
  BOOL v12;
  _BOOL4 v13;

  while (1)
  {
    v9 = -[TSKFindReplaceController searchTargetProvider](self, "searchTargetProvider");
    v10 = self->_onlySearchesAnnotations ? 0 : -[TSKFindReplaceController searchString](self, "searchString");
    result = -[TSKSearchTargetProvider nextRootSearchTargetIndexFromIndex:forString:options:inDirection:](v9, "nextRootSearchTargetIndexFromIndex:forString:options:inDirection:", a3, v10, -[TSKFindReplaceController searchOptions](self, "searchOptions"), a4);
    v12 = a3 == 0x7FFFFFFFFFFFFFFFLL && result == 0x7FFFFFFFFFFFFFFFLL;
    v13 = v12;
    if (v12 || result != 0x7FFFFFFFFFFFFFFFLL)
      break;
    *a5 = 1;
    a3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v13)
    return 0;
  return result;
}

- (void)_nextSearchTargetWithMatchInDirection:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v5 = (void *)MEMORY[0x24BDD1698];
  v6 = -[TSKFindReplaceController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
  for (i = (void *)objc_msgSend(v5, "indexSetWithIndexesInRange:", v6, v7);
        ;
        objc_msgSend(i, "addIndexesInRange:", v18, v19))
  {
    v9 = -[TSKFindReplaceController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
    v11 = v10 - 1;
    if (a3)
      v11 = 0;
    v20 = 0;
    v12 = -[TSKFindReplaceController _nextRootSearchTargetFromIndex:inDirection:wrapped:](self, "_nextRootSearchTargetFromIndex:inDirection:wrapped:", v9 + v11, a3, &v20);
    v13 = -[TSKFindReplaceController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
    if (v12 < v13 || v12 - v13 >= v14)
      -[TSKFindReplaceController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v12, 1, -[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults"));
    if (-[NSMutableArray count](-[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults"), "count"))
      break;
    v16 = -[TSKFindReplaceController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
    if (objc_msgSend(i, "containsIndexesInRange:", v16, v17))
    {
      -[TSKFindReplaceController findReplaceDelegate](self, "findReplaceDelegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[TSKFindReplaceDelegate findReplaceControllerDidFindNoResults:](-[TSKFindReplaceController findReplaceDelegate](self, "findReplaceDelegate"), "findReplaceControllerDidFindNoResults:", self);
      return;
    }
    v18 = -[TSKFindReplaceController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
  }
  if (v20)
  {
    -[TSKFindReplaceController findReplaceDelegate](self, "findReplaceDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TSKFindReplaceDelegate findReplaceController:didWrapInDirection:](-[TSKFindReplaceController findReplaceDelegate](self, "findReplaceDelegate"), "findReplaceController:didWrapInDirection:", self, a3);
  }
}

- (id)_firstResultInDirection:(unint64_t)a3
{
  id result;
  NSMutableArray *v6;

  result = (id)-[NSMutableArray count](-[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults"), "count");
  if (result)
  {
    v6 = -[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults");
    if (a3)
      return (id)-[NSMutableArray lastObject](v6, "lastObject");
    else
      return (id)-[NSMutableArray objectAtIndex:](v6, "objectAtIndex:", 0);
  }
  return result;
}

- (id)_lastResultInDirection:(unint64_t)a3
{
  id result;
  NSMutableArray *v6;

  result = (id)-[NSMutableArray count](-[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults"), "count");
  if (result)
  {
    v6 = -[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults");
    if (a3)
      return (id)-[NSMutableArray objectAtIndex:](v6, "objectAtIndex:", 0);
    else
      return (id)-[NSMutableArray lastObject](v6, "lastObject");
  }
  return result;
}

- (void)p_buildSearchResultsIfNecessary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  v3 = -[TSKFindReplaceController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
  if (v3 == *MEMORY[0x24BEB3BF0] && v4 == *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8))
  {
    v6 = -[TSKFindReplaceDelegate visibleRootIndexRange](-[TSKFindReplaceController findReplaceDelegate](self, "findReplaceDelegate"), "visibleRootIndexRange");
    -[TSKFindReplaceController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v6, v7, -[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults"));
  }
}

- (void)p_buildVisibleSearchResultsIfNecessary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[TSKFindReplaceController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
  v5 = v4;
  if (v3 != -[TSKFindReplaceDelegate visibleRootIndexRange](-[TSKFindReplaceController findReplaceDelegate](self, "findReplaceDelegate"), "visibleRootIndexRange")|| v5 != v6)
  {
    v7 = -[TSKFindReplaceDelegate visibleRootIndexRange](-[TSKFindReplaceController findReplaceDelegate](self, "findReplaceDelegate"), "visibleRootIndexRange");
    -[TSKFindReplaceController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v7, v8, -[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults"));
  }
}

- (id)firstVisibleResultInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[9];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = 0;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = -[TSKFindReplaceDelegate visibleRootIndexRange](-[TSKFindReplaceController findReplaceDelegate](self, "findReplaceDelegate"), "visibleRootIndexRange");
  -[TSKFindReplaceController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v9, v10, v8);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__TSKFindReplaceController_firstVisibleResultInRect___block_invoke;
  v13[3] = &unk_24D82AD88;
  *(CGFloat *)&v13[5] = x;
  *(CGFloat *)&v13[6] = y;
  *(CGFloat *)&v13[7] = width;
  *(CGFloat *)&v13[8] = height;
  v13[4] = &v14;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

  v11 = (void *)v15[5];
  _Block_object_dispose(&v14, 8);
  return v11;
}

BOOL __53__TSKFindReplaceController_firstVisibleResultInRect___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  CGFloat v7;
  CGFloat v8;
  _BOOL8 result;
  CGPoint v10;

  objc_msgSend(a2, "searchReferencePoint");
  v10.x = v7;
  v10.y = v8;
  result = CGRectContainsPoint(*(CGRect *)(a1 + 40), v10);
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

- (id)annotationSearchReferenceForAnnotation:(id)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[TSKFindReplaceController p_buildSearchResultsIfNecessary](self, "p_buildSearchResultsIfNecessary");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = -[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults");
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
      if ((objc_msgSend((id)objc_msgSend(v10, "annotation"), "isEqual:", a3) & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
    if (v10)
      return v10;
  }
LABEL_11:
  -[TSKFindReplaceController p_buildVisibleSearchResultsIfNecessary](self, "p_buildVisibleSearchResultsIfNecessary");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = -[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults", 0);
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (!v12)
    return 0;
  v13 = v12;
  v14 = *(_QWORD *)v18;
LABEL_13:
  v15 = 0;
  while (1)
  {
    if (*(_QWORD *)v18 != v14)
      objc_enumerationMutation(v11);
    v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
    if ((objc_msgSend((id)objc_msgSend(v10, "annotation"), "isEqual:", a3) & 1) != 0)
      return v10;
    if (v13 == ++v15)
    {
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      v10 = 0;
      if (v13)
        goto LABEL_13;
      return v10;
    }
  }
}

- (unint64_t)indexOfVisibleSearchReference:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (!a3)
    return 0;
  v4 = -[NSMutableArray indexOfObject:](-[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults"), "indexOfObject:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    return v4
         + -[TSKFindReplaceController _resultCountInRootObjectRange:](self, "_resultCountInRootObjectRange:", 0, -[TSKFindReplaceController currentRootSearchTargetRange](self, "currentRootSearchTargetRange"))+ 1;
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKFindReplaceController indexOfVisibleSearchReference:]");
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 797, CFSTR("Could not find searchReference in current root search target range"));
  return 0;
}

- (unint64_t)_resultCountInRootObjectRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  length = a3.length;
  location = a3.location;
  v6 = -[TSKFindReplaceController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
  v15 = v7;
  v16 = v6;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (location >= location + length)
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    do
    {
      v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", location);
      if (!-[NSMutableDictionary objectForKey:](-[TSKFindReplaceController layoutSearchCountForRootIndexMap](self, "layoutSearchCountForRootIndexMap"), "objectForKey:", v10))-[TSKFindReplaceController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", location, 1, v8);
      v11 = (void *)-[NSMutableDictionary objectForKey:](-[TSKFindReplaceController layoutSearchCountForRootIndexMap](self, "layoutSearchCountForRootIndexMap"), "objectForKey:", v10);
      if (v11)
      {
        v9 += (int)objc_msgSend(v11, "intValue");
      }
      else
      {
        v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKFindReplaceController _resultCountInRootObjectRange:]");
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 825, CFSTR("invalid nil value for '%s'"), "rootCount");
      }
      ++location;
      --length;
    }
    while (length);
  }
  -[TSKFindReplaceController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v16, v15, v8);

  return v9;
}

- (id)searchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4
{
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v14;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;

  -[TSKFindReplaceController p_buildSearchResultsIfNecessary](self, "p_buildSearchResultsIfNecessary");
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  v21 = 0;
  if (!a3)
  {
    if (!-[NSMutableArray count](-[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults"), "count"))
      -[TSKFindReplaceController _nextSearchTargetWithMatchInDirection:](self, "_nextSearchTargetWithMatchInDirection:", a4);
    goto LABEL_8;
  }
  v7 = -[NSMutableArray indexOfObject:](-[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults"), "indexOfObject:", a3);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
      v9 = 0;
    else
      v9 = -[NSMutableArray count](-[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults"), "count")- 1;
    if (v7 == v9)
    {
      -[TSKFindReplaceController _nextSearchTargetWithMatchInDirection:](self, "_nextSearchTargetWithMatchInDirection:", a4);
      v8 = -[TSKFindReplaceController _firstResultInDirection:](self, "_firstResultInDirection:", a4);
    }
    else
    {
      v10 = -[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults");
      if (a4)
        v11 = v7 - 1;
      else
        v11 = v7 + 1;
      v8 = (id)-[NSMutableArray objectAtIndex:](v10, "objectAtIndex:", v11);
    }
    goto LABEL_21;
  }
  if (!-[NSMutableArray count](-[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults"), "count"))
    -[TSKFindReplaceController _nextSearchTargetWithMatchInDirection:](self, "_nextSearchTargetWithMatchInDirection:", a4);
  if ((objc_msgSend((id)objc_opt_class(), "searchReference:isBeforeSearchReference:orEqual:inDirection:comparator:", a3, -[TSKFindReplaceController _firstResultInDirection:](self, "_firstResultInDirection:", a4), 0, a4, -[TSKFindReplaceController searchResultComparator](self, "searchResultComparator")) & 1) != 0)goto LABEL_8;
  if (objc_msgSend((id)objc_opt_class(), "searchReference:isAfterSearchReference:orEqual:inDirection:comparator:", a3, -[TSKFindReplaceController _lastResultInDirection:](self, "_lastResultInDirection:", a4), 1, a4, -[TSKFindReplaceController searchResultComparator](self, "searchResultComparator")))
  {
    -[TSKFindReplaceController _nextSearchTargetWithMatchInDirection:](self, "_nextSearchTargetWithMatchInDirection:", a4);
LABEL_8:
    v8 = -[TSKFindReplaceController _firstResultInDirection:](self, "_firstResultInDirection:", a4);
    goto LABEL_21;
  }
  v14 = -[TSKFindReplaceController layoutSearchResults](self, "layoutSearchResults");
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __70__TSKFindReplaceController_searchReferenceAfterReference_inDirection___block_invoke;
  v15[3] = &unk_24D82ADB0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = &v16;
  v15[7] = a4;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](v14, "enumerateObjectsWithOptions:usingBlock:", 2 * (a4 != 0), v15);
  v12 = (void *)v17[5];
  if (v12)
    goto LABEL_22;
  -[TSKFindReplaceController _nextSearchTargetWithMatchInDirection:](self, "_nextSearchTargetWithMatchInDirection:", a4);
  v8 = -[TSKFindReplaceController _firstResultInDirection:](self, "_firstResultInDirection:", a4);
LABEL_21:
  v12 = v8;
  v17[5] = (uint64_t)v8;
LABEL_22:
  _Block_object_dispose(&v16, 8);
  return v12;
}

uint64_t __70__TSKFindReplaceController_searchReferenceAfterReference_inDirection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "searchReference:isAfterSearchReference:orEqual:inDirection:comparator:", a2, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 32), "searchResultComparator"));
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

+ (BOOL)p_searchReference:(id)a3 comparedWithSearchReference:(id)a4 orEqual:(BOOL)a5 inDirection:(unint64_t)a6 before:(BOOL)a7 comparator:(id)a8
{
  _BOOL4 v8;
  uint64_t v11;

  v8 = a7;
  v11 = (*((uint64_t (**)(id, id, id))a8 + 2))(a8, a3, a4);
  if (a6)
  {
    if (v8)
      goto LABEL_3;
  }
  else if (!v8)
  {
LABEL_3:
    if (v11 == 1)
      return v11;
    goto LABEL_7;
  }
  if (v11 == -1)
  {
    LOBYTE(v11) = 1;
    return v11;
  }
LABEL_7:
  if (v11)
    LOBYTE(v11) = 0;
  else
    LOBYTE(v11) = a5;
  return v11;
}

+ (BOOL)searchReference:(id)a3 isBeforeSearchReference:(id)a4 orEqual:(BOOL)a5 inDirection:(unint64_t)a6 comparator:(id)a7
{
  return objc_msgSend(a1, "p_searchReference:comparedWithSearchReference:orEqual:inDirection:before:comparator:", a3, a4, a5, a6, 1, a7);
}

+ (BOOL)searchReference:(id)a3 isAfterSearchReference:(id)a4 orEqual:(BOOL)a5 inDirection:(unint64_t)a6 comparator:(id)a7
{
  return objc_msgSend(a1, "p_searchReference:comparedWithSearchReference:orEqual:inDirection:before:comparator:", a3, a4, a5, a6, 0, a7);
}

- (NSMutableSet)annotationDisplayStringTypes
{
  return self->_annotationDisplayStringTypes;
}

- (void)setAnnotationDisplayStringTypes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BOOL)commentsIncludedInAnnotationSearch
{
  return self->_commentsIncludedInAnnotationSearch;
}

- (TSKFindReplaceDelegate)findReplaceDelegate
{
  return self->_findReplaceDelegate;
}

- (TSKSearchTargetProvider)searchTargetProvider
{
  return self->_searchTargetProvider;
}

- (TSKDocumentRootProvider)documentRootProvider
{
  return self->_documentRootProvider;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unint64_t)searchOptions
{
  return self->_searchOptions;
}

- (BOOL)countSearchHits
{
  return self->_countSearchHits;
}

- (void)setCountSearchHits:(BOOL)a3
{
  self->_countSearchHits = a3;
}

- (id)searchResultComparator
{
  return self->_searchResultComparator;
}

- (_NSRange)currentRootSearchTargetRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_currentRootSearchTargetRange.length;
  location = self->_currentRootSearchTargetRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setCurrentRootSearchTargetRange:(_NSRange)a3
{
  self->_currentRootSearchTargetRange = a3;
}

- (NSMutableArray)layoutSearchResults
{
  return self->_layoutSearchResults;
}

- (void)setLayoutSearchResults:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSMutableDictionary)layoutSearchCountForRootIndexMap
{
  return self->_layoutSearchCountForRootIndexMap;
}

- (void)setLayoutSearchCountForRootIndexMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

@end
