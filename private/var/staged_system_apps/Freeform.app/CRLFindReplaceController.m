@implementation CRLFindReplaceController

- (CRLFindReplaceController)initWithEditingCoordinator:(id)a3 delegate:(id)a4
{
  return -[CRLFindReplaceController initWithEditingCoordinator:delegate:modelSearchesRunSynchronously:](self, "initWithEditingCoordinator:delegate:modelSearchesRunSynchronously:", a3, a4, 0);
}

- (CRLFindReplaceController)initWithEditingCoordinator:(id)a3 delegate:(id)a4 modelSearchesRunSynchronously:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  CRLFindReplaceController *v9;
  uint64_t v10;
  NSMapTable *visibleResults;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  objc_super v22;

  v5 = a5;
  v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRLFindReplaceController;
  v9 = -[CRLModelSearchController initWithEditingCoordinator:delegate:modelSearchesRunSynchronously:](&v22, "initWithEditingCoordinator:delegate:modelSearchesRunSynchronously:", v8, a4, v5);
  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 517, 0));
    visibleResults = v9->_visibleResults;
    v9->_visibleResults = (NSMapTable *)v10;

    v9->_searchOptions = 16;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    if ((objc_msgSend(v12, "BOOLForKey:", CFSTR("FindReplaceMatchCaseKey")) & 1) == 0)
      v9->_searchOptions |= 1uLL;
    if (objc_msgSend(v12, "BOOLForKey:", CFSTR("FindReplaceWholeWordsKey")))
      v9->_searchOptions |= 8uLL;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "changeNotifier"));
    *(_QWORD *)&v15 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v14).n128_u64[0];
    objc_msgSend(v13, "addObserver:forChangeSourceOfClass:", v9, v16, v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "changeNotifier"));
    *(_QWORD *)&v19 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v18).n128_u64[0];
    objc_msgSend(v17, "addObserver:forChangeSourceOfClass:", v9, v20, v19);

  }
  return v9;
}

- (void)setSearchString:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", self->_searchString) & 1) == 0)
  {
    -[CRLFindReplaceController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("searchString"));
    objc_storeStrong((id *)&self->_searchString, a3);
    -[CRLFindReplaceController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("searchString"));
    if (!objc_msgSend(v5, "length"))
    {
      -[CRLFindReplaceController clearCurrentSelectionPath](self, "clearCurrentSelectionPath");
      -[CRLFindReplaceController pulseSearchResult:autohiding:](self, "pulseSearchResult:autohiding:", 0, 0);
    }
    -[CRLFindReplaceController invalidateSearchResults](self, "invalidateSearchResults");
    -[CRLFindReplaceController updateHighlights](self, "updateHighlights");
  }

}

- (void)setSearchOptions:(unint64_t)a3
{
  id v5;

  if (self->_searchOptions != a3)
  {
    self->_searchOptions = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v5, "setBool:forKey:", (a3 & 1) == 0, CFSTR("FindReplaceMatchCaseKey"));
    objc_msgSend(v5, "setBool:forKey:", (a3 >> 3) & 1, CFSTR("FindReplaceWholeWordsKey"));
    -[CRLFindReplaceController invalidateSearchResults](self, "invalidateSearchResults");

  }
}

- (id)replaceSearchReference:(id)a3 withString:(id)a4 shouldSetSelectionForCommitPath:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  CRLCommandSelectionBehavior *v16;
  CRLCommandSelectionBehavior *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "commandForReplacingWithString:options:", v9, -[CRLFindReplaceController searchOptions](self, "searchOptions")));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchReferenceForReplacingWithString:options:", v9, -[CRLFindReplaceController searchOptions](self, "searchOptions")));
    v12 = objc_msgSend(v11, "rootIndex");
    if (v12 != objc_msgSend(v8, "rootIndex"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101252788);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E21A40();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012527A8);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFindReplaceController replaceSearchReference:withString:shouldSetSelectionForCommitPath:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLFindReplaceController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 131, 0, "Expect root indexes to be migrated to the new searchReference.");

    }
    if ((objc_opt_respondsToSelector(v8, "commandSelectionBehaviorForCommand:") & 1) == 0
      || (v16 = (CRLCommandSelectionBehavior *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "commandSelectionBehaviorForCommand:", v10))) == 0)
    {
      v17 = [CRLCommandSelectionBehavior alloc];
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionPath"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionPath"));
      v16 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:](v17, "initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:", v18, v19, 132);

    }
    if (!a5)
      -[CRLCommandSelectionBehavior setCommitSelectionPath:](v16, "setCommitSelectionPath:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController editingCoordinator](self, "editingCoordinator"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "commandController"));

    objc_msgSend(v21, "openGroup");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Replace"), 0, CFSTR("UndoStrings")));
    objc_msgSend(v21, "setCurrentGroupActionString:", v23);

    objc_msgSend(v21, "enqueueCommand:", v10);
    objc_msgSend(v21, "closeGroupWithSelectionBehavior:", v16);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)replaceAllOccurrencesOfString:(id)a3 withString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CRLCommandSelectionBehavior *v17;
  CRLFindReplaceAllHelper *v18;
  void *v19;
  CRLFindReplaceAllHelper *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v6 = a3;
  v7 = a4;
  -[CRLFindReplaceController setIsReplacingAll:](self, "setIsReplacingAll:", 1);
  if (v6)
  {
    if (v7)
      goto LABEL_3;
LABEL_24:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252808);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E21AC0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252828);
    v27 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFindReplaceController replaceAllOccurrencesOfString:withString:]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLFindReplaceController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 163, 0, "invalid nil value for '%{public}s'", "replaceString");

    objc_msgSend(v6, "length");
    goto LABEL_33;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012527C8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E21BD8();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012527E8);
  v24 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFindReplaceController replaceAllOccurrencesOfString:withString:]"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLFindReplaceController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 162, 0, "invalid nil value for '%{public}s'", "findString");

  if (!v7)
    goto LABEL_24;
LABEL_3:
  if (!objc_msgSend(v6, "length"))
  {
LABEL_33:
    v23 = 0;
    goto LABEL_34;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interactiveCanvasControllerForFindController:", self));

  if (!v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252848);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E21B4C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252868);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFindReplaceController replaceAllOccurrencesOfString:withString:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLFindReplaceController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 166, 0, "invalid nil value for '%{public}s'", "interactiveCanvasController");

  }
  objc_msgSend(v9, "endEditing");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController editingCoordinator](self, "editingCoordinator"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "followCoordinator"));
  objc_msgSend(v14, "endFollowSessionForLocalParticipantWithShouldShowRefollowPlacard:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasEditor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectionPathWithInfos:", 0));

  v17 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:]([CRLCommandSelectionBehavior alloc], "initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:", v16, v16, 4096);
  v18 = [CRLFindReplaceAllHelper alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController editingCoordinator](self, "editingCoordinator"));
  v20 = -[CRLFindReplaceAllHelper initWithEditingCoordinator:findString:replaceString:options:](v18, "initWithEditingCoordinator:findString:replaceString:options:", v19, v6, v7, -[CRLFindReplaceController searchOptions](self, "searchOptions"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "modelEnumeratorForSearchWithFlags:", 1));
  -[CRLFindReplaceAllHelper replaceAllWithSelectionBehavior:modelEnumerator:](v20, "replaceAllWithSelectionBehavior:modelEnumerator:", v17, v22);

  v23 = -[CRLFindReplaceAllHelper countOfItemsReplaced](v20, "countOfItemsReplaced");
LABEL_34:
  -[CRLFindReplaceController invalidateSearchResults](self, "invalidateSearchResults");
  -[CRLFindReplaceController setIsReplacingAll:](self, "setIsReplacingAll:", 0);

  return v23;
}

- (BOOL)searchCriteriaIsValid
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFindReplaceController searchString](self, "searchString"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)respondsToSearch
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController currentSearchable](self, "currentSearchable"));
  v4 = objc_opt_respondsToSelector(v3, "searchForString:options:searchCanvasDelegate:onHit:");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController currentSearchable](self, "currentSearchable"));
  v6 = objc_opt_respondsToSelector(v5, "searchForAnnotationsWithHitBlock:");

  if ((v4 & 1) == 0 && (v6 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252888);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E21C64();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012528A8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFindReplaceController respondsToSearch]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLFindReplaceController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 198, 0, "Every searchable should respond to atleast a string search or an annotation search");

  }
  return v4 & 1;
}

- (id)getNextSearchFromCurrentSearchable
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController currentSearchable](self, "currentSearchable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFindReplaceController searchString](self, "searchString"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10033473C;
  v7[3] = &unk_1012528D0;
  v7[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchForString:options:searchCanvasDelegate:onHit:", v4, -[CRLFindReplaceController searchOptions](self, "searchOptions"), 0, v7));

  return v5;
}

- (void)continueSearch
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController currentSearchable](self, "currentSearchable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController currentSearch](self, "currentSearch"));
  objc_msgSend(v4, "continueSearch:", v3);

}

+ (void)_recursiveSearchWithSearchTarget:(id)a3 forString:(id)a4 options:(unint64_t)a5 dispatchGroup:(id)a6 hitBlock:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(a1, "assertSearchTargetImplementsProperMethods:", v14);
  if ((objc_opt_respondsToSelector(v14, "layoutSearchForString:options:hitBlock:completionBlock:") & 1) != 0)
  {
    if (v16)
      dispatch_group_enter(v16);
    objc_msgSend(v14, "layoutSearchForString:options:hitBlock:completionBlock:", v15, a5, v17, v18);
  }
  if ((objc_opt_respondsToSelector(v14, "childSearchTargets") & 1) != 0)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = v14;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "childSearchTargets"));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v26;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(a1, "_recursiveSearchWithSearchTarget:forString:options:dispatchGroup:hitBlock:completionBlock:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v23), v15, a5, v16, v17, v18);
          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v21);
    }

    v14 = v24;
  }

}

- (void)searchReferencesToHighlightInVisibleRootObjectRange:(_NSRange)a3 completionBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  id v10;
  dispatch_group_t v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  _QWORD v16[5];
  NSObject *v17;
  id v18;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 517, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFindReplaceController searchString](self, "searchString"));
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    v11 = dispatch_group_create();
    if (location < location + length)
    {
      do
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100334B30;
        v16[3] = &unk_1012528F8;
        v16[4] = self;
        v17 = v11;
        v18 = v8;
        objc_msgSend(v12, "withRootSearchTargetAtIndex:executeBlock:", location, v16);

        ++location;
        --length;
      }
      while (length);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100334CF8;
    block[3] = &unk_10122C360;
    v15 = v7;
    v14 = v8;
    dispatch_group_notify(v11, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    (*((void (**)(id, void *))v7 + 2))(v7, v8);
  }

}

- (void)performSearchWithSearchTarget:(id)a3 resultsArray:(id)a4
{
  id v6;
  id v7;
  void ***v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  CRLFindReplaceController *v18;
  id v19;

  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_100334DEC;
  v17 = &unk_101252960;
  v18 = self;
  v19 = a4;
  v6 = v19;
  v7 = a3;
  v8 = objc_retainBlock(&v14);
  *(_QWORD *)&v10 = objc_opt_class(self, v9).n128_u64[0];
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFindReplaceController searchString](self, "searchString", v10, v14, v15, v16, v17, v18));
  objc_msgSend(v12, "_recursiveSearchWithSearchTarget:forString:options:dispatchGroup:hitBlock:completionBlock:", v7, v13, -[CRLFindReplaceController searchOptions](self, "searchOptions"), 0, v8, 0);

}

- (unint64_t)nextRootSearchTargetFromIndex:(unint64_t)a3 inDirection:(unint64_t)a4
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFindReplaceController searchString](self, "searchString"));
  v9 = objc_msgSend(v7, "nextRootSearchTargetIndexFromIndex:forString:options:inDirection:", a3, v8, -[CRLFindReplaceController searchOptions](self, "searchOptions"), a4);

  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFindReplaceController searchString](self, "searchString"));
    v9 = objc_msgSend(v10, "nextRootSearchTargetIndexFromIndex:forString:options:inDirection:", 0x7FFFFFFFFFFFFFFFLL, v11, -[CRLFindReplaceController searchOptions](self, "searchOptions"), a4);

    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101252980);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E21D64();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012529A0);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFindReplaceController nextRootSearchTargetFromIndex:inDirection:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLFindReplaceController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 293, 0, "Could not find next root search target. Defaulting to 0.");

      return 0;
    }
  }
  return (unint64_t)v9;
}

- (void)pulseSearchResult:(id)a3 autohiding:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;

  v4 = a4;
  v18 = a3;
  objc_msgSend(v18, "setPulseHighlight:", 1);
  objc_msgSend(v18, "setAutohideHighlight:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
  objc_opt_class(NSObject, v7);
  v14 = sub_1002220C8(v18, v8, 1, v9, v10, v11, v12, v13, (uint64_t)&OBJC_PROTOCOL___CRLSearchReference);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v6, "setPrimarySearchReference:forFindReplaceController:", v15, self);

  v16 = -[CRLFindReplaceController shouldSetSelectionPathToFindResult](self, "shouldSetSelectionPathToFindResult");
  v17 = v18;
  if (v18 && v16)
  {
    -[CRLFindReplaceController setSelectionPathToSearchReference:flags:](self, "setSelectionPathToSearchReference:flags:", v18, 128);
    v17 = v18;
  }

}

- (void)invalidateSearchResults
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CRLFindReplaceController resetCollaborativeTimer](self, "resetCollaborativeTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactiveCanvasControllerForFindController:", self));
  objc_msgSend(v4, "layoutInvalidated");

  v5.receiver = self;
  v5.super_class = (Class)CRLFindReplaceController;
  -[CRLModelSearchController invalidateSearchResults](&v5, "invalidateSearchResults");
  -[CRLFindReplaceController invalidateSearchHighlights](self, "invalidateSearchHighlights");
  -[CRLFindReplaceController pulseSearchResult:autohiding:](self, "pulseSearchResult:autohiding:", 0, 0);
}

- (void)invalidateSearchHighlights
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[CRLFindReplaceController setHighlightsRange:](self, "setHighlightsRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 517, 0));
  -[CRLFindReplaceController setVisibleResults:](self, "setVisibleResults:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
  objc_msgSend(v4, "setSearchReferencesToHighlight:forFindReplaceController:", 0, self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
  v6 = objc_opt_respondsToSelector(v5, "didHideSearchHighlights");

  if ((v6 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
    objc_msgSend(v7, "didHideSearchHighlights");

  }
}

- (void)setSearchHighlightsEnabled:(BOOL)a3
{
  if (self->_searchHighlightsEnabled != a3)
  {
    self->_searchHighlightsEnabled = a3;
    -[CRLFindReplaceController updateHighlights](self, "updateHighlights");
  }
}

- (void)updateHighlights
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];

  if (-[CRLFindReplaceController searchHighlightsEnabled](self, "searchHighlightsEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
    v4 = objc_msgSend(v3, "visibleRootIndexRange");
    v6 = v5;

    if (v4 != -[CRLFindReplaceController highlightsRange](self, "highlightsRange") || v6 != v7)
    {
      -[CRLFindReplaceController setHighlightsRange:](self, "setHighlightsRange:", v4, v6);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10033553C;
      v8[3] = &unk_1012529C8;
      v8[4] = self;
      -[CRLFindReplaceController searchReferencesToHighlightInVisibleRootObjectRange:completionBlock:](self, "searchReferencesToHighlightInVisibleRootObjectRange:completionBlock:", v4, v6, v8);
    }
  }
}

- (void)p_handleVisibleResults:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[CRLFindReplaceController setVisibleResults:](self, "setVisibleResults:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactiveCanvasControllerForFindController:", self));

  v6 = objc_msgSend(v11, "count");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
    v8 = objc_opt_respondsToSelector(v7, "willShowSearchHighlights");

    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
      objc_msgSend(v9, "willShowSearchHighlights");

    }
  }
  else
  {
    -[CRLFindReplaceController clearCurrentSelectionPath](self, "clearCurrentSelectionPath");
  }
  objc_msgSend(v5, "setShowGrayOverlay:", v6 != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
  objc_msgSend(v10, "setSearchReferencesToHighlight:forFindReplaceController:", v11, self);

}

- (void)findNextResultInDirection:(unint64_t)a3
{
  -[CRLFindReplaceController findNextResultInDirection:shouldPulse:](self, "findNextResultInDirection:shouldPulse:", a3, 1);
}

- (void)findNextResultInDirection:(unint64_t)a3 shouldPulse:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  objc_class *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  id v49;

  v4 = a4;
  -[CRLFindReplaceController resetCollaborativeTimer](self, "resetCollaborativeTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController primaryFindResultSearchReference](self, "primaryFindResultSearchReference"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController startingPointSearchReference](self, "startingPointSearchReference"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController startingPointSearchReference](self, "startingPointSearchReference"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchReferenceStart"));
      -[CRLModelSearchController setStartingPointSearchReference:](self, "setStartingPointSearchReference:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController startingPointSearchReference](self, "startingPointSearchReference"));
      objc_msgSend(v9, "searchReferencePoint");
      -[CRLFindReplaceController locateSearchReference:nearestPoint:](self, "locateSearchReference:nearestPoint:", v11);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "interactiveCanvasControllerForFindController:", self));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "textInputEditor"));

      if ((objc_opt_respondsToSelector(v11, "editingSearchReference") & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editingSearchReference"));
        -[CRLModelSearchController setStartingPointSearchReference:](self, "setStartingPointSearchReference:", v14);

      }
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController startingPointSearchReference](self, "startingPointSearchReference"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "interactiveCanvasControllerForFindController:", self));

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController startingPointSearchReference](self, "startingPointSearchReference"));
      objc_msgSend(v17, "scrollSearchReferenceToVisible:scrollOptions:", v18, 128);

    }
  }
  v20 = 0x7FFFFFFFFFFFFFFFLL;
  v19 = 0;
  if (-[CRLFindReplaceController searchHighlightsEnabled](self, "searchHighlightsEnabled"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
    v22 = objc_msgSend(v21, "visibleRootIndexRange");
    v24 = v23;

    if (v22 == (id)0x7FFFFFFFFFFFFFFFLL && v24 == 0)
    {
      -[CRLModelSearchController setStartingPointSearchReference:](self, "setStartingPointSearchReference:", 0);
      -[CRLFindReplaceController invalidateSearchResults](self, "invalidateSearchResults");
      return;
    }
    v20 = (uint64_t)v22;
    v19 = v24;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController primaryFindResultSearchReference](self, "primaryFindResultSearchReference"));
  if (v26)
  {

  }
  else if (-[CRLFindReplaceController returnFirstVisibleResultIfPossible](self, "returnFirstVisibleResultIfPossible"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "interactiveCanvasControllerForFindController:", self));

    objc_msgSend(v28, "visibleUnscaledRect");
    v49 = (id)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController firstVisibleResultInRect:](self, "firstVisibleResultInRect:"));
    -[CRLFindReplaceController setReturnFirstVisibleResultIfPossible:](self, "setReturnFirstVisibleResultIfPossible:", 0);

    if (v49)
      goto LABEL_19;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController startingPointSearchReference](self, "startingPointSearchReference"));
  v49 = (id)objc_claimAutoreleasedReturnValue(-[CRLFindReplaceController searchReferenceAfterReference:inDirection:](self, "searchReferenceAfterReference:inDirection:", v29, a3));

LABEL_19:
  if (v4)
    -[CRLFindReplaceController pulseSearchResult:autohiding:](self, "pulseSearchResult:autohiding:", 0, 0);
  v30 = v49;
  if (v49)
  {
    -[CRLModelSearchController setStartingPointSearchReference:](self, "setStartingPointSearchReference:", v49);
    -[CRLFindReplaceController willScrollToReference:](self, "willScrollToReference:", v49);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "interactiveCanvasControllerForFindController:", self));

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
    v34 = objc_opt_respondsToSelector(v33, "scrollOptionsForFindReplace");

    if ((v34 & 1) != 0)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
      v36 = (uint64_t)objc_msgSend(v35, "scrollOptionsForFindReplace");

    }
    else
    {
      v36 = 8;
    }
    objc_msgSend(v32, "scrollSearchReferenceToVisible:scrollOptions:", v49, v36);
    if (v4)
      -[CRLFindReplaceController pulseSearchResult:autohiding:](self, "pulseSearchResult:autohiding:", v49, -[CRLFindReplaceController searchHighlightsEnabled](self, "searchHighlightsEnabled") ^ 1);
    if (-[CRLFindReplaceController searchHighlightsEnabled](self, "searchHighlightsEnabled"))
    {
      -[CRLFindReplaceController updateHighlights](self, "updateHighlights");
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
      v38 = objc_msgSend(v37, "visibleRootIndexRange");
      v40 = v39;

      if (v38 != (id)v20 || v40 != v19)
        objc_msgSend(v32, "layoutInvalidated");
    }

  }
  objc_opt_class(NSObject, v30);
  v47 = sub_1002220C8(v49, v41, 1, v42, v43, v44, v45, v46, (uint64_t)&OBJC_PROTOCOL___CRLSearchReference);
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  -[CRLModelSearchController setPrimaryFindResultSearchReference:](self, "setPrimaryFindResultSearchReference:", v48);

}

- (void)willScrollToReference:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
  if ((objc_opt_respondsToSelector(v4, "willScrollToReference:") & 1) != 0)
    objc_msgSend(v4, "willScrollToReference:", v5);

}

- (void)replaceWithString:(id)a3 findAgain:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a4;
  v6 = a3;
  -[CRLFindReplaceController resetCollaborativeTimer](self, "resetCollaborativeTimer");
  if (v6)
  {
    -[CRLFindReplaceController setIsReplacingText:](self, "setIsReplacingText:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController primaryFindResultSearchReference](self, "primaryFindResultSearchReference"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interactiveCanvasControllerForFindController:", self));

    if (!v9)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101252A28);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E21E70();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101252A48);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFindReplaceController replaceWithString:findAgain:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLFindReplaceController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 484, 0, "invalid nil value for '%{public}s'", "interactiveCanvasController");

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController editingCoordinator](self, "editingCoordinator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "followCoordinator"));
    objc_msgSend(v14, "endFollowSessionForLocalParticipantWithShouldShowRefollowPlacard:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFindReplaceController replaceSearchReference:withString:shouldSetSelectionForCommitPath:](self, "replaceSearchReference:withString:shouldSetSelectionForCommitPath:", v7, v6, 1));
    -[CRLFindReplaceController clearCurrentSelectionPath](self, "clearCurrentSelectionPath");
    -[CRLFindReplaceController invalidateSearchResults](self, "invalidateSearchResults");
    objc_msgSend(v9, "layoutIfNeeded");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "searchReferenceEnd"));
    -[CRLModelSearchController setStartingPointSearchReference:](self, "setStartingPointSearchReference:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController startingPointSearchReference](self, "startingPointSearchReference"));
    objc_msgSend(v7, "searchReferencePoint");
    -[CRLFindReplaceController locateSearchReference:nearestPoint:](self, "locateSearchReference:nearestPoint:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
    v19 = objc_opt_respondsToSelector(v18, "scrollOptionsForFindReplace");

    if ((v19 & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
      v21 = (uint64_t)objc_msgSend(v20, "scrollOptionsForFindReplace");

      if (v4)
        goto LABEL_28;
    }
    else
    {
      v21 = 8;
      if (v4)
        goto LABEL_28;
    }
    if (-[CRLFindReplaceController shouldSetSelectionPathToFindResult](self, "shouldSetSelectionPathToFindResult"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController startingPointSearchReference](self, "startingPointSearchReference"));
      v24 = objc_msgSend(v23, "isSelectable");

      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController startingPointSearchReference](self, "startingPointSearchReference"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "selectionPath"));
        objc_msgSend(v25, "setSelectionPath:withFlags:", v27, 6);

LABEL_29:
        -[CRLModelSearchController setPrimaryFindResultSearchReference:](self, "setPrimaryFindResultSearchReference:", 0);
        -[CRLFindReplaceController invalidateSearchHighlights](self, "invalidateSearchHighlights");
        -[CRLFindReplaceController setIsReplacingText:](self, "setIsReplacingText:", 0);
        if (v4)
          -[CRLFindReplaceController findNextResultInDirection:](self, "findNextResultInDirection:", 0);

        goto LABEL_32;
      }
    }
LABEL_28:
    objc_msgSend(v9, "scrollSearchReferenceToVisible:scrollOptions:", v15, v21);
    goto LABEL_29;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012529E8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E21DE4();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101252A08);
  v22 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFindReplaceController replaceWithString:findAgain:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLFindReplaceController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v9, 477, 0, "invalid nil value for '%{public}s'", "replaceString");
LABEL_32:

}

- (void)endSearchSession
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CRLFindReplaceController invalidateSearchResults](self, "invalidateSearchResults");
  -[CRLFindReplaceController invalidateSearchHighlights](self, "invalidateSearchHighlights");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController primaryFindResultSearchReference](self, "primaryFindResultSearchReference"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController primaryFindResultSearchReference](self, "primaryFindResultSearchReference"));
    -[CRLFindReplaceController setSelectionPathToSearchReference:flags:](self, "setSelectionPathToSearchReference:flags:", v4, 0);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactiveCanvasControllerForFindController:", self));

  objc_msgSend(v6, "setShowGrayOverlay:", 0);
  -[CRLFindReplaceController setSearchHighlightsEnabled:](self, "setSearchHighlightsEnabled:", 0);
  -[CRLFindReplaceController pulseSearchResult:autohiding:](self, "pulseSearchResult:autohiding:", 0, 0);

}

- (void)locateSearchReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactiveCanvasControllerForFindController:", self));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003361B8;
  v9[3] = &unk_101238288;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "withLayoutForSelectionPath:performBlock:", v7, v9);

}

- (void)locateSearchReference:(id)a3 nearestPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  objc_opt_class(CRLWPSearchReference, v8);
  v10 = sub_100221D0C(v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storage"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "interactiveCanvasControllerForFindController:", self));

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storage"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100336330;
      v17[3] = &unk_101238288;
      v18 = v7;
      objc_msgSend(v15, "withLayoutNearestPoint:forStorage:performBlock:", v16, v17, x, y);

    }
  }
  else
  {
    -[CRLFindReplaceController locateSearchReference:](self, "locateSearchReference:", v7);
  }

}

- (id)searchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "searchReferencePoint");
    if (v9 == CGPointZero.x && v8 == CGPointZero.y)
      -[CRLFindReplaceController locateSearchReference:](self, "locateSearchReference:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactiveCanvasControllerForFindController:", self));

    objc_msgSend(v12, "scrollSearchReferenceToVisible:scrollOptions:", v7, 128);
  }
  v16.receiver = self;
  v16.super_class = (Class)CRLFindReplaceController;
  v13 = -[CRLModelSearchController searchReferenceAfterReference:inDirection:](&v16, "searchReferenceAfterReference:inDirection:", v7, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  return v14;
}

- (void)setSelectionPathToSearchReference:(id)a3 flags:(unint64_t)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v15 = v6;
    v8 = objc_msgSend(v6, "isSelectable");
    v7 = v15;
    if (v8)
    {
      -[CRLFindReplaceController clearCurrentSelectionPath](self, "clearCurrentSelectionPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
      v10 = objc_opt_respondsToSelector(v9, "setSelectionPath:withFlags:");

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
      v12 = v11;
      if ((v10 & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectionPath"));
        objc_msgSend(v12, "setSelectionPath:withFlags:", v13, a4);
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactiveCanvasControllerForFindController:", self));

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectionPath"));
        objc_msgSend(v14, "setSelectionPath:withSelectionFlags:", v13, a4);
        v12 = v14;
      }

      v7 = v15;
    }
  }

}

- (void)clearCurrentSelectionPath
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactiveCanvasControllerForFindController:", self));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionModelTranslator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPathForInfos:", 0));

  objc_msgSend(v6, "setSelectionPath:withSelectionFlags:", v5, 128);
}

+ (id)unescapeFindQuery:(id)a3
{
  id v3;
  id v4;
  void *v5;
  __CFString *v6;
  char *v7;
  char *v8;
  char *i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  v3 = a3;
  if (!qword_101415510)
  {
    qword_101415510 = (uint64_t)&off_1012CB8A8;

    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%C%C%C%C%C%C"), 9, 10, 5, 12, 8232, 92);
    v5 = (void *)qword_101415518;
    qword_101415518 = (uint64_t)v4;

  }
  if (objc_msgSend(v3, "length"))
  {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v3));
    v7 = (char *)objc_msgSend((id)qword_101415510, "count");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_101415510, "objectAtIndexedSubscript:", i));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_101415518, "substringWithRange:", i, 1));
        v12 = -[__CFString crl_range](v6, "crl_range");
        -[__CFString replaceOccurrencesOfString:withString:options:range:](v6, "replaceOccurrencesOfString:withString:options:range:", v10, v11, 0, v12, v13);

      }
    }
  }
  else
  {
    v6 = &stru_1012A72B0;
  }

  return v6;
}

+ (id)escapeFindQuery:(id)a3
{
  id v3;
  __CFString *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;
  __CFString *v10;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v3));
    v5 = -[__CFString length](v4, "length");
    if (v5)
    {
      v6 = (unint64_t)v5;
      v7 = 0;
      while (2)
      {
        v8 = -[__CFString characterAtIndex:](v4, "characterAtIndex:", v7);
        v9 = 1;
        v10 = CFSTR("\\t");
        switch(v8)
        {
          case 5u:
            v10 = CFSTR("\\p");
            goto LABEL_12;
          case 6u:
          case 7u:
          case 8u:
          case 0xBu:
            goto LABEL_13;
          case 9u:
            goto LABEL_12;
          case 0xAu:
            v10 = CFSTR("\\n");
            goto LABEL_12;
          case 0xCu:
            v10 = CFSTR("\\c");
            goto LABEL_12;
          default:
            if (v8 == 92)
            {
              v10 = CFSTR("\\\\");
            }
            else
            {
              if (v8 != 8232)
                goto LABEL_13;
              v10 = CFSTR("\\i");
            }
LABEL_12:
            -[__CFString replaceCharactersInRange:withString:](v4, "replaceCharactersInRange:withString:", v7, 1, v10);
            v9 = (uint64_t)-[__CFString length](v10, "length");
            v6 = v6 + v9 - 1;
LABEL_13:
            v7 += v9;
            if (v7 >= v6)
              break;
            continue;
        }
        break;
      }
    }
  }
  else
  {
    v4 = &stru_1012A72B0;
  }

  return v4;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (unint64_t)searchOptions
{
  return self->_searchOptions;
}

- (BOOL)isReplacingText
{
  return self->_isReplacingText;
}

- (void)setIsReplacingText:(BOOL)a3
{
  self->_isReplacingText = a3;
}

- (BOOL)shouldSetSelectionPathToFindResult
{
  return self->_shouldSetSelectionPathToFindResult;
}

- (void)setShouldSetSelectionPathToFindResult:(BOOL)a3
{
  self->_shouldSetSelectionPathToFindResult = a3;
}

- (_NSRange)highlightsRange
{
  _NSRange *p_highlightsRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_highlightsRange = &self->_highlightsRange;
  location = self->_highlightsRange.location;
  length = p_highlightsRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setHighlightsRange:(_NSRange)a3
{
  self->_highlightsRange = a3;
}

- (BOOL)searchHighlightsEnabled
{
  return self->_searchHighlightsEnabled;
}

- (BOOL)returnFirstVisibleResultIfPossible
{
  return self->_returnFirstVisibleResultIfPossible;
}

- (void)setReturnFirstVisibleResultIfPossible:(BOOL)a3
{
  self->_returnFirstVisibleResultIfPossible = a3;
}

- (int64_t)lastFindPasteboardChangeCount
{
  return self->_lastFindPasteboardChangeCount;
}

- (void)setLastFindPasteboardChangeCount:(int64_t)a3
{
  self->_lastFindPasteboardChangeCount = a3;
}

- (BOOL)isReplacingAll
{
  return self->_isReplacingAll;
}

- (void)setIsReplacingAll:(BOOL)a3
{
  self->_isReplacingAll = a3;
}

- (NSMapTable)visibleResults
{
  return self->_visibleResults;
}

- (void)setVisibleResults:(id)a3
{
  objc_storeStrong((id *)&self->_visibleResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleResults, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
