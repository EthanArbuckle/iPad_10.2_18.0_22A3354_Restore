@implementation _UIFocusRegionMap

- (_UIFocusRegionMap)initWithRootView:(id)a3 focusSystem:(id)a4
{
  id v6;
  id v7;
  _UIFocusRegionMap *v8;
  _UIFocusRegionMap *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIFocusRegionMap;
  v8 = -[_UIFocusRegionMap init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_rootView, v6);
    objc_storeStrong((id *)&v9->_focusSystem, a4);
  }

  return v9;
}

- (id)nearestCandidateFromRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[_UIFocusMovementInfo _movementWithHeading:isInitial:](_UIFocusMovementInfo, "_movementWithHeading:isInitial:", 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMap rootView](self, "rootView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_focusSystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_focusedView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMap _nearestCandidateForFocusMovement:fromFocusedView:withFocusedRect:includingFocusedView:](self, "_nearestCandidateForFocusMovement:fromFocusedView:withFocusedRect:includingFocusedView:", v8, v11, 0, x, y, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_nearestCandidateForFocusMovement:(id)a3 fromFocusedView:(id)a4 withFocusedRect:(CGRect)a5 includingFocusedView:(BOOL)a6
{
  uint64_t v6;
  double height;
  double width;
  double y;
  double x;
  id v13;
  uint64_t v14;
  id v15;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  _BOOL8 v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  double v86;
  double v87;
  id v88;
  double v89;
  double v90;
  unsigned int v91;
  void *v92;
  double v93;
  void *v94;
  double v95;
  uint64_t v96;
  _UIFocusRegionMap *v97;
  double v98;
  uint64_t v99;
  double v100;
  uint64_t v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  uint64_t v108;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v108 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v102 = a4;
  v88 = v13;
  v14 = objc_msgSend(v13, "heading");
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_UIFocusRegionMap minimumSearchArea](self, "minimumSearchArea");
  -[_UIFocusRegionMap _focusCandidateSearchOriginForFocusedFrame:heading:minimumSearchArea:](self, "_focusCandidateSearchOriginForFocusedFrame:heading:minimumSearchArea:", v14, x, y, width, height, v16, v17, v18, v19);
  v21 = v20;
  v23 = v22;
  -[_UIFocusRegionMap minimumSearchArea](self, "minimumSearchArea");
  v86 = y;
  v87 = x;
  -[_UIFocusRegionMap _focusCandidateSearchRectForFocusedFrame:heading:minimumSearchArea:](self, "_focusCandidateSearchRectForFocusedFrame:heading:minimumSearchArea:", v14, x, y, width, height, v24, v25, v26, v27);
  v29 = v28;
  v31 = v30;
  v32 = x;
  v33 = y;
  v35 = v34;
  v37 = v36;
  -[_UIFocusRegionMap _viewSearchRectForFocusedFrame:focusCandidateSearchRect:includesFocusedFrame:](self, "_viewSearchRectForFocusedFrame:focusCandidateSearchRect:includesFocusedFrame:", v6, v32, v33, width, height, v29, v31);
  v98 = v39;
  v100 = v38;
  v93 = v41;
  v95 = v40;
  -[_UIFocusRegionMap rootView](self, "rootView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMap focusSystem](self, "focusSystem");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIFocusRegionMapSnapshotRequest requestWithRootView:focusSystem:](_UIFocusRegionMapSnapshotRequest, "requestWithRootView:focusSystem:", v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v44, "setSnapshotRect:", v29, v31, v35, v37);
  objc_msgSend(v44, "setViewSearchRect:", v100, v98, v95, v93);
  objc_msgSend(v44, "setFocusedRect:", v87, v86, width, height);
  v96 = v14;
  objc_msgSend(v44, "setFocusHeading:", v14);
  v92 = v44;
  objc_msgSend(v44, "takeSnapshot");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v15;
  objc_msgSend(v15, "addObject:", v45);
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  objc_msgSend(v45, "sortedFocusContainerGuideMapEntries");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
  if (v101)
  {
    v99 = *(_QWORD *)v104;
    v47 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v89 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v90 = *MEMORY[0x1E0C9D648];
    v48 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v49 = v14;
    v97 = self;
    v91 = v6;
LABEL_3:
    v50 = 0;
    while (1)
    {
      if (*(_QWORD *)v104 != v99)
        objc_enumerationMutation(v46);
      v51 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v50);
      objc_msgSend(v51, "focusContainerGuide");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "focusableRegionMapEntriesLimitedByFocusContainerGuide:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v53, "count"))
      {
        v54 = 0;
        v55 = 0;
        v56 = 1;
      }
      else
      {
        objc_msgSend(v51, "focusContainerGuide");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "preferredFocusedView");
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = v58 != 0;
        if (v58)
        {
          objc_msgSend(v51, "focusContainerGuide");
          v55 = objc_claimAutoreleasedReturnValue();
          v54 = 0;
        }
        else
        {
          v59 = (void *)objc_msgSend(v92, "copy");
          objc_msgSend(v51, "focusContainerGuide");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "_focusRegionFrame");
          objc_msgSend(v59, "setSnapshotRect:");

          objc_msgSend(v59, "snapshotRect");
          -[_UIFocusRegionMap _viewSearchRectForFocusedFrame:focusCandidateSearchRect:includesFocusedFrame:](v97, "_viewSearchRectForFocusedFrame:focusCandidateSearchRect:includesFocusedFrame:", 0, v87, v86, width, height, v61, v62, v63, v64);
          objc_msgSend(v59, "setViewSearchRect:");
          objc_msgSend(v59, "setFocusedRect:", v90, v89, v47, v48);
          objc_msgSend(v59, "setFocusHeading:", 0);
          objc_msgSend(v51, "focusContainerGuide");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "owningView");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setFocusableRegionAncestorView:", v66);

          objc_msgSend(v59, "takeSnapshot");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "addObject:", v54);
          objc_msgSend(v54, "allFocusableRegionMapEntries");
          v67 = v46;
          v68 = objc_claimAutoreleasedReturnValue();

          v6 = v91;
          v55 = 0;
          v53 = (void *)v68;
          v46 = v67;
          v49 = v96;
        }

        self = v97;
      }
      if (objc_msgSend(v53, "count"))
      {
        -[_UIFocusRegionMap _closestFocusableRegionInArray:toPoint:usingHeading:withFocusedView:consideringFavoredRegion:includingFocusedView:](self, "_closestFocusableRegionInArray:toPoint:usingHeading:withFocusedView:consideringFavoredRegion:includingFocusedView:", v53, v49, v102, v56, v6, v21, v23);
        v69 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v69 = 0;
      }
      if (v69 | v55)
        break;

      if (v101 == ++v50)
      {
        v101 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
        if (v101)
          goto LABEL_3;
        goto LABEL_18;
      }
    }
    if (v54)
    {
      v70 = v54;

      v45 = v70;
    }

    if (v69)
      goto LABEL_23;
  }
  else
  {
LABEL_18:

    v55 = 0;
  }
  objc_msgSend(v45, "allFocusableRegionMapEntries");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMap _closestFocusableRegionInArray:toPoint:usingHeading:withFocusedView:consideringFavoredRegion:includingFocusedView:](self, "_closestFocusableRegionInArray:toPoint:usingHeading:withFocusedView:consideringFavoredRegion:includingFocusedView:", v71, v96, v102, 1, v6, v21, v23);
  v69 = objc_claimAutoreleasedReturnValue();

LABEL_23:
  objc_msgSend((id)v69, "focusableRegion");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "_isPromiseFocusRegion");

  v74 = v94;
  if (v73)
  {
    v75 = v6;
    do
    {
      objc_msgSend(v45, "setPrivateSnaphot:", 1);
      objc_msgSend(v45, "_snapshotByFulfillingPromiseFocusRegionEntry:", v69);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v94, "addObject:", v76);
      objc_msgSend(v76, "allFocusableRegionMapEntries");
      v77 = objc_claimAutoreleasedReturnValue();
      -[_UIFocusRegionMap _closestFocusableRegionInArray:toPoint:usingHeading:withFocusedView:consideringFavoredRegion:includingFocusedView:](self, "_closestFocusableRegionInArray:toPoint:usingHeading:withFocusedView:consideringFavoredRegion:includingFocusedView:", v77, v96, v102, 1, v75, v21, v23);
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v78, "focusableRegion");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v77) = objc_msgSend(v79, "_isPromiseFocusRegion");

      v45 = v76;
      v69 = (uint64_t)v78;
    }
    while ((v77 & 1) != 0);
    if (v78)
      goto LABEL_27;
  }
  else
  {
    v78 = (void *)v69;
    v76 = v45;
    if (v69)
    {
LABEL_27:
      objc_msgSend(v78, "focusableRegion");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v88;
      -[_UIFocusRegionMap _contextWithSourceView:focusedRegion:movement:](self, "_contextWithSourceView:focusedRegion:movement:", v102, v80, v88);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v94, "lastObject");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "focusableRegion");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "_didChooseFocusCandidateRegion:", v84);

      v74 = v94;
      goto LABEL_32;
    }
  }
  v81 = v88;
  if (v55)
  {
    -[_UIFocusRegionMap _contextWithSourceView:focusedContainerGuide:movement:](self, "_contextWithSourceView:focusedContainerGuide:movement:", v102, v55, v88);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v82 = 0;
  }
LABEL_32:
  -[_UIFocusRegionMap setLastSnapshot:](self, "setLastSnapshot:", v76);
  objc_msgSend(v82, "_setRegionMapSnapshots:", v74);

  return v82;
}

- (id)linearlyOrderedCandidatesForFocusMovement:(id)a3 fromView:(id)a4 indexForFocusedView:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id obj;
  _UIFocusRegionMap *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v24 = self;
  v25 = v8;
  -[_UIFocusRegionMap linearlyOrderedFocusRegionMapEntriesForFocusMovement:fromView:](self, "linearlyOrderedFocusRegionMapEntriesForFocusMovement:fromView:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v16, "focusableRegion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_focusRegionView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v16, "focusableRegion");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIFocusRegionMap _contextWithSourceView:focusedRegion:movement:](v24, "_contextWithSourceView:focusedRegion:movement:", v9, v19, v25);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "addObject:", v20);
          if (a5)
          {
            objc_msgSend(v16, "focusableRegion");
            v21 = (id)objc_claimAutoreleasedReturnValue();

            if (v21 == v9)
              *a5 = objc_msgSend(v11, "count") - 1;
          }

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v13);
  }

  return v11;
}

- (id)linearlyOrderedFocusRegionMapEntriesForFocusMovement:(id)a3 fromView:(id)a4
{
  id v6;
  id v7;
  void *v8;
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  char v29;
  char v30;

  v6 = a4;
  v7 = a3;
  -[_UIFocusRegionMap rootView](self, "rootView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMap focusSystem](self, "focusSystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIFocusRegionMapSnapshotRequest requestWithRootView:focusSystem:](_UIFocusRegionMapSnapshotRequest, "requestWithRootView:focusSystem:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_focusRegionFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(v10, "setFocusedRect:", v12, v14, v16, v18);
  v19 = objc_msgSend(v7, "heading");

  objc_msgSend(v10, "setFocusHeading:", v19);
  objc_msgSend(v10, "setIncludeFocusContainerGuides:", 0);
  objc_msgSend(v10, "setClipToSnapshotRect:", 0);
  objc_msgSend(v10, "takeSnapshot");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMap focusSystem](self, "focusSystem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMap rootView](self, "rootView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v21, "_shouldReverseLayoutDirectionForEnvironment:", v22);

  -[_UIFocusRegionMap focusSystem](self, "focusSystem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMap rootView](self, "rootView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v23, "_shouldReverseLinearWrappingForEnvironment:", v24);

  objc_msgSend(v20, "allFocusableRegionMapEntries");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __83___UIFocusRegionMap_linearlyOrderedFocusRegionMapEntriesForFocusMovement_fromView___block_invoke;
  v28[3] = &__block_descriptor_34_e67_q24__0___UIFocusableRegionMapEntry_8___UIFocusableRegionMapEntry_16l;
  v29 = (char)v8;
  v30 = (char)v9;
  objc_msgSend(v25, "sortedArrayUsingComparator:", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIFocusRegionMap setLastSnapshot:](self, "setLastSnapshot:", v20);
  return v26;
}

- (id)_closestFocusableRegionInArray:(id)a3 toPoint:(CGPoint)a4 usingHeading:(unint64_t)a5 withFocusedView:(id)a6 consideringFavoredRegion:(BOOL)a7 includingFocusedView:(BOOL)a8
{
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  double v20;
  uint64_t i;
  void *v22;
  id v23;
  double MidX;
  CGFloat MidY;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  void *v33;
  _BOOL4 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  CGRect v41;
  CGRect v42;

  v34 = a8;
  y = a4.y;
  x = a4.x;
  v40 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusRegionMap.m"), 234, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusableRegionMapEntries"));

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v36;
    v20 = 1.79769313e308;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v15);
        v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (v14
          && (objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "focusableRegion"),
              v23 = (id)objc_claimAutoreleasedReturnValue(),
              v23,
              v23 == v14))
        {
          if (v34 && !v18)
            v18 = v22;
        }
        else
        {
          objc_msgSend(v22, "frame");
          MidX = CGRectGetMidX(v41);
          objc_msgSend(v22, "frame");
          MidY = CGRectGetMidY(v42);
          v26 = sqrt((MidX - x) * (MidX - x) + (MidY - y) * (MidY - y));
          if (v26 < v20)
          {
            objc_msgSend(v22, "focusableRegion");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "_focusRegionView");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28
              || (objc_msgSend(v22, "focusableRegion"),
                  v29 = (void *)objc_claimAutoreleasedReturnValue(),
                  v30 = objc_msgSend(v29, "_isPromiseFocusRegion"),
                  v29,
                  v30))
            {
              v31 = v22;

              v18 = v31;
              v20 = v26;
            }

          }
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (CGPoint)_focusCandidateSearchOriginForFocusedFrame:(CGRect)a3 heading:(unint64_t)a4 minimumSearchArea:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double MidY;
  CGFloat MidX;
  CGPoint result;
  CGRect v18;
  CGRect v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    v14 = _UIRectDeparturePointAlongFocusHeading((a4 >> 1) & 0x14 | (2 * a4) & 0x28 | (__rbit32(a4) >> 30), x, y, width, height);
  }
  else
  {
    v18.origin.x = v13;
    v18.origin.y = v12;
    v18.size.width = v11;
    v18.size.height = v10;
    MidX = CGRectGetMidX(v18);
    v19.origin.x = v13;
    v19.origin.y = v12;
    v19.size.width = v11;
    v19.size.height = v10;
    MidY = CGRectGetMidY(v19);
    v14 = MidX;
  }
  result.y = MidY;
  result.x = v14;
  return result;
}

- (CGRect)_focusCandidateSearchRectForFocusedFrame:(CGRect)a3 heading:(unint64_t)a4 minimumSearchArea:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  char v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double MinX;
  double MinY;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double MaxY;
  double v27;
  double MaxX;
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
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat rect;
  CGFloat rect_16;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    if ((v9 & 0xC) == 0 || (v9 & 4) != 0)
    {
      v51.origin.x = v13;
      v51.origin.y = v12;
      v51.size.width = v11;
      v51.size.height = v10;
      MinX = CGRectGetMinX(v51);
    }
    else
    {
      v50.origin.x = v13;
      v50.origin.y = v12;
      v50.size.width = v11;
      v50.size.height = v10;
      MinX = CGRectGetMaxX(v50);
    }
    v47 = MinX;
    if ((v9 & 3) == 0 || (v9 & 1) != 0)
    {
      v53.origin.x = v13;
      v53.origin.y = v12;
      v53.size.width = v11;
      v53.size.height = v10;
      MinY = CGRectGetMinY(v53);
    }
    else
    {
      v52.origin.x = v13;
      v52.origin.y = v12;
      v52.size.width = v11;
      v52.size.height = v10;
      MinY = CGRectGetMaxY(v52);
    }
    v46 = MinY;
    rect = x;
    v54.origin.x = x;
    v54.origin.y = y;
    v54.size.width = width;
    rect_16 = height;
    v54.size.height = height;
    v21 = CGRectGetMinY(v54);
    v55.origin.x = v13;
    v55.origin.y = v12;
    v55.size.width = v11;
    v55.size.height = v10;
    v22 = CGRectGetMinY(v55);
    v23 = v22;
    if ((v9 & 3) != 0 && (v9 & 0xC) != 0)
    {
      if (v21 < v22)
        v22 = v21;
      v44 = v22;
      v56.origin.y = y;
      v56.origin.x = rect;
      v56.size.width = width;
      v56.size.height = rect_16;
      v24 = CGRectGetMinX(v56);
      v57.origin.x = v13;
      v57.origin.y = v12;
      v57.size.width = v11;
      v57.size.height = v10;
      v25 = CGRectGetMinX(v57);
      if (v24 < v25)
        v25 = v24;
      v42 = v25;
      v58.origin.x = rect;
      v58.origin.y = y;
      v58.size.width = width;
      v58.size.height = rect_16;
      MaxY = CGRectGetMaxY(v58);
      v59.origin.x = v13;
      v59.origin.y = v12;
      v59.size.width = v11;
      v59.size.height = v10;
      v27 = CGRectGetMaxY(v59);
      if (MaxY < v27)
        MaxY = v27;
      v60.origin.x = rect;
      v60.origin.y = y;
      v60.size.width = width;
      v60.size.height = rect_16;
      MaxX = CGRectGetMaxX(v60);
      v61.origin.x = v13;
      v61.origin.y = v12;
      v61.size.width = v11;
      v61.size.height = v10;
      v29 = CGRectGetMaxX(v61);
      if (MaxX >= v29)
        v29 = MaxX;
      if ((v9 & 4) != 0)
        v30 = v42;
      else
        v30 = v29;
      if ((v9 & 1) != 0)
        v31 = v44;
      else
        v31 = MaxY;
      goto LABEL_43;
    }
    v62.origin.x = v13;
    v62.origin.y = v12;
    v62.size.width = v11;
    v62.size.height = v10;
    v32 = v23 - CGRectGetHeight(v62);
    if (v21 < v32)
      v32 = v21;
    v45 = v32;
    v63.origin.x = rect;
    v63.origin.y = y;
    v63.size.width = width;
    v63.size.height = rect_16;
    v33 = CGRectGetMinX(v63);
    v64.origin.x = v13;
    v64.origin.y = v12;
    v64.size.width = v11;
    v64.size.height = v10;
    v34 = CGRectGetMinX(v64);
    v65.origin.x = v13;
    v65.origin.y = v12;
    v65.size.width = v11;
    v65.size.height = v10;
    v35 = v34 - CGRectGetWidth(v65);
    if (v33 < v35)
      v35 = v33;
    v43 = v35;
    v66.origin.x = rect;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = rect_16;
    v36 = CGRectGetMaxY(v66);
    v67.origin.x = v13;
    v67.origin.y = v12;
    v67.size.width = v11;
    v67.size.height = v10;
    v37 = CGRectGetMaxY(v67);
    v68.origin.x = v13;
    v68.origin.y = v12;
    v68.size.width = v11;
    v68.size.height = v10;
    v38 = v37 + CGRectGetHeight(v68);
    if (v36 < v38)
      v36 = v38;
    v69.origin.x = rect;
    v69.origin.y = y;
    v69.size.height = rect_16;
    v69.size.width = width;
    v39 = CGRectGetMaxX(v69);
    v70.origin.x = v13;
    v70.origin.y = v12;
    v70.size.width = v11;
    v70.size.height = v10;
    v40 = CGRectGetMaxX(v70);
    v71.origin.x = v13;
    v71.origin.y = v12;
    v71.size.width = v11;
    v71.size.height = v10;
    v41 = v40 + CGRectGetWidth(v71);
    if (v39 >= v41)
      v41 = v39;
    if ((v9 & 4) != 0)
      v30 = v43;
    else
      v30 = v41;
    if ((v9 & 1) != 0)
      v31 = v45;
    else
      v31 = v36;
    if ((v9 & 0xC) != 0)
    {
      if ((v9 & 3) != 0)
      {
LABEL_43:
        v72.origin.y = v46;
        v72.origin.x = v47;
        v72.size.width = v30 - v47;
        v72.size.height = v31 - v46;
        *(CGRect *)&v15 = CGRectStandardize(v72);
        goto LABEL_46;
      }
    }
    else
    {
      v73.origin.x = v13;
      v73.origin.y = v12;
      v73.size.width = v11;
      v73.size.height = v10;
      v30 = CGRectGetMaxX(v73);
      if ((v9 & 3) != 0)
        goto LABEL_43;
    }
    v74.origin.x = v13;
    v74.origin.y = v12;
    v74.size.width = v11;
    v74.size.height = v10;
    v31 = CGRectGetMaxY(v74);
    goto LABEL_43;
  }
  -[_UIFocusRegionMap minimumSearchArea](self, "minimumSearchArea");
LABEL_46:
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_rectThatJustBarelyIntersectsRect:(CGRect)a3 startingRect:(CGRect)a4
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double MaxX;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat MinX;
  CGFloat MinY;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double MaxY;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  int has_internal_diagnostics;
  BOOL v30;
  double v31;
  double v32;
  double v33;
  double v34;
  NSObject *v35;
  unint64_t v36;
  NSObject *v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  CGFloat rect;
  uint8_t buf[16];
  uint8_t v43[16];
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect result;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  height = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  v38 = a4.size.height;
  MaxX = CGRectGetMaxX(a4);
  v39 = v10;
  v44.origin.x = v10;
  v44.origin.y = v9;
  rect = v8;
  v44.size.width = v8;
  v44.size.height = height;
  v12 = height;
  v40 = height;
  if (MaxX <= CGRectGetMinX(v44))
  {
    v14 = v9;
    v45.origin.x = v10;
    v45.origin.y = v9;
    v45.size.width = rect;
    v45.size.height = v12;
    MinX = CGRectGetMinX(v45);
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = v38;
    MinY = CGRectGetMinY(v46);
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = v38;
    v48.size.height = CGRectGetHeight(v47);
    v48.size.width = 90.0;
    v48.origin.x = MinX;
    v48.origin.y = MinY;
    v12 = v40;
    v73.origin.x = x;
    v73.origin.y = y;
    v73.size.width = width;
    v73.size.height = v38;
    v49 = CGRectUnion(v48, v73);
    x = v49.origin.x;
    y = v49.origin.y;
    width = v49.size.width;
    v13 = v49.size.height;
  }
  else
  {
    v13 = v38;
    v14 = v9;
  }
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = v13;
  v17 = CGRectGetMinX(v50);
  v18 = v39;
  v51.origin.x = v39;
  v51.origin.y = v14;
  v51.size.width = rect;
  v51.size.height = v12;
  if (v17 >= CGRectGetMaxX(v51))
  {
    v52.origin.x = v39;
    v52.origin.y = v14;
    v52.size.width = rect;
    v52.size.height = v12;
    v19 = CGRectGetMaxX(v52) + -90.0;
    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = width;
    v53.size.height = v13;
    v20 = CGRectGetMinY(v53);
    v54.origin.x = x;
    v54.origin.y = y;
    v54.size.width = width;
    v54.size.height = v13;
    v55.size.height = CGRectGetHeight(v54);
    v55.size.width = 90.0;
    v55.origin.x = v19;
    v55.origin.y = v20;
    v18 = v39;
    v12 = v40;
    v74.origin.x = x;
    v74.origin.y = y;
    v74.size.width = width;
    v74.size.height = v13;
    v56 = CGRectUnion(v55, v74);
    x = v56.origin.x;
    y = v56.origin.y;
    width = v56.size.width;
    v13 = v56.size.height;
  }
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = width;
  v57.size.height = v13;
  MaxY = CGRectGetMaxY(v57);
  v58.origin.x = v18;
  v58.origin.y = v14;
  v58.size.width = rect;
  v58.size.height = v12;
  if (MaxY <= CGRectGetMinY(v58))
  {
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = v13;
    v22 = CGRectGetMinX(v59);
    v60.origin.x = v18;
    v60.origin.y = v14;
    v60.size.width = rect;
    v60.size.height = v12;
    v23 = v18;
    v24 = CGRectGetMinY(v60);
    v61.origin.x = x;
    v61.origin.y = y;
    v61.size.width = width;
    v61.size.height = v13;
    v62.size.width = CGRectGetWidth(v61);
    v62.size.height = 90.0;
    v62.origin.x = v22;
    v62.origin.y = v24;
    v18 = v23;
    v12 = v40;
    v75.origin.x = x;
    v75.origin.y = y;
    v75.size.width = width;
    v75.size.height = v13;
    v63 = CGRectUnion(v62, v75);
    x = v63.origin.x;
    y = v63.origin.y;
    width = v63.size.width;
    v13 = v63.size.height;
  }
  v64.origin.x = x;
  v64.origin.y = y;
  v64.size.width = width;
  v64.size.height = v13;
  v25 = CGRectGetMinY(v64);
  v65.origin.x = v18;
  v65.origin.y = v14;
  v65.size.width = rect;
  v65.size.height = v12;
  if (v25 >= CGRectGetMaxY(v65))
  {
    v66.origin.x = x;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = v13;
    v26 = CGRectGetMinX(v66);
    v67.origin.x = v18;
    v67.origin.y = v14;
    v67.size.width = rect;
    v67.size.height = v12;
    v27 = v18;
    v28 = CGRectGetMaxY(v67) + -90.0;
    v68.origin.x = x;
    v68.origin.y = y;
    v68.size.width = width;
    v68.size.height = v13;
    v69.size.width = CGRectGetWidth(v68);
    v69.size.height = 90.0;
    v69.origin.x = v26;
    v69.origin.y = v28;
    v18 = v27;
    v12 = v40;
    v76.origin.x = x;
    v76.origin.y = y;
    v76.size.width = width;
    v76.size.height = v13;
    v70 = CGRectUnion(v69, v76);
    x = v70.origin.x;
    y = v70.origin.y;
    width = v70.size.width;
    v13 = v70.size.height;
  }
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v71.origin.x = x;
  v71.origin.y = y;
  v71.size.width = width;
  v71.size.height = v13;
  v77.origin.x = v18;
  v77.origin.y = v14;
  v77.size.width = rect;
  v77.size.height = v12;
  v30 = CGRectIntersectsRect(v71, v77);
  if (has_internal_diagnostics)
  {
    if (!v30)
    {
      __UIFaultDebugAssertLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v43 = 0;
        _os_log_fault_impl(&dword_185066000, v35, OS_LOG_TYPE_FAULT, "Getting an overlapping rect failed to actually overlap.", v43, 2u);
      }

    }
  }
  else if (!v30)
  {
    v36 = _rectThatJustBarelyIntersectsRect_startingRect____s_category;
    if (!_rectThatJustBarelyIntersectsRect_startingRect____s_category)
    {
      v36 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v36, (unint64_t *)&_rectThatJustBarelyIntersectsRect_startingRect____s_category);
    }
    v37 = *(NSObject **)(v36 + 8);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_ERROR, "Getting an overlapping rect failed to actually overlap.", buf, 2u);
    }
  }
  v31 = x;
  v32 = y;
  v33 = width;
  v34 = v13;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (CGRect)_viewSearchRectForSnapshotRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_UIFocusRegionMap _viewSearchRectForFocusedFrame:focusCandidateSearchRect:includesFocusedFrame:](self, "_viewSearchRectForFocusedFrame:focusCandidateSearchRect:includesFocusedFrame:", 0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_viewSearchRectForFocusedFrame:(CGRect)a3 focusCandidateSearchRect:(CGRect)a4 includesFocusedFrame:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  _UIFocusRegionMap *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
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
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGRect v49;
  CGRect v50;
  CGRect result;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[_UIFocusRegionMap rootView](self, "rootView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v49.origin.x = v14;
  v49.origin.y = v16;
  v49.size.width = v18;
  v49.size.height = v20;
  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = width;
  v52.size.height = height;
  if (!CGRectIntersectsRect(v49, v52))
  {
    v21 = self;
    v22 = v14;
    v23 = v16;
    v24 = v18;
    v25 = v20;
    goto LABEL_6;
  }
  if (v5)
  {
    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = width;
    v53.size.height = height;
    if (!CGRectIntersectsRect(a3, v53))
    {
      v21 = self;
      v22 = a3.origin.x;
      v23 = a3.origin.y;
      v24 = a3.size.width;
      v25 = a3.size.height;
LABEL_6:
      -[_UIFocusRegionMap _rectThatJustBarelyIntersectsRect:startingRect:](v21, "_rectThatJustBarelyIntersectsRect:startingRect:", v22, v23, v24, v25, x, y, width, height);
      x = v26;
      y = v27;
      width = v28;
      height = v29;
    }
  }
  -[_UIFocusRegionMap rootView](self, "rootView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[_UIFocusRegionMap rootView](self, "rootView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_focusRegionFrame");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;

    v50.origin.x = v33;
    v50.origin.y = v35;
    v50.size.width = v37;
    v50.size.height = v39;
    v54.origin.x = x;
    v54.origin.y = y;
    v54.size.width = width;
    v54.size.height = height;
    if (!CGRectIntersectsRect(v50, v54))
    {
      -[_UIFocusRegionMap _rectThatJustBarelyIntersectsRect:startingRect:](self, "_rectThatJustBarelyIntersectsRect:startingRect:", v33, v35, v37, v39, x, y, width, height);
      x = v40;
      y = v41;
      width = v42;
      height = v43;
    }
  }
  v44 = x;
  v45 = y;
  v46 = width;
  v47 = height;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (id)_contextWithSourceView:(id)a3 focusedRegion:(id)a4 movement:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIFocusMovementRequest *v11;
  void *v12;
  _UIFocusMovementRequest *v13;
  void *v14;
  UIFocusUpdateContext *v15;
  void *v16;
  id v17;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = [_UIFocusMovementRequest alloc];
  -[_UIFocusRegionMap focusSystem](self, "focusSystem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_UIFocusMovementRequest initWithFocusSystem:](v11, "initWithFocusSystem:", v12);

  +[_UIFocusItemInfo infoWithView:](_UIFocusItemInfo, "infoWithView:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIFocusMovementRequest setFocusedItemInfo:](v13, "setFocusedItemInfo:", v14);
  -[_UIFocusMovementRequest setMovementInfo:](v13, "setMovementInfo:", v9);

  v15 = [UIFocusUpdateContext alloc];
  objc_msgSend(v8, "_focusRegionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[UIFocusUpdateContext _initWithFocusMovementRequest:nextFocusedItem:](v15, "_initWithFocusMovementRequest:nextFocusedItem:", v13, v16);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v17, "_setFocusedGuide:", v8);

  return v17;
}

- (id)_contextWithSourceView:(id)a3 focusedContainerGuide:(id)a4 movement:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIFocusMovementRequest *v11;
  void *v12;
  _UIFocusMovementRequest *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [_UIFocusMovementRequest alloc];
  -[_UIFocusRegionMap focusSystem](self, "focusSystem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_UIFocusMovementRequest initWithFocusSystem:](v11, "initWithFocusSystem:", v12);

  +[_UIFocusItemInfo infoWithView:](_UIFocusItemInfo, "infoWithView:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIFocusMovementRequest setFocusedItemInfo:](v13, "setFocusedItemInfo:", v14);
  -[_UIFocusMovementRequest setMovementInfo:](v13, "setMovementInfo:", v8);

  objc_msgSend(v9, "preferredFocusedView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[UIFocusUpdateContext _initWithFocusMovementRequest:nextFocusedItem:]([UIFocusUpdateContext alloc], "_initWithFocusMovementRequest:nextFocusedItem:", v13, v15);
  objc_msgSend(v16, "_setFocusedGuide:", v9);

  return v16;
}

- (id)debugQuickLookObject
{
  void *v2;
  void *v3;

  -[_UIFocusRegionMap lastSnapshot](self, "lastSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_containsFocusableRegionForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIFocusRegionMap rootView](self, "rootView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMap focusSystem](self, "focusSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIFocusRegionMapSnapshotRequest requestWithRootView:focusSystem:](_UIFocusRegionMapSnapshotRequest, "requestWithRootView:focusSystem:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_focusRegionFrame");
  objc_msgSend(v7, "setSnapshotRect:");
  objc_msgSend(v7, "snapshotRect");
  -[_UIFocusRegionMap _viewSearchRectForSnapshotRect:](self, "_viewSearchRectForSnapshotRect:");
  objc_msgSend(v7, "setViewSearchRect:");
  objc_msgSend(v4, "_focusSystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_focusedView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_focusRegionFrame");
  objc_msgSend(v7, "setFocusedRect:");

  objc_msgSend(v7, "takeSnapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v10, "allFocusableRegionMapEntries", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "focusableRegion");
        v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15 == v4)
        {
          LOBYTE(v12) = 1;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  return v12;
}

- (UIView)rootView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_rootView);
}

- (void)setRootView:(id)a3
{
  objc_storeWeak((id *)&self->_rootView, a3);
}

- (UIFocusSystem)focusSystem
{
  return self->_focusSystem;
}

- (void)setFocusSystem:(id)a3
{
  objc_storeStrong((id *)&self->_focusSystem, a3);
}

- (CGRect)minimumSearchArea
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_minimumSearchArea.origin.x;
  y = self->_minimumSearchArea.origin.y;
  width = self->_minimumSearchArea.size.width;
  height = self->_minimumSearchArea.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setMinimumSearchArea:(CGRect)a3
{
  self->_minimumSearchArea = a3;
}

- (_UIFocusRegionMapSnapshot)lastSnapshot
{
  return self->_lastSnapshot;
}

- (void)setLastSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_lastSnapshot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSnapshot, 0);
  objc_storeStrong((id *)&self->_focusSystem, 0);
  objc_destroyWeak((id *)&self->_rootView);
}

@end
