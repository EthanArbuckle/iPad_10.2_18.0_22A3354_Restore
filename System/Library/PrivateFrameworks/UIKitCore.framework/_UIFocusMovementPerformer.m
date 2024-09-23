@implementation _UIFocusMovementPerformer

- (BOOL)performFocusMovement:(id)a3
{
  id v5;
  unint64_t v6;
  NSObject *v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = _MergedGlobals_1043;
  if (!_MergedGlobals_1043)
  {
    v6 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&_MergedGlobals_1043);
  }
  v7 = *(id *)(v6 + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(v6 + 8), v5) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v7))
  {
    _os_signpost_emit_unreliably_with_name_impl();
  }

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMovementPerformer.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    LOBYTE(self) = 0;
    v11 = 0;
    v10 = 0;
    goto LABEL_32;
  }
  v8 = v5;
  v9 = 0;
  v10 = 0;
  v11 = v8;
  do
  {
    objc_msgSend(v11, "focusSystem");
    v12 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "overridesDeferredFocusUpdate") & 1) == 0
      && (-[NSObject _performDeferredFocusUpdateIfAvailable](v12, "_performDeferredFocusUpdateIfAvailable") & 1) != 0)
    {
      LOBYTE(self) = 1;
      goto LABEL_37;
    }
    objc_msgSend(v11, "movementInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[_UIFocusMovementPerformer contextForFocusMovement:](self, "contextForFocusMovement:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "_isValidInFocusSystem:", v12))
      {
        v15 = -[NSObject _updateFocusImmediatelyWithContext:](v12, "_updateFocusImmediatelyWithContext:", v14);
        if (!v10)
          goto LABEL_15;
      }
      else
      {
        v15 = 0;
        if (!v10)
LABEL_15:
          v10 = v14;
      }

      if (v15)
      {

        goto LABEL_24;
      }
      v9 = 1;
    }
    objc_msgSend(v11, "fallbackRequest");
    v16 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v16;
  }
  while (v16);
  if ((v9 & 1) == 0)
    goto LABEL_30;
  -[_UIFocusMovementPerformer delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = v17;
    v19 = objc_msgSend(v17, "_handleFailedFocusMovementRequest:withPerformer:", v8, self);

    if ((v19 & 1) != 0)
    {
      v11 = 0;
LABEL_24:
      LOBYTE(self) = 1;
      goto LABEL_32;
    }
  }
  objc_msgSend(v8, "focusSystem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v20, "_postsFocusUpdateNotifications");

  if ((_DWORD)self)
  {
    if (!v10)
      v10 = -[UIFocusUpdateContext _initWithFocusMovementRequest:nextFocusedItem:]([UIFocusUpdateContext alloc], "_initWithFocusMovementRequest:nextFocusedItem:", v8, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "focusSystem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = CFSTR("UIFocusUpdateContextKey");
    v28[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "postNotificationName:object:userInfo:", CFSTR("UIFocusMovementDidFailNotification"), v22, v23);

LABEL_30:
    LOBYTE(self) = 0;
  }
  v11 = 0;
LABEL_32:
  v24 = qword_1ECD7DB80;
  if (!qword_1ECD7DB80)
  {
    v24 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v24, (unint64_t *)&qword_1ECD7DB80);
  }
  v12 = *(id *)(v24 + 8);
  if (os_signpost_id_make_with_pointer(*(os_log_t *)(v24 + 8), v5) - 1 <= 0xFFFFFFFFFFFFFFFDLL
    && os_signpost_enabled(v12))
  {
    _os_signpost_emit_unreliably_with_name_impl();
  }
LABEL_37:

  return (char)self;
}

- (id)__findFocusCandidateInEnvironment:(id)a3 container:(id)a4 forRequest:(id)a5 minimumSearchArea:(CGRect)a6 isLoadingScrollableContainer:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _UIFocusMap *v21;
  void *v22;
  void *v23;
  _UIFocusMap *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;

  v7 = a7;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v14, "focusSystem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "focusItemContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "coordinateSpace");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  _UIFocusRegionContainerFromEnvironmentAndContainer((uint64_t)v16, (uint64_t)v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = [_UIFocusMap alloc];
  objc_msgSend(v14, "focusSystem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "searchInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[_UIFocusMap initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:](v21, "initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:", v22, v20, v19, v23, v7);

  -[_UIFocusMap setMinimumSearchArea:](v24, "setMinimumSearchArea:", x, y, width, height);
  -[_UIFocusMap _beginTrackingSearches](v24, "_beginTrackingSearches");
  -[_UIFocusMap _nextFocusedItemForFocusMovementRequest:](v24, "_nextFocusedItemForFocusMovementRequest:", v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusMap _stopTrackingSearches](v24, "_stopTrackingSearches");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[UIFocusUpdateContext _initWithFocusMovementRequest:nextFocusedItem:]([UIFocusUpdateContext alloc], "_initWithFocusMovementRequest:nextFocusedItem:", v14, v25);

  objc_msgSend(v27, "_setFocusMapSearchInfo:", v26);
  -[_UIFocusMap focusGroupMap](v24, "focusGroupMap");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_updateWithFocusGroupMap:", v28);

  return v27;
}

- (id)_findFocusCandidateWithoutLoadingScrollableContentInEnvironment:(id)a3 container:(id)a4 forRequest:(id)a5 minimumSearchArea:(CGRect)a6
{
  return -[_UIFocusMovementPerformer __findFocusCandidateInEnvironment:container:forRequest:minimumSearchArea:isLoadingScrollableContainer:](self, "__findFocusCandidateInEnvironment:container:forRequest:minimumSearchArea:isLoadingScrollableContainer:", a3, a4, a5, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (id)_findFocusCandidateByExhaustivelySearchingEnvironment:(id)a3 scrollableContainer:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  void *v45;
  uint64_t v46;
  __int16 v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  char v54;
  double v55;
  double v56;
  double v57;
  void *v60;
  void *v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGRect v66;
  CGRect v67;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "focusSystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "focusedItemInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "movementInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "focusItemContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "coordinateSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v64 = v17;
  v65 = v16;
  v62 = v19;
  v63 = v18;

  objc_msgSend(v11, "focusItemContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "coordinateSpace");
  v21 = objc_claimAutoreleasedReturnValue();

  v61 = v12;
  objc_msgSend(v12, "focusedRectInCoordinateSpace:", v21);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v60 = (void *)v21;
  -[_UIFocusMovementPerformer _minimumSearchAreaForContainer:inCoordinateSpace:](self, "_minimumSearchAreaForContainer:inCoordinateSpace:", v9, v21);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  objc_msgSend(v13, "heading");
  v38 = _UIFocusShiftAndExpandRectAlongFocusMovement(v13, v23, v25, v27, v29);
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v45 = 0;
  v46 = -5;
  while ((_UIRectSmartIntersectsRect(v38, v40, v42, v44, v31, v33, v35, v37) & 1) != 0 || !v45)
  {
    v47 = objc_msgSend(v13, "_linearHeading");
    v48 = v38;
    v49 = v40;
    v50 = v42;
    v51 = v44;
    if ((v47 & 0x300) == 0)
    {
      v66.origin.y = v64;
      v66.origin.x = v65;
      v66.size.height = v62;
      v66.size.width = v63;
      v67.origin.x = v38;
      v67.origin.y = v40;
      v67.size.width = v42;
      v67.size.height = v44;
      *(CGRect *)&v48 = CGRectUnion(v66, v67);
    }
    -[_UIFocusMovementPerformer __findFocusCandidateInEnvironment:container:forRequest:minimumSearchArea:isLoadingScrollableContainer:](self, "__findFocusCandidateInEnvironment:container:forRequest:minimumSearchArea:isLoadingScrollableContainer:", v8, v9, v10, 1, v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v52, "_isValidInFocusSystem:", v11) & 1) == 0)
    {
      objc_msgSend(v52, "_focusMapSearchInfo");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "didFindFocusBlockingBoundary");

      if ((v54 & 1) == 0)
      {
        v38 = _UIFocusShiftAndExpandRectAlongFocusMovement(v13, v38, v40, v42, v44);
        v40 = v55;
        v42 = v56;
        v44 = v57;
        v45 = v52;
        if (!__CFADD__(v46++, 1))
          continue;
      }
    }
    goto LABEL_12;
  }
  v52 = v45;
LABEL_12:

  return v52;
}

- (id)_findFocusCandidateBySearchingLinearFocusMovementSequencesForRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v3 = a3;
  objc_msgSend(v3, "focusSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusedItemInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "movementInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "heading");

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__89;
  v26 = __Block_byref_object_dispose__89;
  v27 = 0;
  objc_msgSend(v3, "focusedItemInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __98___UIFocusMovementPerformer__findFocusCandidateBySearchingLinearFocusMovementSequencesForRequest___block_invoke;
  v16[3] = &unk_1E16C6BB8;
  v21 = v8;
  v11 = v6;
  v17 = v11;
  v12 = v4;
  v18 = v12;
  v13 = v3;
  v19 = v13;
  v20 = &v22;
  _UIFocusEnvironmentEnumerateAncestorEnvironments(v10, v16);

  v14 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v14;
}

- (id)_bestCandidateForNonLinearFocusMovement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  NSObject *v43;
  unint64_t v44;
  NSObject *v45;
  void *v46;
  id obj;
  void *v48;
  void *v49;
  uint8_t buf[16];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "focusSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusedItemInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v5;
  objc_msgSend(v5, "focusItemContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = v4;
  -[_UIFocusMovementPerformer _environmentContainersToCheckForRequest:](self, "_environmentContainersToCheckForRequest:", v4);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v52;
    v46 = v6;
    do
    {
      v13 = v8;
      v14 = 0;
      do
      {
        if (*(_QWORD *)v52 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v14);
        objc_msgSend(v15, "owningEnvironment", v46);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "itemContainer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isScrollableContainer")
          && (objc_msgSend(v49, "movementInfo"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              v19 = objc_msgSend(v18, "_shouldLoadScrollableContainer"),
              v18,
              v19))
        {
          -[_UIFocusMovementPerformer _findFocusCandidateByExhaustivelySearchingEnvironment:scrollableContainer:forRequest:](self, "_findFocusCandidateByExhaustivelySearchingEnvironment:scrollableContainer:forRequest:", v16, v17, v49);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            if ((objc_msgSend(v20, "_isValidInFocusSystem:", v48) & 1) != 0)
              goto LABEL_19;
            objc_msgSend(v20, "_focusMapSearchInfo");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "didFindFocusBlockingBoundary");

            v11 = v20;
            if ((v22 & 1) != 0)
              goto LABEL_19;
          }
          else
          {
            v11 = 0;
          }
        }
        else
        {
          -[_UIFocusMovementPerformer _minimumSearchAreaForContainer:inCoordinateSpace:](self, "_minimumSearchAreaForContainer:inCoordinateSpace:", v17, v13);
          -[_UIFocusMovementPerformer _findFocusCandidateWithoutLoadingScrollableContentInEnvironment:container:forRequest:minimumSearchArea:](self, "_findFocusCandidateWithoutLoadingScrollableContentInEnvironment:container:forRequest:minimumSearchArea:", v16, v17, v49);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v20, "_isValidInFocusSystem:", v48) & 1) != 0
            || (objc_msgSend(v20, "_focusMapSearchInfo"),
                v23 = (void *)objc_claimAutoreleasedReturnValue(),
                v24 = objc_msgSend(v23, "didFindFocusBlockingBoundary"),
                v23,
                v11 = v20,
                v24))
          {
LABEL_19:

            v11 = v20;
            v6 = v46;
            v8 = v13;
            goto LABEL_21;
          }
        }

        ++v14;
      }
      while (v10 != v14);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      v10 = v25;
      v6 = v46;
      v8 = v13;
    }
    while (v25);
  }
  else
  {
    v11 = 0;
  }
LABEL_21:

  if (os_variant_has_internal_diagnostics())
  {
    if (!v11)
    {
      __UIFaultDebugAssertLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v43, OS_LOG_TYPE_FAULT, "Non-linear focus movement should always produce a context, even if the focus movement failed.", buf, 2u);
      }

    }
  }
  else if (!v11)
  {
    v44 = _bestCandidateForNonLinearFocusMovement____s_category;
    if (!_bestCandidateForNonLinearFocusMovement____s_category)
    {
      v44 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v44, (unint64_t *)&_bestCandidateForNonLinearFocusMovement____s_category);
    }
    v45 = *(NSObject **)(v44 + 8);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v45, OS_LOG_TYPE_ERROR, "Non-linear focus movement should always produce a context, even if the focus movement failed.", buf, 2u);
    }
  }
  objc_msgSend(v11, "_destinationItemInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFocusEngineCommonEnvironmentScrollableContainerForItems(v6, v26);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v26 && !v27)
  {
    _UIFocusEngineFirstScrollableContainerTupleThatScrollsForItem(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "_setCommonEnvironmentScrollableContainer:", v28);
  objc_msgSend(v26, "focusedRegion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    +[_UIFocusRegionEvaluator frameForRegion:inCoordinateSpace:](_UIFocusRegionEvaluator, "frameForRegion:inCoordinateSpace:", v29, v8);
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    objc_msgSend(v8, "bounds");
    objc_msgSend(v11, "_setDestinationViewDistanceOffscreen:", UIDistanceBetweenRects(v38, v39, v40, v41, v31, v33, v35, v37));
  }

  return v11;
}

- (id)_bestCandidateForLinearFocusMovement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "focusSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusedItemInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "movementInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "heading");
  objc_msgSend(v5, "_focusMovementCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nextItemForRequest:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10
    || (v11 = -[UIFocusUpdateContext _initWithFocusMovementRequest:nextFocusedItem:]([UIFocusUpdateContext alloc], "_initWithFocusMovementRequest:nextFocusedItem:", v4, v10)) == 0)
  {
    -[_UIFocusMovementPerformer _findFocusCandidateBySearchingLinearFocusMovementSequencesForRequest:](self, "_findFocusCandidateBySearchingLinearFocusMovementSequencesForRequest:", v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      -[_UIFocusMovementPerformer _nextLinearCandidateLoadingScrollableContentForRequest:](self, "_nextLinearCandidateLoadingScrollableContentForRequest:", v4);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v11, "_destinationItemInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFocusEngineCommonEnvironmentScrollableContainerForItems(v6, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v12 && !v13)
  {
    _UIFocusEngineFirstScrollableContainerTupleThatScrollsForItem(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "_setCommonEnvironmentScrollableContainer:", v14);

  return v11;
}

- (id)contextForFocusMovement:(id)a3
{
  id v4;
  void *v5;
  __int16 v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "movementInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "heading");

  if ((v6 & 0x330) != 0)
    -[_UIFocusMovementPerformer _bestCandidateForLinearFocusMovement:](self, "_bestCandidateForLinearFocusMovement:", v4);
  else
    -[_UIFocusMovementPerformer _bestCandidateForNonLinearFocusMovement:](self, "_bestCandidateForNonLinearFocusMovement:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_environmentContainersToCheckForRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  NSObject *v26;
  void *v27;
  void *v28;
  uint8_t buf[16];
  uint8_t v30[16];

  v3 = a3;
  objc_msgSend(v3, "movementInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusedItemInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "heading") & 0x300) != 0)
  {
    objc_msgSend(v6, "behavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "treatFirstAndLastHeadingsAsGlobal");

  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v4, "heading");
  v10 = (void *)objc_opt_new();
  objc_msgSend(v5, "item");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "behavior");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v3;
  objc_msgSend(v3, "searchInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "forceFocusToLeaveContainer");

  if (v11)
  {
    v14 = v13 | v8;
    while (1)
    {
      objc_msgSend(v11, "focusItemContainer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        break;
LABEL_17:
      objc_msgSend(v11, "parentFocusEnvironment");
      v18 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v18;
      if (!v18)
        goto LABEL_18;
    }
    +[_UIFocusEnvironmentContainerTuple tupleWithOwningEnvironment:itemContainer:](_UIFocusEnvironmentContainerTuple, "tupleWithOwningEnvironment:itemContainer:", v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v14 & 1) != 0 || (_UIFocusEnvironmentAllowsFocusToLeaveViaHeading(v11, v9) & 1) != 0)
    {
      objc_msgSend(v5, "item");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v17 || !_UIFocusEnvironmentPrefersFocusContainment(v11))
      {

        goto LABEL_16;
      }

      if ((v14 & 1) == 0)
      {
        objc_msgSend(v10, "addObject:", v16);
        v14 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(v10, "addObject:", v16);
    }
    v14 = 1;
    goto LABEL_16;
  }
LABEL_18:
  objc_msgSend(v10, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "owningEnvironment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 != v6)
  {
    objc_msgSend(v6, "focusItemContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      +[_UIFocusEnvironmentContainerTuple tupleWithOwningEnvironment:itemContainer:](_UIFocusEnvironmentContainerTuple, "tupleWithOwningEnvironment:itemContainer:", v6, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v22);

    }
    else if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v30 = 0;
        _os_log_fault_impl(&dword_185066000, v26, OS_LOG_TYPE_FAULT, "FocusSystem does not have a focusItemContainer.", v30, 2u);
      }

    }
    else
    {
      v23 = _environmentContainersToCheckForRequest____s_category;
      if (!_environmentContainersToCheckForRequest____s_category)
      {
        v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v23, (unint64_t *)&_environmentContainersToCheckForRequest____s_category);
      }
      v24 = *(NSObject **)(v23 + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "FocusSystem does not have a focusItemContainer.", buf, 2u);
      }
    }

  }
  return v10;
}

- (id)_dummyFocusItemForFocusMovement:(id)a3 searchArea:(CGRect)a4 parent:(id)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double MaxX;
  double v18;
  double MaxY;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v26;
  CGRect v27;
  CGRect v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v13 = a5;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMovementPerformer.m"), 484, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parent != nil"));

  }
  if ((objc_msgSend(v12, "heading") & 0x300) != 0)
  {
    objc_msgSend(v13, "focusItemContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "coordinateSpace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    MaxX = v16;
    MaxY = v18;
    v21 = v20;
    v23 = v22;

    if ((objc_msgSend(v12, "_shouldLoadScrollableContainer") & 1) == 0)
    {
      MaxX = *MEMORY[0x1E0C9D648];
      MaxY = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    if ((objc_msgSend(v12, "heading") & 0x100) != 0)
    {
      MaxX = x - v21;
      MaxY = y - v23;
    }
    else if ((objc_msgSend(v12, "heading") & 0x200) != 0)
    {
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      MaxX = CGRectGetMaxX(v27);
      v28.origin.x = x;
      v28.origin.y = y;
      v28.size.width = width;
      v28.size.height = height;
      MaxY = CGRectGetMaxY(v28);
    }
    v24 = (void *)objc_opt_new();
    objc_msgSend(v24, "setFrame:", MaxX, MaxY, v21, v23);
    objc_msgSend(v24, "setParentFocusEnvironment:", v13);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_nextLinearCandidateLoadingScrollableContentForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  _UIFocusMovementRequest *v24;
  void *v25;
  _UIFocusMovementRequest *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  int v52;
  unint64_t v53;
  _UIFocusMovementInfo *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  char v59;
  uint64_t v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  double v70;
  double v71;
  CGFloat v72;
  double MinX;
  unint64_t v74;
  double MaxX;
  double MinY;
  double MaxY;
  void *v78;
  void *v79;
  uint64_t v80;
  id v81;
  void *v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  id rect;
  CGFloat recta;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  _UIFocusMovementPerformer *v100;
  void *v101;
  void *v102;
  char v103;
  void *v104;
  void *v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;

  v4 = a3;
  objc_msgSend(v4, "focusSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusedItemInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "movementInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v6;
  objc_msgSend(v6, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusMovementPerformer _environmentContainersToCheckForRequest:](self, "_environmentContainersToCheckForRequest:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {
    v56 = 0;
    goto LABEL_51;
  }
  v83 = v8;
  v10 = 0;
  LOBYTE(v8) = 1;
  v97 = v5;
  v98 = v4;
  v99 = v9;
  v100 = self;
  while (1)
  {
    v103 = (char)v8;
    objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "owningEnvironment");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "focusItemContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "coordinateSpace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFocusMovementPerformer _minimumSearchAreaForContainer:inCoordinateSpace:shouldLoadScrollableContainer:](self, "_minimumSearchAreaForContainer:inCoordinateSpace:shouldLoadScrollableContainer:", v12, v14, objc_msgSend(v7, "_shouldLoadScrollableContainer"));
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    -[_UIFocusMovementPerformer _dummyFocusItemForFocusMovement:searchArea:parent:](self, "_dummyFocusItemForFocusMovement:searchArea:parent:", v7, v5, v16, v18, v20, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = [_UIFocusMovementRequest alloc];
    objc_msgSend(v4, "focusSystem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[_UIFocusMovementRequest initWithFocusSystem:](v24, "initWithFocusSystem:", v25);

    if (v23)
    {
      +[_UIFocusItemInfo infoWithItem:](_UIFocusItemInfo, "infoWithItem:", v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFocusMovementRequest setFocusedItemInfo:](v26, "setFocusedItemInfo:", v27);

    }
    else
    {
      -[_UIFocusMovementRequest setFocusedItemInfo:](v26, "setFocusedItemInfo:", v96);
    }
    objc_msgSend(v4, "searchInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFocusMovementRequest setSearchInfo:](v26, "setSearchInfo:", v28);

    v101 = v11;
    v104 = v12;
    v102 = (void *)v23;
    if (!objc_msgSend(v11, "isScrollableContainer")
      || !_UIFocusEngineScrollableContainerCanScroll(v12))
    {
      v52 = 0;
      v53 = 15;
      goto LABEL_12;
    }
    rect = v12;
    -[_UIFocusMovementRequest focusedItemInfo](v26, "focusedItemInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "item");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "parentFocusEnvironment");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "focusItemContainer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v95 = v32;
    v93 = v18;
    v94 = v16;
    v91 = v22;
    v92 = v20;
    v90 = v30;
    if (!v32 || v102 == v30)
    {
      objc_msgSend(v30, "frame");
      v45 = v63;
      v47 = v64;
      v49 = v65;
      v51 = v66;
      v42 = rect;
    }
    else
    {
      objc_msgSend(v32, "coordinateSpace");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "frame");
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v42 = rect;
      objc_msgSend(rect, "coordinateSpace");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "convertRect:toCoordinateSpace:", v43, v35, v37, v39, v41);
      v45 = v44;
      v47 = v46;
      v49 = v48;
      v51 = v50;

    }
    v67 = _UIFocusItemScrollableContainerContentBounds(v42);
    v69 = v68;
    v84 = v70;
    v85 = v68;
    v72 = v71;
    v86 = v71;
    v106.origin.x = v45;
    v106.origin.y = v47;
    v106.size.width = v49;
    v106.size.height = v51;
    v87 = v45;
    MinX = CGRectGetMinX(v106);
    v107.origin.x = v67;
    v107.origin.y = v69;
    v107.size.width = v84;
    v107.size.height = v72;
    if (MinX <= CGRectGetMinX(v107))
      v74 = 11;
    else
      v74 = 15;
    v108.origin.x = v45;
    v108.origin.y = v47;
    v108.size.width = v49;
    v108.size.height = v51;
    recta = v51;
    MaxX = CGRectGetMaxX(v108);
    v109.origin.x = v67;
    v109.origin.y = v85;
    v109.size.width = v84;
    v109.size.height = v86;
    if (MaxX >= CGRectGetMaxX(v109))
      v74 &= 7u;
    v110.origin.x = v87;
    v110.origin.y = v47;
    v110.size.width = v49;
    v110.size.height = v51;
    MinY = CGRectGetMinY(v110);
    v111.origin.x = v67;
    v111.origin.y = v85;
    v111.size.width = v84;
    v111.size.height = v86;
    if (MinY <= CGRectGetMinY(v111))
      v74 &= 0xEu;
    v112.origin.x = v87;
    v112.origin.y = v47;
    v112.size.width = v49;
    v112.size.height = recta;
    MaxY = CGRectGetMaxY(v112);
    v113.origin.x = v67;
    v113.origin.y = v85;
    v113.size.width = v84;
    v113.size.height = v86;
    v53 = MaxY >= CGRectGetMaxY(v113) ? v74 & 0xFFFFFFFFFFFFFFFDLL : v74;
    if ((v103 & 1) != 0)
    {
      objc_msgSend(v4, "focusSystem");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = objc_msgSend(v78, "_isScrollingScrollableContainer:targetContentOffset:", v42, 0) ^ 1;

    }
    else
    {
      LOBYTE(v8) = 0;
    }
    v18 = v93;
    v16 = v94;
    v22 = v91;
    v20 = v92;

    if (v53)
      break;
    v9 = v99;
    self = v100;
    v79 = v101;
LABEL_46:

    if (++v10 >= (unint64_t)objc_msgSend(v9, "count"))
    {
      v56 = 0;
      goto LABEL_50;
    }
  }
  v103 = (char)v8;
  v52 = 1;
LABEL_12:
  v54 = -[_UIFocusMovementInfo initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:]([_UIFocusMovementInfo alloc], "initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:", v53, objc_msgSend(v7, "heading"), objc_msgSend(v7, "_isInitialMovement"), 1, objc_msgSend(v7, "_isLooping"), objc_msgSend(v7, "_groupFilter"), objc_msgSend(v7, "_inputType"));
  -[_UIFocusMovementRequest setMovementInfo:](v26, "setMovementInfo:", v54);

  if (v52 && objc_msgSend(v7, "_shouldLoadScrollableContainer"))
  {
    self = v100;
    -[_UIFocusMovementPerformer _findFocusCandidateByExhaustivelySearchingEnvironment:scrollableContainer:forRequest:](v100, "_findFocusCandidateByExhaustivelySearchingEnvironment:scrollableContainer:forRequest:", v105, v104, v26);
    v55 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    self = v100;
    -[_UIFocusMovementPerformer _findFocusCandidateWithoutLoadingScrollableContentInEnvironment:container:forRequest:minimumSearchArea:](v100, "_findFocusCandidateWithoutLoadingScrollableContentInEnvironment:container:forRequest:minimumSearchArea:", v105, v104, v26, v16, v18, v20, v22);
    v55 = objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v55;
  v5 = v97;
  v4 = v98;
  v9 = v99;
  objc_msgSend(v98, "movementInfo");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "_restoreRestrictedFocusMovementWithMovement:", v57);

  if (!objc_msgSend(v56, "_isValidInFocusSystem:", v97)
    || !-[_UIFocusMovementPerformer _isMovementValidForFocusSequences:](self, "_isMovementValidForFocusSequences:", v56))
  {
    objc_msgSend(0, "_focusMapSearchInfo");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "didFindFocusBlockingBoundary");

    if ((v59 & 1) == 0)
    {
      if ((v103 & 1) != 0)
      {
        if (v10 == objc_msgSend(v99, "count") - 1)
        {
          objc_msgSend(v56, "previouslyFocusedItem");
          v60 = objc_claimAutoreleasedReturnValue();
          if (v60
            && (v61 = (void *)v60,
                objc_msgSend(v56, "nextFocusedItem"),
                v62 = (void *)objc_claimAutoreleasedReturnValue(),
                v62,
                v61,
                !v62))
          {
            +[_UIFocusItemInfo infoWithItem:](_UIFocusItemInfo, "infoWithItem:", 0);
            v80 = objc_claimAutoreleasedReturnValue();

            LOBYTE(v8) = 0;
            --v10;
            v96 = (void *)v80;
          }
          else
          {
            LOBYTE(v8) = 0;
          }
          self = v100;
        }
        else
        {
          LOBYTE(v8) = 1;
        }
      }
      else
      {
        LOBYTE(v8) = 0;
      }
      v79 = v101;

      goto LABEL_46;
    }
  }

LABEL_50:
  v8 = v83;
LABEL_51:
  v81 = v56;

  return v81;
}

- (BOOL)_isMovementValidForFocusSequences:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v4 = objc_msgSend(v3, "focusHeading");
  objc_msgSend(v3, "nextFocusedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63___UIFocusMovementPerformer__isMovementValidForFocusSequences___block_invoke;
  v8[3] = &unk_1E16C6C08;
  v6 = v3;
  v9 = v6;
  v10 = &v12;
  v11 = v4;
  _UIFocusEnvironmentEnumerateAncestorEnvironments(v5, v8);

  LOBYTE(v5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v5;
}

- (CGRect)_minimumSearchAreaForContainer:(id)a3 inCoordinateSpace:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[_UIFocusMovementPerformer _minimumSearchAreaForContainer:inCoordinateSpace:shouldLoadScrollableContainer:](self, "_minimumSearchAreaForContainer:inCoordinateSpace:shouldLoadScrollableContainer:", a3, a4, 1);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_minimumSearchAreaForContainer:(id)a3 inCoordinateSpace:(id)a4 shouldLoadScrollableContainer:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
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
  double x;
  double width;
  double y;
  double height;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGRect v43;
  CGRect v44;
  CGRect result;
  CGRect v46;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "coordinateSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinateSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v9, "convertRect:toCoordinateSpace:", v8);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  x = v12 + -1.0;
  width = v16 + 2.0;
  y = v14 + -1.0;
  height = v18 + 2.0;
  if (v5 && _UIFocusItemContainerIsScrollableContainer(v7))
  {
    v23 = v7;
    objc_msgSend(v23, "contentSize");
    v25 = v24;
    v27 = v26;
    v28 = *MEMORY[0x1E0C9D538];
    v29 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v23, "coordinateSpace");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "convertRect:fromCoordinateSpace:", v30, v28, v29, v25, v27);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;

    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    v46.origin.x = v32;
    v46.origin.y = v34;
    v46.size.width = v36;
    v46.size.height = v38;
    v44 = CGRectUnion(v43, v46);
    x = v44.origin.x;
    y = v44.origin.y;
    width = v44.size.width;
    height = v44.size.height;
  }

  v39 = x;
  v40 = y;
  v41 = width;
  v42 = height;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (_UIFocusMovementPerformerDelegate)delegate
{
  return (_UIFocusMovementPerformerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
