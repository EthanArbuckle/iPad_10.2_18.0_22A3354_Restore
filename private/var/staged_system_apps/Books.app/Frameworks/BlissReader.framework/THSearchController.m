@implementation THSearchController

- (THSearchController)initWithDocumentRoot:(id)a3
{
  THSearchController *v4;
  THSearchController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THSearchController;
  v4 = -[THSearchController init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->mDocumentRoot = (THDocumentRoot *)a3;
    v4->mRecentSearches = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v5;
}

- (void)p_setupDisplayPageNumberMap
{
  if (!-[THSearchController displayPageNumberMap](self, "displayPageNumberMap"))
  {
    -[THSearchController setDisplayPageNumberMap:](self, "setDisplayPageNumberMap:", objc_alloc_init(THDisplayPageNumberMap));
    if (-[THSearchController paginationResultsValid](self, "paginationResultsValid"))
      -[THSearchController updatePaginationResults](self, "updatePaginationResults");
  }
}

- (void)updatePaginationResults
{
  NSNotificationCenter *v3;

  -[THDisplayPageNumberMap buildDisplayPageMapsWithDocumentRoot:](-[THSearchController displayPageNumberMap](self, "displayPageNumberMap"), "buildDisplayPageMapsWithDocumentRoot:", self->mDocumentRoot);
  -[THSearchController setPaginationResultsValid:](self, "setPaginationResultsValid:", 1);
  if (-[THSearchController displayPageNumberMap](self, "displayPageNumberMap"))
  {
    -[THSearchController p_populatePageNumbersOfModelSearchResults:](self, "p_populatePageNumbersOfModelSearchResults:", -[THSearchController p_allSearchResults](self, "p_allSearchResults"));
    v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter postNotificationName:object:](v3, "postNotificationName:object:", THSearchControllerDidUpdatePaginationResultsNotification, self);
  }
}

- (void)invalidatePaginationResults
{
  NSNotificationCenter *v3;

  -[THDisplayPageNumberMap clearDisplayPageMapsWithDocumentRoot:](-[THSearchController displayPageNumberMap](self, "displayPageNumberMap"), "clearDisplayPageMapsWithDocumentRoot:", self->mDocumentRoot);
  -[THSearchController setPaginationResultsValid:](self, "setPaginationResultsValid:", 0);
  if (-[THSearchController displayPageNumberMap](self, "displayPageNumberMap"))
  {
    -[THSearchController p_populatePageNumbersOfModelSearchResults:](self, "p_populatePageNumbersOfModelSearchResults:", -[THSearchController p_allSearchResults](self, "p_allSearchResults"));
    v3 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter postNotificationName:object:](v3, "postNotificationName:object:", THSearchControllerDidUpdatePaginationResultsNotification, self);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[THSearchController clearSearchResults](self, "clearSearchResults");

  self->mRecentSearches = 0;
  self->mDisplayPageNumberMap = 0;

  self->mAnnotationReferenceTextMap = 0;
  v3.receiver = self;
  v3.super_class = (Class)THSearchController;
  -[THSearchController dealloc](&v3, "dealloc");
}

- (void)suggestionsForSearchString:(id)a3 completionBlock:(id)a4
{
  objc_sync_enter(self);
  -[THSearchController p_kickOffQuery:giveSuggestions:completionBlock:](self, "p_kickOffQuery:giveSuggestions:completionBlock:", a3, 1, a4);
  objc_sync_exit(self);
}

- (void)searchForString:(id)a3 completionBlock:(id)a4
{
  objc_sync_enter(self);
  -[THSearchController p_kickOffQuery:giveSuggestions:completionBlock:](self, "p_kickOffQuery:giveSuggestions:completionBlock:", a3, 0, a4);
  objc_sync_exit(self);
}

- (id)p_recentsEntryForTrimmedQuery:(id)a3 resultCount:(int64_t)a4
{
  return +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", a3, CFSTR("query"), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4), CFSTR("result count"), 0);
}

- (void)p_kickOffQuery:(id)a3 giveSuggestions:(BOOL)a4 completionBlock:(id)a5
{
  _QWORD v9[7];
  BOOL v10;

  objc_sync_enter(self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_BF268;
  v9[3] = &unk_4290B8;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a5;
  v10 = a4;
  _os_activity_initiate(&dword_0, "Search for string", OS_ACTIVITY_FLAG_DEFAULT, v9);
  objc_sync_exit(self);
}

- (void)setSearchRefText:(id)a3
{
  objc_sync_enter(self);
  self->mReferenceTextMap = (NSDictionary *)a3;
  objc_sync_exit(self);
}

- (void)setAnnotationSearchRefText:(id)a3
{
  objc_sync_enter(self);

  self->mAnnotationReferenceTextMap = 0;
  self->mAnnotationReferenceTextMap = (NSDictionary *)a3;
  objc_sync_exit(self);
}

- (void)p_processSuggestionsWithCompletionBlock:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  NSMutableArray *v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  _BOOL8 v18;
  NSMutableArray *v19;
  NSMutableArray *v20;
  signed int v21;
  id v22;
  unint64_t v23;
  NSArray *v24;
  NSArray *v25;
  id v26;
  id v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  objc_sync_enter(self);
  if (self->mCurrentQuery
    && self->mOccurrenceMap
    && (!-[THSearchController searchNotes](self, "searchNotes") || self->mAnnotationOccurrenceMap)
    && self->mReferenceTextMap)
  {
    v5 = -[THSearchIndex resultsForQuery:occurrenceMap:searchContextMap:suggestions:](-[THDocumentRoot searchIndex](self->mDocumentRoot, "searchIndex"), "resultsForQuery:occurrenceMap:searchContextMap:suggestions:", self->mCurrentQuery, self->mOccurrenceMap, self->mReferenceTextMap, 1);
    if (-[THSearchController searchNotes](self, "searchNotes"))
    {
      v6 = -[THSearchIndex resultsForQuery:occurrenceMap:searchContextMap:suggestions:](-[THDocumentRoot annotationSearchIndex](self->mDocumentRoot, "annotationSearchIndex"), "resultsForQuery:occurrenceMap:searchContextMap:suggestions:", self->mCurrentQuery, self->mAnnotationOccurrenceMap, self->mAnnotationReferenceTextMap, 1);
      v7 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v8 = objc_msgSend(v5, "setByAddingObjectsFromSet:", v6);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v30 != v10)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
            v13 = objc_msgSend(v7, "objectForKey:", objc_msgSend(v12, "term"));
            if (v13)
              objc_msgSend(v13, "setOccurenceCount:", (char *)objc_msgSend(v13, "occurenceCount") + (_QWORD)objc_msgSend(v12, "occurenceCount"));
            else
              objc_msgSend(v7, "setObject:forKey:", v12, objc_msgSend(v12, "term"));
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v9);
      }
      v14 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", objc_msgSend(v7, "allValues"));
    }
    else
    {
      v14 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", objc_msgSend(v5, "allObjects"));
    }
    v15 = v14;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_BFB90;
    v28[3] = &unk_427B40;
    v28[4] = self;
    -[NSMutableArray sortUsingComparator:](v14, "sortUsingComparator:", v28);
    v16 = -[THDisplayPageNumberMap preferredAbsolutePageIndexesForDisplayPageNumber:](-[THSearchController displayPageNumberMap](self, "displayPageNumberMap"), "preferredAbsolutePageIndexesForDisplayPageNumber:", self->mCurrentQuery);
    v17 = objc_msgSend(v16, "count");
    v18 = v17 != 0;
    v19 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v18);
    v20 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v18);
    if (v17)
    {
      v21 = objc_msgSend(objc_msgSend(v16, "objectAtIndex:", 0), "intValue");
      v22 = -[THDisplayPageNumberMap displayPageNumberForAbsolutePageIndex:](-[THSearchController displayPageNumberMap](self, "displayPageNumberMap"), "displayPageNumberForAbsolutePageIndex:", v21);
      -[NSMutableArray addObject:](v19, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@,%lu"), kTHSearchControllerPageNumberToken, v22, v21));
      -[NSMutableArray addObject:](v20, "addObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 1));
      v23 = 19;
    }
    else
    {
      v23 = 20;
    }
    if ((unint64_t)-[NSMutableArray count](v15, "count") > v23)
      -[NSMutableArray removeObjectsInRange:](v15, "removeObjectsInRange:", v23, (char *)-[NSMutableArray count](v15, "count") - v23);
    v24 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", -[NSMutableArray tsu_map:](v15, "tsu_map:", &stru_4290F8));
    v25 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", -[NSMutableArray tsu_map:](v15, "tsu_map:", &stru_429138));
    v26 = -[NSMutableArray arrayByAddingObjectsFromArray:](v19, "arrayByAddingObjectsFromArray:", v24);
    v27 = -[NSMutableArray arrayByAddingObjectsFromArray:](v20, "arrayByAddingObjectsFromArray:", v25);
    self->mSuggestionResults = (NSArray *)objc_msgSend(v26, "copy");
    self->mSuggestionOccurenceCounts = (NSArray *)objc_msgSend(v27, "copy");
    (*((void (**)(id))a3 + 2))(a3);

    self->mOccurrenceMap = 0;
    self->mAnnotationOccurrenceMap = 0;

    self->mReferenceTextMap = 0;
  }
  objc_sync_exit(self);
}

- (void)p_processSearchResultsWithCompletionBlock:(id)a3
{
  id v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  _UNKNOWN **v17;
  id v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  void *k;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  NSArray *mTopTextResults;
  id v34;
  uint64_t v35;
  void *m;
  NSArray *mTopMediaResults;
  id v38;
  uint64_t v39;
  void *n;
  NSArray *mTopNotesResults;
  id v42;
  uint64_t v43;
  void *ii;
  void (**v45)(void);
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];

  objc_sync_enter(self);
  if (self->mCurrentQuery
    && self->mOccurrenceMap
    && (!-[THSearchController searchNotes](self, "searchNotes") || self->mAnnotationOccurrenceMap)
    && self->mReferenceTextMap
    && (!-[THSearchController searchNotes](self, "searchNotes") || self->mAnnotationReferenceTextMap))
  {
    v5 = -[THSearchIndex resultsForQuery:occurrenceMap:searchContextMap:suggestions:](-[THDocumentRoot searchIndex](self->mDocumentRoot, "searchIndex"), "resultsForQuery:occurrenceMap:searchContextMap:suggestions:", self->mCurrentQuery, self->mOccurrenceMap, self->mReferenceTextMap, 0);
    -[THSearchController p_populatePageNumbersOfModelSearchResults:](self, "p_populatePageNumbersOfModelSearchResults:", objc_msgSend(v5, "objectsPassingTest:", &stru_429178));
    v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v45 = (void (**)(void))a3;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v68 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v11, "isTextResult"))
            v12 = v6;
          else
            v12 = v7;
          -[NSMutableArray addObject:](v12, "addObject:", v11);
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      }
      while (v8);
    }
    if (-[THSearchController searchNotes](self, "searchNotes"))
    {
      v13 = objc_msgSend(objc_msgSend(-[THSearchIndex resultsForQuery:occurrenceMap:searchContextMap:suggestions:](-[THDocumentRoot annotationSearchIndex](self->mDocumentRoot, "annotationSearchIndex"), "resultsForQuery:occurrenceMap:searchContextMap:suggestions:", self->mCurrentQuery, self->mAnnotationOccurrenceMap, self->mAnnotationReferenceTextMap, 0), "allObjects"), "mutableCopy");
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v64;
        do
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(_QWORD *)v64 != v15)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)j), "setDisplayPageNumber:", -[THDisplayPageNumberMap displayPageNumberForAbsolutePageIndex:](-[THSearchController displayPageNumberMap](self, "displayPageNumberMap"), "displayPageNumberForAbsolutePageIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)j), "pageNumber")));
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
        }
        while (v14);
      }
    }
    else
    {
      v13 = 0;
    }
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_C0470;
    v62[3] = &unk_427B40;
    v62[4] = self;
    v17 = &AEAnnotationPopoverShouldHideNotification_ptr;
    if (-[NSMutableArray count](v6, "count"))
    {
      -[NSMutableArray sortUsingComparator:](v6, "sortUsingComparator:", v62);
      v18 = objc_alloc_init((Class)NSMutableArray);
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
      if (v19)
      {
        v20 = 0;
        v21 = *(_QWORD *)v59;
        do
        {
          for (k = 0; k != v19; k = (char *)k + 1)
          {
            if (*(_QWORD *)v59 != v21)
              objc_enumerationMutation(v6);
            v23 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)k);
            if (objc_msgSend(v23, "rank") == 1 && v20)
            {
              v20 = 1;
            }
            else
            {
              objc_msgSend(v18, "addObject:", v23);
              v20 = objc_msgSend(v23, "rank") == 1;
            }
          }
          v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
        }
        while (v19);
      }
      v17 = &AEAnnotationPopoverShouldHideNotification_ptr;
      v24 = objc_alloc((Class)NSArray);
      v25 = objc_msgSend(v18, "count");
      if ((unint64_t)v25 >= 3)
        v26 = 3;
      else
        v26 = (uint64_t)v25;
      self->mTopTextResults = (NSArray *)objc_msgSend(v24, "initWithArray:", objc_msgSend(v18, "subarrayWithRange:", 0, v26));

      -[NSMutableArray sortUsingComparator:](v6, "sortUsingComparator:", &stru_429198);
      self->mTextResults = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v6);
    }
    if (-[NSMutableArray count](v7, "count"))
    {
      -[NSMutableArray sortUsingComparator:](v7, "sortUsingComparator:", v62);
      v27 = objc_alloc((Class)v17[396]);
      v28 = -[NSMutableArray count](v7, "count");
      if ((unint64_t)v28 >= 2)
        v29 = 2;
      else
        v29 = (uint64_t)v28;
      self->mTopMediaResults = (NSArray *)objc_msgSend(v27, "initWithArray:", -[NSMutableArray subarrayWithRange:](v7, "subarrayWithRange:", 0, v29));
      -[NSMutableArray sortUsingComparator:](v7, "sortUsingComparator:", &stru_429198);
      self->mMediaResults = (NSArray *)objc_msgSend(objc_alloc((Class)v17[396]), "initWithArray:", v7);
    }
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v13, "sortUsingComparator:", v62);
      v30 = objc_alloc((Class)v17[396]);
      v31 = objc_msgSend(v13, "count");
      if ((unint64_t)v31 >= 2)
        v32 = 2;
      else
        v32 = (uint64_t)v31;
      self->mTopNotesResults = (NSArray *)objc_msgSend(v30, "initWithArray:", objc_msgSend(v13, "subarrayWithRange:", 0, v32));
      objc_msgSend(v13, "sortUsingComparator:", &stru_429198);
      self->mNotesResults = (NSArray *)objc_msgSend(objc_alloc((Class)v17[396]), "initWithArray:", v13);
    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    mTopTextResults = self->mTopTextResults;
    v34 = -[NSArray countByEnumeratingWithState:objects:count:](mTopTextResults, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v55;
      do
      {
        for (m = 0; m != v34; m = (char *)m + 1)
        {
          if (*(_QWORD *)v55 != v35)
            objc_enumerationMutation(mTopTextResults);
          -[THSearchController resolveTitleForSearchResult:](self, "resolveTitleForSearchResult:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)m));
        }
        v34 = -[NSArray countByEnumeratingWithState:objects:count:](mTopTextResults, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
      }
      while (v34);
    }
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    mTopMediaResults = self->mTopMediaResults;
    v38 = -[NSArray countByEnumeratingWithState:objects:count:](mTopMediaResults, "countByEnumeratingWithState:objects:count:", &v50, v72, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v51;
      do
      {
        for (n = 0; n != v38; n = (char *)n + 1)
        {
          if (*(_QWORD *)v51 != v39)
            objc_enumerationMutation(mTopMediaResults);
          -[THSearchController resolveTitleForSearchResult:](self, "resolveTitleForSearchResult:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)n));
        }
        v38 = -[NSArray countByEnumeratingWithState:objects:count:](mTopMediaResults, "countByEnumeratingWithState:objects:count:", &v50, v72, 16);
      }
      while (v38);
    }
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    mTopNotesResults = self->mTopNotesResults;
    v42 = -[NSArray countByEnumeratingWithState:objects:count:](mTopNotesResults, "countByEnumeratingWithState:objects:count:", &v46, v71, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v47;
      do
      {
        for (ii = 0; ii != v42; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v47 != v43)
            objc_enumerationMutation(mTopNotesResults);
          -[THSearchController resolveTitleForSearchResult:](self, "resolveTitleForSearchResult:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)ii));
        }
        v42 = -[NSArray countByEnumeratingWithState:objects:count:](mTopNotesResults, "countByEnumeratingWithState:objects:count:", &v46, v71, 16);
      }
      while (v42);
    }
    v45[2]();

    self->mOccurrenceMap = 0;
    self->mAnnotationOccurrenceMap = 0;

    self->mReferenceTextMap = 0;
  }
  objc_sync_exit(self);
}

- (BOOL)isEncodedResultForPageNumber:(id)a3
{
  return objc_msgSend(a3, "rangeOfString:", kTHSearchControllerPageNumberToken) == 0;
}

- (id)displayNumberStringFromEncodedPageNumberResult:(id)a3
{
  return objc_msgSend(objc_msgSend(objc_msgSend(a3, "substringFromIndex:", objc_msgSend(kTHSearchControllerPageNumberToken, "length")), "componentsSeparatedByString:", CFSTR(",")), "objectAtIndex:", 0);
}

- (unint64_t)absolutePageIndexFromEncodedPageNumberResult:(id)a3
{
  id v3;
  id v4;
  unint64_t result;

  v3 = objc_msgSend(objc_msgSend(a3, "substringFromIndex:", objc_msgSend(kTHSearchControllerPageNumberToken, "length")), "componentsSeparatedByString:", CFSTR(","));
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "objectAtIndex:", 1);
  LODWORD(result) = objc_msgSend(v4, "intValue");
  if ((result & 0x80000000) != 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return (int)result;
}

- (unint64_t)absolutePageIndexForPageNumberString:(id)a3
{
  return -[THDisplayPageNumberMap absolutePageIndexForDisplayPageNumber:](-[THSearchController displayPageNumberMap](self, "displayPageNumberMap"), "absolutePageIndexForDisplayPageNumber:", a3);
}

- (void)clearSearchResults
{
  objc_sync_enter(self);
  -[NSOperationQueue cancelAllOperations](self->mReferenceIndexLoadQueue, "cancelAllOperations");

  self->mCurrentQuery = 0;
  self->mSuggestionResults = 0;

  self->mSuggestionOccurenceCounts = 0;
  self->mTextResults = 0;

  self->mTopTextResults = 0;
  self->mMediaResults = 0;

  self->mTopMediaResults = 0;
  self->mNotesResults = 0;

  self->mTopNotesResults = 0;
  self->mOccurrenceMap = 0;

  self->mAnnotationOccurrenceMap = 0;
  self->mIndexLoadQueue = 0;

  self->mReferenceIndexLoadQueue = 0;
  self->mReferenceIndexLoadOperation = 0;

  self->mReferenceTextMap = 0;
  objc_sync_exit(self);
}

- (unint64_t)searchResultCount
{
  NSUInteger v3;
  char *v4;

  v3 = -[NSArray count](-[THSearchController textSearchResults](self, "textSearchResults"), "count");
  v4 = (char *)-[NSArray count](-[THSearchController mediaSearchResults](self, "mediaSearchResults"), "count") + v3;
  return -[NSArray count](-[THSearchController notesSearchResults](self, "notesSearchResults"), "count") + (_QWORD)v4;
}

- (id)anchorForSelectedSearchResult:(id)a3
{
  id v5;
  THDocumentRoot *mDocumentRoot;
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  if (!a3)
    return 0;
  v5 = objc_msgSend(a3, "annotation");
  mDocumentRoot = self->mDocumentRoot;
  if (!v5)
    return -[THDocumentRoot anchorForNthInstance:ofSearchString:afterCFIString:coarsenIfNeeded:](mDocumentRoot, "anchorForNthInstance:ofSearchString:afterCFIString:coarsenIfNeeded:", objc_msgSend(a3, "occurrenceIndex"), objc_msgSend(a3, "term"), objc_msgSend(a3, "cfi"), 1);
  v7 = v5;
  v8 = -[THDocumentNavigationModel contentNodeForGUID:](-[THDocumentRoot navigationModel](mDocumentRoot, "navigationModel"), "contentNodeForGUID:", objc_msgSend(v5, "annotationContentNodeID"));
  v9 = objc_msgSend(a3, "contextRangeForResult");
  return +[THAnnotationAnchor annotationAnchorWithContentNode:annotation:noteRange:](THAnnotationAnchor, "annotationAnchorWithContentNode:annotation:noteRange:", v8, v7, v9, v10);
}

- (void)resolveTitleForSearchResult:(id)a3
{
  if (!objc_msgSend(a3, "title"))
    objc_msgSend(a3, "setTitle:", objc_msgSend(objc_msgSend(-[THDocumentRoot modelStorageAnchorForCfi:shallow:error:](self->mDocumentRoot, "modelStorageAnchorForCfi:shallow:error:", objc_msgSend(a3, "cfi"), 1, 0), "contentNode"), "title"));
}

- (BOOL)indexLoaded
{
  return -[THSearchIndex loaded](-[THDocumentRoot searchIndex](self->mDocumentRoot, "searchIndex"), "loaded");
}

- (void)p_indexloadFinished:(id)a3
{
  int64_t v4;
  _BOOL4 mIndexLoadFailed;
  NSNotificationCenter *v6;

  objc_sync_enter(self);
  v4 = self->mCountOfLoadingIndices - 1;
  self->mCountOfLoadingIndices = v4;
  if (v4
    || (-[THSearchIndex finishLoading](-[THDocumentRoot searchIndex](self->mDocumentRoot, "searchIndex"), "finishLoading"), -[THSearchIndex finishLoading](-[THDocumentRoot annotationSearchIndex](self->mDocumentRoot, "annotationSearchIndex"), "finishLoading"), self->mIndexLoadOperation = 0, self->mAnnotationIndexBuildOperation = 0, self->mIndexLoadFailed))
  {
    objc_sync_exit(self);
  }
  else
  {
    -[THAnnotationSearchIndex setAnnotationStorageController:](-[THDocumentRoot annotationSearchIndex](self->mDocumentRoot, "annotationSearchIndex"), "setAnnotationStorageController:", -[THDocumentRoot annotationController](self->mDocumentRoot, "annotationController"));
    -[THSearchController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "p_setupDisplayPageNumberMap", 0, 0);
    mIndexLoadFailed = self->mIndexLoadFailed;
    objc_sync_exit(self);
    if (!mIndexLoadFailed)
    {
      v6 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
      -[NSNotificationCenter postNotificationName:object:](v6, "postNotificationName:object:", THSearchControllerDidLoadIndexNotification, self);
    }
  }
}

- (void)loadIndex
{
  int v3;
  THAnnotationSearchIndexBuildOperation *v4;
  int v5;
  NSOperationQueue *v6;
  THSearchIndexLoadOperation *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  objc_sync_enter(self);
  if (self->mIndexLoadOperation
    || -[THSearchIndex loaded](-[THDocumentRoot searchIndex](self->mDocumentRoot, "searchIndex"), "loaded"))
  {
    v3 = 0;
  }
  else
  {
    v7 = -[THSearchIndexLoadOperation initWithDelegate:documentRoot:]([THSearchIndexLoadOperation alloc], "initWithDelegate:documentRoot:", self, self->mDocumentRoot);
    self->mIndexLoadOperation = &v7->super;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_C0C88;
    v9[3] = &unk_426DD0;
    v9[4] = self;
    -[THSearchIndexLoadOperation setCompletionBlock:](v7, "setCompletionBlock:", v9);
    ++self->mCountOfLoadingIndices;
    v3 = 1;
  }
  if (self->mAnnotationIndexBuildOperation || !-[THSearchController searchNotes](self, "searchNotes"))
  {
    if (!v3)
      goto LABEL_13;
    v5 = 0;
  }
  else
  {
    v4 = -[THAnnotationSearchIndexBuildOperation initWithDelegate:documentRoot:]([THAnnotationSearchIndexBuildOperation alloc], "initWithDelegate:documentRoot:", self, self->mDocumentRoot);
    self->mAnnotationIndexBuildOperation = &v4->super;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_C0C94;
    v8[3] = &unk_426DD0;
    v8[4] = self;
    -[THAnnotationSearchIndexBuildOperation setCompletionBlock:](v4, "setCompletionBlock:", v8);
    ++self->mCountOfLoadingIndices;
    v5 = 1;
  }
  self->mIndexLoadFailed = 0;
  v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  self->mIndexLoadQueue = v6;
  -[NSOperationQueue setName:](v6, "setName:", CFSTR("Search Index Load"));
  if (v3)
  {
    -[NSOperationQueue addOperation:](self->mIndexLoadQueue, "addOperation:", self->mIndexLoadOperation);

  }
  if (v5)
  {
    -[NSOperationQueue addOperation:](self->mIndexLoadQueue, "addOperation:", self->mAnnotationIndexBuildOperation);

  }
LABEL_13:
  objc_sync_exit(self);
}

- (void)cancelLoadIndex
{
  objc_sync_enter(self);
  -[NSOperation cancel](self->mIndexLoadOperation, "cancel");
  -[NSOperationQueue cancelAllOperations](self->mIndexLoadQueue, "cancelAllOperations");
  objc_sync_exit(self);
}

- (void)unloadIndex
{
  id v3;

  objc_sync_enter(self);
  -[NSOperation cancel](self->mIndexLoadOperation, "cancel");
  -[NSOperationQueue cancelAllOperations](self->mIndexLoadQueue, "cancelAllOperations");
  -[THSearchIndex unload](-[THDocumentRoot searchIndex](self->mDocumentRoot, "searchIndex"), "unload");
  v3 = -[THSearchIndex unload](-[THDocumentRoot annotationSearchIndex](self->mDocumentRoot, "annotationSearchIndex"), "unload");
  self->mUnloadRequested = 0;
  if (TSUPadIsFirstGen(v3))
    self->mUnloadRequested = 1;
  objc_sync_exit(self);
}

- (void)documentWillDealloc
{
  self->mDocumentRoot = 0;
}

- (void)searchIndexLoadOperationFailed:(id)a3
{
  objc_sync_enter(self);
  self->mIndexLoadFailed = 1;
  objc_sync_exit(self);
}

- (void)annotationSearchIndexBuildOperationFailed:(id)a3
{
  objc_sync_enter(self);
  self->mIndexLoadFailed = 1;
  objc_sync_exit(self);
}

- (id)displayPageNumberForAbsolutePageIndex:(unint64_t)a3
{
  return -[THDisplayPageNumberMap displayPageNumberForAbsolutePageIndex:](self->mDisplayPageNumberMap, "displayPageNumberForAbsolutePageIndex:", a3);
}

- (id)summaryForGlossaryTerm:(id)a3
{
  id result;

  result = -[THModelGlossary entryForTerm:](-[THDocumentRoot glossary](self->mDocumentRoot, "glossary"), "entryForTerm:", a3);
  if (result)
    return objc_msgSend(result, "summaryText");
  return result;
}

- (int64_t)recentSearchCount
{
  return -[NSArray count](-[THSearchController recentSearches](self, "recentSearches"), "count");
}

- (id)p_recentSearchAtIndex:(int64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  id result;

  v4 = -[THSearchController recentSearches](self, "recentSearches");
  if ((uint64_t)-[NSArray count](v4, "count") <= a3)
    return 0;
  v6 = objc_opt_class(NSDictionary, v5);
  TSUDynamicCast(v6, -[NSArray objectAtIndex:](v4, "objectAtIndex:", a3));
  return result;
}

- (id)recentSearchQueryAtIndex:(int64_t)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id result;

  v3 = -[THSearchController p_recentSearchAtIndex:](self, "p_recentSearchAtIndex:", a3);
  v5 = objc_opt_class(NSString, v4);
  TSUDynamicCast(v5, objc_msgSend(v3, "objectForKey:", CFSTR("query")));
  return result;
}

- (int64_t)recentSearchCountAtIndex:(int64_t)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  id v7;

  v3 = -[THSearchController p_recentSearchAtIndex:](self, "p_recentSearchAtIndex:", a3);
  v5 = objc_opt_class(NSNumber, v4);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, objc_msgSend(v3, "objectForKey:", CFSTR("result count"))).n128_u64[0];
  return (int64_t)objc_msgSend(v7, "integerValue", v6);
}

- (id)p_allSearchResults
{
  id v3;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  if (-[NSArray count](-[THSearchController textSearchResults](self, "textSearchResults"), "count"))
    objc_msgSend(v3, "addObjectsFromArray:", -[THSearchController textSearchResults](self, "textSearchResults"));
  if (-[NSArray count](-[THSearchController mediaSearchResults](self, "mediaSearchResults"), "count"))
    objc_msgSend(v3, "addObjectsFromArray:", -[THSearchController mediaSearchResults](self, "mediaSearchResults"));
  if (-[NSArray count](-[THSearchController notesSearchResults](self, "notesSearchResults"), "count"))
    objc_msgSend(v3, "addObjectsFromArray:", -[THSearchController notesSearchResults](self, "notesSearchResults"));
  return v3;
}

- (void)p_populatePageNumbersOfModelSearchResults:(id)a3
{
  id v3;
  id v5;
  id v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  void *i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  const __CFString *v23;
  const __CFString *v24;
  id v25;
  id v26;
  THSearchController *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v3 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    v8 = CFSTR("-");
    v9 = &stru_43D7D8;
    v27 = self;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v3);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v12 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", v8, v9, 0);
        v14 = objc_opt_class(THModelSearchResult, v13);
        *(_QWORD *)&v15 = TSUDynamicCast(v14, v11).n128_u64[0];
        v17 = v16;
        if (-[THSearchController paginationResultsValid](self, "paginationResultsValid", v15))
        {
          if (objc_msgSend(objc_msgSend(v17, "cfi"), "length"))
          {
            v18 = -[THDocumentRoot absolutePageIndexForCFI:](self->mDocumentRoot, "absolutePageIndexForCFI:", objc_msgSend(v17, "cfi"));
            if (v18 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v19 = v18;
              v20 = -[THDisplayPageNumberMap displayPageNumberForAbsolutePageIndex:](-[THSearchController displayPageNumberMap](self, "displayPageNumberMap"), "displayPageNumberForAbsolutePageIndex:", v18);
              v21 = v6;
              v22 = v7;
              v23 = v9;
              v24 = v8;
              v25 = v3;
              v26 = v20;
              if (objc_msgSend(v20, "length"))
                v12 = v26;
              v3 = v25;
              v8 = v24;
              v9 = v23;
              v7 = v22;
              v6 = v21;
              self = v27;
              objc_msgSend(v17, "setPageNumber:", v19);
            }
          }
        }
        objc_msgSend(v17, "setDisplayPageNumber:", v12);
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);
  }
}

- (NSArray)recentSearches
{
  return &self->mRecentSearches->super;
}

- (void)setRecentSearches:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)currentQuery
{
  return self->mCurrentQuery;
}

- (NSArray)suggestionResults
{
  return self->mSuggestionResults;
}

- (NSArray)suggestionOccurenceCounts
{
  return self->mSuggestionOccurenceCounts;
}

- (NSArray)textSearchResults
{
  return self->mTextResults;
}

- (NSArray)topTextSearchResults
{
  return self->mTopTextResults;
}

- (NSArray)mediaSearchResults
{
  return self->mMediaResults;
}

- (NSArray)topMediaSearchResults
{
  return self->mTopMediaResults;
}

- (NSArray)notesSearchResults
{
  return self->mNotesResults;
}

- (NSArray)topNotesSearchResults
{
  return self->mTopNotesResults;
}

- (BOOL)unloadRequested
{
  return self->mUnloadRequested;
}

- (void)setUnloadRequested:(BOOL)a3
{
  self->mUnloadRequested = a3;
}

- (THDisplayPageNumberMap)displayPageNumberMap
{
  return self->mDisplayPageNumberMap;
}

- (void)setDisplayPageNumberMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (BOOL)searchNotes
{
  return self->mSearchNotes;
}

- (void)setSearchNotes:(BOOL)a3
{
  self->mSearchNotes = a3;
}

- (NSString)recentSearchResultsAutosaveName
{
  return self->_recentSearchResultsAutosaveName;
}

- (void)setRecentSearchResultsAutosaveName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (BOOL)paginationResultsValid
{
  return self->_paginationResultsValid;
}

- (void)setPaginationResultsValid:(BOOL)a3
{
  self->_paginationResultsValid = a3;
}

@end
