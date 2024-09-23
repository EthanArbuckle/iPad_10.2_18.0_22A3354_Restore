@implementation _UIFocusMap

- (_UIFocusMap)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMap.m"), 97, CFSTR("-init is not a valid initializer for this class."));

  return 0;
}

- (_UIFocusMap)initWithFocusSystem:(id)a3 rootEnvironment:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _UIFocusMap *v10;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMap.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusSystem"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMap.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rootEnvironment"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = -[_UIFocusMap initWithFocusSystem:rootEnvironment:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:](self, "initWithFocusSystem:rootEnvironment:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:", v7, v9, 0, 0, 0);

  return v10;
}

- (_UIFocusMap)initWithFocusSystem:(id)a3 rootEnvironment:(id)a4 coordinateSpace:(id)a5 searchInfo:(id)a6 ignoresRootContainerClippingRect:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _UIFocusMap *v16;
  void *v18;

  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v12, "focusItemContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMap.m"), 111, CFSTR("The environment does not provide an item container."));

  }
  _UIFocusRegionContainerFromEnvironmentAndContainer((uint64_t)v12, (uint64_t)v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = -[_UIFocusMap initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:](self, "initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:", v13, v15, v11, 0, 0);

  if (v15 != v12 && v16)
    objc_storeStrong((id *)&v16->_rootContainerProxy, v15);

  return v16;
}

- (_UIFocusMap)initWithFocusSystem:(id)a3 rootContainer:(id)a4 coordinateSpace:(id)a5 searchInfo:(id)a6 ignoresRootContainerClippingRect:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _UIFocusMap *v17;
  _UIFocusMap *v18;
  CGSize v19;
  _UIFocusSearchInfo *v20;
  _UIFocusSearchInfo *searchInfo;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMap.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusSystem"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMap.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rootContainer"));

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)_UIFocusMap;
  v17 = -[_UIFocusMap init](&v26, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_focusSystem, v13);
    objc_storeWeak((id *)&v18->_rootContainer, v14);
    if (!v15)
    {
      objc_msgSend(v14, "_preferredFocusRegionCoordinateSpace");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v18, CFSTR("_UIFocusMap.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinateSpace"));

        v15 = 0;
      }
    }
    objc_storeWeak((id *)&v18->_coordinateSpace, v15);
    v19 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v18->_minimumSearchArea.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v18->_minimumSearchArea.size = v19;
    v18->_minimumSearchAreaIsEmpty = 1;
    if (v16)
    {
      v20 = (_UIFocusSearchInfo *)v16;
    }
    else
    {
      +[_UIFocusSearchInfo defaultInfo](_UIFocusSearchInfo, "defaultInfo");
      v20 = (_UIFocusSearchInfo *)objc_claimAutoreleasedReturnValue();
    }
    searchInfo = v18->_searchInfo;
    v18->_searchInfo = v20;

    v18->_ignoresRootContainerClippingRect = a7;
  }

  return v18;
}

- (void)setMinimumSearchArea:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->_minimumSearchArea, a3))
  {
    self->_minimumSearchArea.origin.x = x;
    self->_minimumSearchArea.origin.y = y;
    self->_minimumSearchArea.size.width = width;
    self->_minimumSearchArea.size.height = height;
    v8.origin.x = x;
    v8.origin.y = y;
    v8.size.width = width;
    v8.size.height = height;
    self->_minimumSearchAreaIsEmpty = CGRectIsEmpty(v8);
  }
}

- (id)_defaultMapSnapshotter
{
  _UIFocusMapSnapshotter *v3;
  id WeakRetained;
  id v5;
  id v6;
  void *v7;
  _UIFocusMapSnapshotter *v8;

  v3 = [_UIFocusMapSnapshotter alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  v5 = objc_loadWeakRetained((id *)&self->_rootContainer);
  v6 = objc_loadWeakRetained((id *)&self->_coordinateSpace);
  -[_UIFocusMap searchInfo](self, "searchInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UIFocusMapSnapshotter initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:](v3, "initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:", WeakRetained, v5, v6, v7, self->_ignoresRootContainerClippingRect);

  return v8;
}

- (id)_allFocusableItemsInEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[_UIFocusMap _defaultMapSnapshotter](self, "_defaultMapSnapshotter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFocusedRegion:", 0);
    v19 = v5;
    objc_msgSend(v5, "captureSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v18 = v6;
    objc_msgSend(v6, "regions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "_defaultFocusItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            -[_UIFocusMap searchInfo](self, "searchInfo");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "shouldIncludeFocusItem:", v13);

            if (v15)
            {
              if ((objc_msgSend(v7, "containsObject:", v13) & 1) == 0
                && _UIFocusEnvironmentIsAncestorOfEnvironment(v4, v13))
              {
                objc_msgSend(v7, "addObject:", v13);
              }
            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (id)_inferredDefaultFocusItemInEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  void *v17;
  id WeakRetained;
  int v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double MaxX;
  uint64_t v34;
  id v35;
  id v36;
  double MinY;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  double v44;
  uint64_t i;
  void *v46;
  void *v47;
  double v48;
  double v49;
  id v50;
  void *v51;
  unsigned int v52;
  _UIFocusGroupMap *v53;
  void *v54;
  uint64_t v55;
  _UIFocusGroupMap *focusGroupMap;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id *location;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _UIFocusMap *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[4];
  id v76;
  id v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;
  CGRect v90;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIFocusMap _beginTrackingDefaultItemSearchInfoIfNecessary](self, "_beginTrackingDefaultItemSearchInfoIfNecessary");
  v69 = v4;
  if (v4)
  {
    v70 = self;
    -[_UIFocusMap _defaultMapSnapshotter](self, "_defaultMapSnapshotter");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setFocusedRegion:", 0);
    objc_msgSend(v64, "captureSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFocusMap _defaultItemSearchContext](self, "_defaultItemSearchContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSnapshot:", v5);

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    objc_msgSend(v5, "regions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v83, v88, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v84;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v84 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v10);
        objc_msgSend(v11, "_defaultFocusItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[_UIFocusMap searchInfo](v70, "searchInfo");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "shouldIncludeFocusItem:", v12);

          if (v14)
          {
            if (v12 == v69)
            {
              v36 = v11;

              v17 = v69;
              if (v36)
                goto LABEL_44;
              goto LABEL_43;
            }
            if ((objc_msgSend(v68, "containsObject:", v12) & 1) == 0)
            {
              v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              v79 = 0;
              v80 = &v79;
              v81 = 0x2020000000;
              v82 = 0;
              v75[0] = MEMORY[0x1E0C809B0];
              v75[1] = 3221225472;
              v75[2] = __54___UIFocusMap__inferredDefaultFocusItemInEnvironment___block_invoke;
              v75[3] = &unk_1E16C6920;
              v16 = v15;
              v76 = v16;
              v77 = v69;
              v78 = &v79;
              _UIFocusEnvironmentEnumerateAncestorEnvironments(v12, v75);
              if (*((_BYTE *)v80 + 24))
              {
                objc_msgSend(v68, "addObject:", v12);
                objc_msgSend(v66, "addObject:", v11);
                objc_msgSend(v67, "setObject:forKey:", v11, v12);
                objc_msgSend(v65, "unionSet:", v16);
              }

              _Block_object_dispose(&v79, 8);
            }
          }
        }

        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v83, v88, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

    if (objc_msgSend(v68, "count") != 1
      || (objc_msgSend(v68, "anyObject"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if ((unint64_t)objc_msgSend(v68, "count") < 2)
      {
        v17 = 0;
      }
      else
      {
        location = (id *)&v70->_focusSystem;
        WeakRetained = objc_loadWeakRetained((id *)&v70->_focusSystem);
        v19 = objc_msgSend(WeakRetained, "_shouldReverseLayoutDirectionForEnvironment:", v69);

        objc_msgSend(v5, "mapArea");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "frame");
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;

        v29 = v22;
        v30 = v24;
        v31 = v26;
        v32 = v28;
        if (v19)
        {
          MaxX = CGRectGetMaxX(*(CGRect *)&v29);
          v34 = 6;
        }
        else
        {
          MaxX = CGRectGetMinX(*(CGRect *)&v29) + -1.0;
          v34 = 10;
        }
        v90.origin.x = v22;
        v90.origin.y = v24;
        v90.size.width = v26;
        v90.size.height = v28;
        MinY = CGRectGetMinY(v90);
        +[_UIFocusMovementInfo _movementWithHeading:isInitial:](_UIFocusMovementInfo, "_movementWithHeading:isInitial:", v34, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v40 = v66;
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
        if (v41)
        {
          v42 = MinY + -1.0;
          v43 = *(_QWORD *)v72;
          v44 = 1.79769313e308;
          do
          {
            for (i = 0; i != v41; ++i)
            {
              if (*(_QWORD *)v72 != v43)
                objc_enumerationMutation(v40);
              v46 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
              objc_msgSend(v46, "_defaultFocusItem", location);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              if (v47)
              {
                v48 = _UIFocusMapDistanceToRegionBoundary((uint64_t)v46, objc_msgSend(v46, "_effectiveFocusableBoundariesForHeading:", objc_msgSend(v38, "heading")), v38, objc_msgSend(v46, "_preferredDistanceComparisonType"), 1, v5, MaxX, v42, 1.0, 1.0);
                v49 = v48;
                if (v48 <= v44)
                {
                  if (v48 < v44)
                    objc_msgSend(v39, "removeAllObjects");
                  objc_msgSend(v39, "addObject:", v47);
                  v44 = v49;
                }
              }

            }
            v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
          }
          while (v41);
        }

        objc_msgSend(v39, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_loadWeakRetained(location);
        objc_msgSend(v50, "behavior");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "focusGroupMovementBehavior");

        if (((v17 != 0) & (v52 >> 4)) != 0)
        {
          v53 = [_UIFocusGroupMap alloc];
          -[_UIFocusMap coordinateSpace](v70, "coordinateSpace");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = -[_UIFocusGroupMap initWithItems:coordinateSpace:](v53, "initWithItems:coordinateSpace:", v68, v54);
          focusGroupMap = v70->_focusGroupMap;
          v70->_focusGroupMap = (_UIFocusGroupMap *)v55;

          -[_UIFocusGroupMap focusGroupForItem:](v70->_focusGroupMap, "focusGroupForItem:", v17);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "primaryItem");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v58;
          if (v58)
          {
            v60 = v58;

            v17 = v60;
          }

        }
      }
    }
LABEL_43:
    objc_msgSend(v67, "objectForKey:", v17, location);
    v36 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:
    -[_UIFocusMap _defaultItemSearchContext](v70, "_defaultItemSearchContext");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addDestinationRegion:", v36);

    v35 = v17;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (id)_nextFocusedItemForFocusMovementRequest:(id)a3
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  unint64_t v9;
  void *v10;
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
  _UIFocusRegion *v23;
  void *v24;
  _UIFocusRegion *v25;
  void *v26;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  _UIFocusRegion *v47;
  void *v48;
  _UIFocusRegion *v49;
  void *v50;
  void *v52;
  void *v53;
  CGRect v54;
  CGRect v55;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMap.m"), 332, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  objc_msgSend(v5, "focusSystem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);

  if (v6 != WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMap.m"), 333, CFSTR("Submitted a focus movement request to a focus map with a mismatched focus system."));

  }
  -[_UIFocusMap _beginTrackingFocusMovementSearchInfoIfNecessary](self, "_beginTrackingFocusMovementSearchInfoIfNecessary");
  objc_msgSend(v5, "movementInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "heading");

  if (v9)
  {
    objc_msgSend(v5, "focusedItemInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v10, "focusedRegion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFocusMap _nextFocusedItemForFocusMovementRequest:startingFromRegion:](self, "_nextFocusedItemForFocusMovementRequest:startingFromRegion:", v5, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "movementInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_fallbackMovementOriginatingFrame");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;

      v54.origin.x = v16;
      v54.origin.y = v18;
      v54.size.width = v20;
      v54.size.height = v22;
      if (!CGRectIsNull(v54))
      {
        v55.origin.x = v16;
        v55.origin.y = v18;
        v55.size.width = v20;
        v55.size.height = v22;
        if (!CGRectIsEmpty(v55))
        {
          v23 = [_UIFocusRegion alloc];
          -[_UIFocusMap coordinateSpace](self, "coordinateSpace");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[_UIFocusRegion initWithFrame:coordinateSpace:](v23, "initWithFrame:coordinateSpace:", v24, v16, v18, v20, v22);

          -[_UIFocusMap _nextFocusedItemForFocusMovementRequest:startingFromRegion:](self, "_nextFocusedItemForFocusMovementRequest:startingFromRegion:", v5, v25);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            goto LABEL_17;
        }
      }
      if (self->_minimumSearchAreaIsEmpty)
      {
        -[_UIFocusMap coordinateSpace](self, "coordinateSpace");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "bounds");
        v28 = v27;
        v30 = v29;
        v32 = v31;
        v34 = v33;

      }
      else
      {
        -[_UIFocusMap minimumSearchArea](self, "minimumSearchArea");
        v28 = v35;
        v30 = v36;
        v32 = v37;
        v34 = v38;
      }
      -[_UIFocusMap _defaultMapSnapshotter](self, "_defaultMapSnapshotter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "focusedRegion");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFocusedRegion:", v39);

      objc_msgSend(v12, "setSnapshotFrame:", v28, v30, v32, v34);
      objc_msgSend(v5, "movementInfo");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setClipToSnapshotRect:", objc_msgSend(v40, "_isLinearMovement") ^ 1);

      objc_msgSend(v5, "movementInfo");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMovementInfo:", v41);

      objc_msgSend(v12, "captureSnapshot");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFocusMap _focusMovementSearchContext](self, "_focusMovementSearchContext");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addSnapshot:", v42);

      v44 = _UIRectDeparturePointAlongFocusHeading((v9 >> 1) & 0x14 | (2 * v9) & 0x28 | (__rbit32(v9) >> 30), v28, v30, v32, v34);
      v46 = v45;
      v47 = [_UIFocusRegion alloc];
      -[_UIFocusMap coordinateSpace](self, "coordinateSpace");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[_UIFocusRegion initWithFrame:coordinateSpace:](v47, "initWithFrame:coordinateSpace:", v48, v44, v46, 1.0, 1.0);

      objc_msgSend(v42, "regions");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFocusMap _nextFocusedItemForFocusMovementRequest:startingFromRegion:inRegions:withSnapshot:](self, "_nextFocusedItemForFocusMovementRequest:startingFromRegion:inRegions:withSnapshot:", v5, v49, v50, v42);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_17:

    goto LABEL_18;
  }
  v13 = 0;
LABEL_18:

  return v13;
}

- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 startingFromRegion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  double MinX;
  double v38;
  double v39;
  double MaxY;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  double MaxX;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  int v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double x;
  double y;
  double width;
  double height;
  void *v70;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  double v81;
  double MinY;
  double v83;
  CGFloat rect;
  double recta;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  v6 = a3;
  v7 = a4;
  -[_UIFocusMap _beginTrackingFocusMovementSearchInfoIfNecessary](self, "_beginTrackingFocusMovementSearchInfoIfNecessary");
  objc_msgSend(v6, "movementInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "heading");

  -[_UIFocusMap coordinateSpace](self, "coordinateSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIFocusRegionEvaluator frameForRegion:inCoordinateSpace:](_UIFocusRegionEvaluator, "frameForRegion:inCoordinateSpace:", v7, v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  if (!v9)
    goto LABEL_48;
  v86.origin.x = v12;
  v86.origin.y = v14;
  v86.size.width = v16;
  v86.size.height = v18;
  if (CGRectIsEmpty(v86))
    goto LABEL_48;
  if (self->_minimumSearchAreaIsEmpty)
  {
    -[_UIFocusMap coordinateSpace](self, "coordinateSpace");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

  }
  else
  {
    -[_UIFocusMap minimumSearchArea](self, "minimumSearchArea");
    v21 = v28;
    v23 = v29;
    v25 = v30;
    v27 = v31;
  }
  v87.origin.x = v21;
  v87.origin.y = v23;
  v87.size.width = v25;
  v79 = v27;
  v87.size.height = v27;
  v32 = v25;
  v78 = v25;
  v33 = CGRectGetMinY(v87) + -1.0;
  v88.origin.x = v12;
  v88.origin.y = v14;
  v88.size.width = v16;
  v88.size.height = v18;
  MinY = CGRectGetMinY(v88);
  rect = v21;
  v89.origin.x = v12;
  v89.origin.y = v14;
  v89.size.width = v16;
  v89.size.height = v18;
  v34 = MinY - CGRectGetHeight(v89);
  if (v33 < v34)
    v34 = v33;
  v83 = v34;
  v90.origin.x = v21;
  v90.origin.y = v23;
  v35 = v23;
  v80 = v23;
  v90.size.width = v32;
  v90.size.height = v79;
  v36 = CGRectGetMinX(v90) + -1.0;
  v91.origin.x = v12;
  v91.origin.y = v14;
  v91.size.width = v16;
  v91.size.height = v18;
  MinX = CGRectGetMinX(v91);
  v92.origin.x = v12;
  v92.origin.y = v14;
  v92.size.width = v16;
  v92.size.height = v18;
  v38 = MinX - CGRectGetWidth(v92);
  if (v36 < v38)
    v38 = v36;
  v81 = v38;
  v93.origin.x = rect;
  v93.origin.y = v35;
  v93.size.width = v78;
  v93.size.height = v79;
  v39 = CGRectGetMaxY(v93) + 1.0;
  v94.origin.x = v12;
  v94.origin.y = v14;
  v94.size.width = v16;
  v94.size.height = v18;
  MaxY = CGRectGetMaxY(v94);
  v95.origin.x = v12;
  v95.origin.y = v14;
  v95.size.width = v16;
  v95.size.height = v18;
  v41 = MaxY + CGRectGetHeight(v95);
  v42 = v79;
  if (v39 >= v41)
    v43 = v39;
  else
    v43 = v41;
  v44 = rect;
  v45 = v80;
  v46 = v78;
  v47 = CGRectGetMaxX(*(CGRect *)(&v42 - 3)) + 1.0;
  v96.origin.x = v12;
  v96.origin.y = v14;
  v96.size.width = v16;
  v96.size.height = v18;
  MaxX = CGRectGetMaxX(v96);
  v97.origin.x = v12;
  v97.origin.y = v14;
  v97.size.width = v16;
  v97.size.height = v18;
  v49 = MaxX + CGRectGetWidth(v97);
  if (v47 >= v49)
    v50 = v47;
  else
    v50 = v49;
  if ((v9 & 4) != 0)
    v51 = v81;
  else
    v51 = v50;
  recta = v43;
  if ((v9 & 1) != 0)
    v52 = v83;
  else
    v52 = v43;
  if ((v9 & 0xC) == 0)
  {
    v98.origin.x = v12;
    v98.origin.y = v14;
    v98.size.width = v16;
    v98.size.height = v18;
    v51 = CGRectGetMaxX(v98);
  }
  if ((v9 & 3) == 0)
  {
    v99.origin.x = v12;
    v99.origin.y = v14;
    v99.size.width = v16;
    v99.size.height = v18;
    v52 = CGRectGetMaxY(v99);
  }
  if ((v9 & 0xC) == 0 || (v9 & 4) != 0)
  {
    v53 = v51;
    v101.origin.x = v12;
    v101.origin.y = v14;
    v101.size.width = v16;
    v101.size.height = v18;
    v54 = CGRectGetMinX(v101);
  }
  else
  {
    v53 = v51;
    v100.origin.x = v12;
    v100.origin.y = v14;
    v100.size.width = v16;
    v100.size.height = v18;
    v54 = CGRectGetMaxX(v100);
  }
  v55 = v54;
  if ((v9 & 3) == 0 || (v9 & 1) != 0)
  {
    v103.origin.x = v12;
    v103.origin.y = v14;
    v103.size.width = v16;
    v103.size.height = v18;
    v56 = CGRectGetMinY(v103);
  }
  else
  {
    v102.origin.x = v12;
    v102.origin.y = v14;
    v102.size.width = v16;
    v102.size.height = v18;
    v56 = CGRectGetMaxY(v102);
  }
  v57 = v56;
  objc_msgSend(v6, "movementInfo", *(_QWORD *)&v78);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "_isLinearMovement");

  v60 = v59 ? v50 : v53;
  v61 = v59 ? recta : v52;
  v62 = v59 ? v81 : v55;
  v63 = v59 ? v83 : v57;
  v64 = v60 - v62;
  v65 = v61 - v63;
  v104 = CGRectStandardize(*(CGRect *)&v62);
  x = v104.origin.x;
  y = v104.origin.y;
  width = v104.size.width;
  height = v104.size.height;
  if (fabs(CGRectGetWidth(v104)) < 0.0001)
    goto LABEL_48;
  v105.origin.x = x;
  v105.origin.y = y;
  v105.size.width = width;
  v105.size.height = height;
  if (fabs(CGRectGetWidth(v105)) >= 0.0001)
  {
    -[_UIFocusMap _defaultMapSnapshotter](self, "_defaultMapSnapshotter");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setFocusedRegion:", v7);
    objc_msgSend(v72, "setSnapshotFrame:", x, y, width, height);
    objc_msgSend(v6, "movementInfo");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setClipToSnapshotRect:", objc_msgSend(v73, "_isLinearMovement") ^ 1);

    objc_msgSend(v6, "movementInfo");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setMovementInfo:", v74);

    objc_msgSend(v72, "captureSnapshot");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFocusMap _focusMovementSearchContext](self, "_focusMovementSearchContext");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addSnapshot:", v75);

    objc_msgSend(v75, "regions");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFocusMap _nextFocusedItemForFocusMovementRequest:startingFromRegion:inRegions:withSnapshot:](self, "_nextFocusedItemForFocusMovementRequest:startingFromRegion:inRegions:withSnapshot:", v6, v7, v77, v75);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_48:
    v70 = 0;
  }

  return v70;
}

- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 inRegions:(id)a4 withSnapshot:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "focusedItemInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "focusedRegion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIFocusMap _nextFocusedItemForFocusMovementRequest:startingFromRegion:inRegions:withSnapshot:](self, "_nextFocusedItemForFocusMovementRequest:startingFromRegion:inRegions:withSnapshot:", v10, v12, v9, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 startingFromRegion:(id)a4 inRegions:(id)a5 withSnapshot:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "movementInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "_isLinearMovement");

  if (v15)
    -[_UIFocusMap _nextFocusedItemForLinearFocusMovementRequest:startingFromRegion:inRegions:withSnapshot:](self, "_nextFocusedItemForLinearFocusMovementRequest:startingFromRegion:inRegions:withSnapshot:", v13, v12, v11, v10);
  else
    -[_UIFocusMap _nextFocusedItemForNonLinearFocusMovementRequest:startingFromRegion:inRegions:withSnapshot:](self, "_nextFocusedItemForNonLinearFocusMovementRequest:startingFromRegion:inRegions:withSnapshot:", v13, v12, v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_nextFocusedItemForNonLinearFocusMovementRequest:(id)a3 startingFromRegion:(id)a4 inRegions:(id)a5 withSnapshot:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  CGFloat *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _UIDynamicFocusGroupMap *v42;
  void *v43;
  _UIDynamicFocusGroupMap *v44;
  void *v45;
  void *v46;
  id v47;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  float v52;
  double v53;
  uint64_t v54;
  void *v55;
  float v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  double v63;
  int v64;
  int v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  BOOL v79;
  double v80;
  double v81;
  double v82;
  double v83;
  _BOOL4 v84;
  int v85;
  double v86;
  float v87;
  _BOOL4 v88;
  char v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  double v93;
  uint64_t v94;
  BOOL v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  int IsFocusableInFocusSystemWithSearchInfo;
  void *v101;
  int v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  char v109;
  id v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  UIUserInterfaceLayoutDirection v115;
  id v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  double v122;
  uint64_t j;
  void *v124;
  double MaxX;
  double v126;
  id v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  double v132;
  uint64_t m;
  void *v134;
  double MinY;
  double v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  double v141;
  uint64_t k;
  void *v143;
  double MinX;
  double v145;
  id v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  id v152;
  _UIDynamicFocusGroupMap *v153;
  char v154;
  void *v155;
  id obj;
  id WeakRetained;
  _UIFocusMap *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  uint64_t v163;
  double v164;
  double v165;
  double v166;
  double v167;
  uint64_t v168;
  id v169;
  void *v170;
  double v171;
  void *v172;
  double v173;
  float v174;
  double v175;
  char v176;
  _BOOL4 v177;
  uint64_t v178;
  double v179;
  uint64_t v180;
  uint64_t v181;
  CGFloat v182;
  uint64_t v183;
  CGFloat v184;
  uint64_t v185;
  CGFloat v186;
  void *v187;
  CGFloat v188;
  void *v189;
  uint64_t v190;
  void *v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  _BYTE v208[128];
  _BYTE v209[128];
  _BYTE v210[128];
  _BYTE v211[128];
  uint64_t v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;

  v212 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v152 = a5;
  v12 = a6;
  -[_UIFocusMap _beginTrackingFocusMovementSearchInfoIfNecessary](self, "_beginTrackingFocusMovementSearchInfoIfNecessary");
  v158 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  v162 = v10;
  objc_msgSend(v10, "movementInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = objc_msgSend(v13, "heading");
  v170 = v13;
  v14 = objc_msgSend(v13, "_groupFilter");
  v15 = (CGFloat *)MEMORY[0x1E0C9D628];
  v151 = v11;
  if (v11)
  {
    objc_msgSend(v12, "snapshotFrameForRegion:", v11);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v24 = *v15;
    v25 = v15[1];
    v26 = v15[2];
    v27 = v15[3];
  }
  else
  {
    v24 = *MEMORY[0x1E0C9D628];
    v25 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v26 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v27 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v23 = v27;
    v21 = v26;
    v19 = v25;
    v17 = *MEMORY[0x1E0C9D628];
  }
  objc_msgSend(v10, "focusedItemInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "item");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v186 = v25;
  v188 = v24;
  v182 = v27;
  v184 = v26;
  if (v29 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "coordinateSpace");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v29;
    objc_msgSend(v29, "_focusCastingFrameForHeading:inCoordinateSpace:", v190, v30);
    v24 = v32;
    v25 = v33;
    v26 = v34;
    v27 = v35;
  }
  else
  {
    v31 = v29;
    objc_msgSend(WeakRetained, "_focusCastingController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
      goto LABEL_10;
    objc_msgSend(WeakRetained, "_focusCastingController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "coordinateSpace");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "castingFrameForFocusedItem:heading:inCoordinateSpace:", v31, v190, v37);
    v24 = v38;
    v25 = v39;
    v26 = v40;
    v27 = v41;

  }
LABEL_10:
  if (v31 && v14 == 1)
  {
    v42 = [_UIDynamicFocusGroupMap alloc];
    -[_UIFocusMap coordinateSpace](self, "coordinateSpace");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[_UIDynamicFocusGroupMap initWithCoordinateSpace:](v42, "initWithCoordinateSpace:", v43);

    v153 = v44;
    -[_UIDynamicFocusGroupMap focusGroupIdentifierForItem:](v44, "focusGroupIdentifierForItem:", v31);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v14 == 2)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Primary item focus group filtering is not available for non linear focus movement."));
    v45 = 0;
    v153 = 0;
  }
  v46 = v170;
  v213.origin.x = v24;
  v213.origin.y = v25;
  v213.size.width = v26;
  v213.size.height = v27;
  v218.origin.y = v186;
  v218.origin.x = v188;
  v218.size.height = v182;
  v218.size.width = v184;
  if (!CGRectEqualToRect(v213, v218))
  {
    v23 = v27;
    v21 = v26;
    v19 = v25;
    v17 = v24;
  }
  v189 = v12;
  if (!v190
    || !objc_msgSend(v152, "count")
    || (v214.origin.x = v17, v214.origin.y = v19, v214.size.width = v21, v214.size.height = v23, CGRectIsEmpty(v214)))
  {
    v47 = 0;
    goto LABEL_22;
  }
  v155 = v45;
  v150 = v31;
  objc_msgSend(v162, "focusedItemInfo");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "inheritedFocusMovementStyle");

  v169 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v200 = 0u;
  v201 = 0u;
  v202 = 0u;
  v203 = 0u;
  obj = v152;
  v160 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v200, v210, 16);
  if (!v160)
  {
    v154 = 0;
    v173 = 1.79769313e308;
    goto LABEL_131;
  }
  v154 = 0;
  v159 = *(_QWORD *)v201;
  v51 = -1;
  v52 = 1.1755e-38;
  v53 = 1.79769313e308;
  v171 = 1.79769313e308;
  v173 = 1.79769313e308;
  v167 = v23;
  v165 = v19;
  v166 = v21;
  v164 = v17;
  v168 = v50;
  do
  {
    v54 = 0;
    do
    {
      if (*(_QWORD *)v201 != v159)
        objc_enumerationMutation(obj);
      v55 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * v54);
      v183 = objc_msgSend(v55, "_effectiveFocusableBoundariesForHeading:", v190);
      v181 = objc_msgSend(v55, "_effectiveBoundariesBlockingFocusMovementRequest:", v162);
      v178 = objc_msgSend(v55, "_preferredDistanceComparisonType");
      objc_msgSend(v55, "_focusPriority");
      v174 = v56;
      v196 = 0u;
      v197 = 0u;
      v198 = 0u;
      v199 = 0u;
      v185 = objc_msgSend(&unk_1E1A93458, "countByEnumeratingWithState:objects:count:", &v196, v209, 16);
      if (!v185)
        goto LABEL_125;
      v161 = v54;
      v163 = v51;
      v176 = 0;
      v180 = *(_QWORD *)v197;
      v172 = v55;
LABEL_30:
      v57 = 0;
      while (1)
      {
        if (*(_QWORD *)v197 != v180)
          objc_enumerationMutation(&unk_1E1A93458);
        v58 = *(void **)(*((_QWORD *)&v196 + 1) + 8 * v57);
        v59 = objc_msgSend(v58, "unsignedIntegerValue");
        v60 = v59 & v183;
        v61 = v59 & v181;
        if (!(v59 & v183 | v59 & v181))
          goto LABEL_94;
        v62 = v59;
        v63 = _UIFocusMapDistanceToRegionBoundary((uint64_t)v55, v59, v46, 1, v50, v12, v17, v19, v21, v23);
        v179 = v63;
        if (!v178)
          v63 = _UIFocusMapDistanceToRegionBoundary((uint64_t)v55, v62, v46, 0, v50, v12, v17, v19, v21, v23);
        v64 = objc_msgSend(v55, "_ignoresSpeedBumpEdges");
        if (v63 < 0.0)
          goto LABEL_94;
        if (v63 < v171)
          v65 = 1;
        else
          v65 = v64;
        if (v65 != 1)
          goto LABEL_124;
        objc_msgSend(v12, "snapshotFrameForRegion:", v55);
        v177 = _UIRectIntersectsRectAlongFocusHeading(v190, v66, v67, v68, v69, v17, v19, v21, v23);
        v192 = 0u;
        v193 = 0u;
        v194 = 0u;
        v195 = 0u;
        v70 = v169;
        v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v192, v208, 16);
        if (v71)
        {
          v72 = *(_QWORD *)v193;
          while (2)
          {
            for (i = 0; i != v71; ++i)
            {
              if (*(_QWORD *)v193 != v72)
                objc_enumerationMutation(v70);
              objc_msgSend(v187, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v192 + 1) + 8 * i));
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v189, "snapshotFrameForRegion:", v74);
              v79 = _UIRectIntersectsRectAlongFocusHeading(v190, v75, v76, v77, v78, v17, v19, v21, v23);

              if (v79)
              {
                LODWORD(v71) = 1;
                goto LABEL_51;
              }
            }
            v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v192, v208, 16);
            if (v71)
              continue;
            break;
          }
LABEL_51:
          v12 = v189;
        }
        v80 = v63;
        v81 = vabdd_f64(v173, v63);
        v82 = vabdd_f64(v53, v179);
        v83 = vabds_f32(v52, v174);
        v84 = v81 >= 0.0001 || v80 < v173;
        v175 = v80;
        v85 = v80 < v173 || !v84;

        if (v84 || v177)
        {
          v86 = v53;
          v87 = v52;
        }
        else
        {
          v86 = v53;
          v88 = v179 < v53;
          if (v82 < 0.0001)
            v88 = 1;
          v87 = v52;
          if (v174 > v52)
            v88 = 1;
          v85 = v83 < 0.0001 || v88;
        }
        v19 = v165;
        if ((v176 & 1) != 0)
        {
          v89 = 1;
LABEL_91:
          v46 = v170;
          v23 = v167;
          v52 = v87;
          v53 = v86;
          v21 = v166;
          v93 = v175;
          v17 = v164;
          goto LABEL_92;
        }
        if (!v60 || !v85)
        {
          v89 = 0;
          goto LABEL_91;
        }
        v90 = v82 < 0.0001;
        v53 = v86;
        if (v179 < v86)
          v90 = 2;
        v91 = v174 > v87 || v84;
        if (v81 >= 0.0001)
          v92 = 1;
        else
          v92 = 2;
        v93 = v175;
        if (v175 < v173)
          v92 = 2;
        if (v91)
          v94 = v92;
        else
          v94 = 0;
        if ((v91 & 1) != 0)
        {
          v46 = v170;
          v52 = v87;
          v21 = v166;
          v23 = v167;
          v17 = v164;
          goto LABEL_100;
        }
        v95 = v83 < 0.0001;
        v46 = v170;
        v52 = v87;
        v21 = v166;
        v23 = v167;
        v17 = v164;
        if (v95)
        {
          v94 = v90;
          if ((_DWORD)v71)
          {
            if (v177)
              goto LABEL_100;
            v94 = 0;
          }
          else
          {
            if (!v177)
              goto LABEL_100;
            v94 = 2;
          }
          v96 = objc_msgSend(&unk_1E1A93458, "indexOfObject:", v58);
LABEL_103:
          if (!v94)
            goto LABEL_115;
          goto LABEL_104;
        }
LABEL_100:
        v97 = objc_msgSend(&unk_1E1A93458, "indexOfObject:", v58);
        v96 = v97;
        if (v94 != 1)
          goto LABEL_103;
        if (v97 <= v163)
        {
          if (v97 != v163)
          {
LABEL_115:
            v89 = 0;
            goto LABEL_92;
          }
          v94 = 1;
          v96 = v163;
        }
        else
        {
          v94 = 2;
        }
LABEL_104:
        objc_msgSend(v12, "_cachedNextFocusedItemForRegion:withFocusMovementRequest:inMap:", v172, v162, v158);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        if (v98
          && (-[_UIFocusMap searchInfo](v158, "searchInfo"),
              v99 = (void *)objc_claimAutoreleasedReturnValue(),
              IsFocusableInFocusSystemWithSearchInfo = _UIFocusItemIsFocusableInFocusSystemWithSearchInfo(v98, WeakRetained, v99), v99, IsFocusableInFocusSystemWithSearchInfo))
        {
          if (v155)
          {
            -[_UIDynamicFocusGroupMap focusGroupIdentifierForItem:](v153, "focusGroupIdentifierForItem:", v98);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = objc_msgSend(v155, "isEqual:", v101);

            if (!v102)
            {

LABEL_123:
              v50 = v168;
LABEL_124:
              v51 = v163;
              v54 = v161;
              goto LABEL_125;
            }
          }
          if (v94 == 2)
          {
            objc_msgSend(v70, "removeAllObjects");
            objc_msgSend(v187, "removeAllObjects");
          }
          objc_msgSend(v70, "addObject:", v98);
          objc_msgSend(v187, "setObject:forKey:", v172, v98);
          v89 = 1;
          v52 = v174;
          v173 = v175;
          v53 = v179;
        }
        else
        {
          v89 = 0;
          v96 = v163;
        }

        v163 = v96;
LABEL_92:
        if (v61)
          break;
        v176 = v89;
        v50 = v168;
        v55 = v172;
LABEL_94:
        if (++v57 == v185)
        {
          v103 = objc_msgSend(&unk_1E1A93458, "countByEnumeratingWithState:objects:count:", &v196, v209, 16);
          v185 = v103;
          if (!v103)
            goto LABEL_124;
          goto LABEL_30;
        }
      }
      if (!objc_msgSend(v70, "count"))
      {
        v154 = 1;
        v171 = v93;
        goto LABEL_123;
      }
      v51 = v163;
      v54 = v161;
      if (v173 >= v93)
      {
        objc_msgSend(v70, "removeAllObjects", v173);
        objc_msgSend(v187, "removeAllObjects");
      }
      v154 = 1;
      v171 = v93;
      v50 = v168;
LABEL_125:
      ++v54;
    }
    while (v54 != v160);
    v104 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v200, v210, 16);
    v160 = v104;
  }
  while (v104);
LABEL_131:

  if ((unint64_t)objc_msgSend(v169, "count") < 2)
  {
    objc_msgSend(v169, "lastObject");
    v107 = v169;
    v47 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v162, "focusedItemInfo");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "focusedRegion");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if (v106 != v151)
      goto LABEL_137;
    objc_msgSend(v105, "item");
    v47 = (id)objc_claimAutoreleasedReturnValue();
    if (!v47 || fabs(v173) >= 0.0001 || (objc_msgSend(v169, "containsObject:", v47) & 1) == 0)
    {

LABEL_137:
      objc_msgSend(WeakRetained, "_previousFocusedItem");
      v47 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v169, "containsObject:", v47) & 1) == 0)
      {

        goto LABEL_142;
      }
      if (!v47)
      {
LABEL_142:
        objc_msgSend(v162, "movementInfo");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = objc_msgSend(v108, "heading");

        v110 = objc_loadWeakRetained((id *)&v158->_coordinateSpace);
        v111 = v169;
        v112 = v110;
        v113 = v112;
        if ((v109 & 3) != 0)
        {
          +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v114, "semanticContentAttribute"));

          v191 = v113;
          if (v115)
          {
            v116 = v111;
            v117 = v113;
            v204 = 0u;
            v205 = 0u;
            v206 = 0u;
            v207 = 0u;
            v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v204, v211, 16);
            if (v118)
            {
              v119 = v118;
              v120 = 0;
              v121 = *(_QWORD *)v205;
              v122 = 2.22507386e-308;
              do
              {
                for (j = 0; j != v119; ++j)
                {
                  if (*(_QWORD *)v205 != v121)
                    objc_enumerationMutation(v116);
                  v124 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * j);
                  v215.origin.x = _UIFocusItemFrameInCoordinateSpace(v124, v117);
                  MaxX = CGRectGetMaxX(v215);
                  if (MaxX >= v122)
                  {
                    v126 = MaxX;
                    v127 = v124;

                    v120 = v127;
                    v122 = v126;
                  }
                }
                v119 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v204, v211, 16);
              }
              while (v119);
              goto LABEL_176;
            }
LABEL_175:
            v120 = 0;
            goto LABEL_176;
          }
          v116 = v111;
          v117 = v113;
          v204 = 0u;
          v205 = 0u;
          v206 = 0u;
          v207 = 0u;
          v138 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v204, v211, 16);
          if (!v138)
            goto LABEL_175;
          v139 = v138;
          v120 = 0;
          v140 = *(_QWORD *)v205;
          v141 = 1.79769313e308;
          do
          {
            for (k = 0; k != v139; ++k)
            {
              if (*(_QWORD *)v205 != v140)
                objc_enumerationMutation(v116);
              v143 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * k);
              v217.origin.x = _UIFocusItemFrameInCoordinateSpace(v143, v117);
              MinX = CGRectGetMinX(v217);
              if (MinX <= v141)
              {
                v145 = MinX;
                v146 = v143;

                v120 = v146;
                v141 = v145;
              }
            }
            v139 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v204, v211, 16);
          }
          while (v139);
LABEL_176:

          v47 = v120;
          v46 = v170;
          v113 = v191;

        }
        else if ((v109 & 0xC) != 0)
        {
          v128 = v112;
          v204 = 0u;
          v205 = 0u;
          v206 = 0u;
          v207 = 0u;
          v129 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v204, v211, 16);
          if (v129)
          {
            v130 = v129;
            v47 = 0;
            v131 = *(_QWORD *)v205;
            v132 = 1.79769313e308;
            do
            {
              for (m = 0; m != v130; ++m)
              {
                if (*(_QWORD *)v205 != v131)
                  objc_enumerationMutation(v111);
                v134 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * m);
                v216.origin.x = _UIFocusItemFrameInCoordinateSpace(v134, v128);
                MinY = CGRectGetMinY(v216);
                if (MinY <= v132)
                {
                  v136 = MinY;
                  v137 = v134;

                  v47 = v137;
                  v132 = v136;
                }
              }
              v130 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v204, v211, 16);
            }
            while (v130);
          }
          else
          {
            v47 = 0;
          }

          v46 = v170;
        }
        else
        {
          objc_msgSend(v111, "lastObject");
          v47 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
    }

    v107 = v169;
  }
  -[_UIFocusMap _focusMovementSearchContext](v158, "_focusMovementSearchContext");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "objectForKey:", v47);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "addDestinationRegion:", v148);

  -[_UIFocusMap _focusMovementSearchContext](v158, "_focusMovementSearchContext");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "setDidFindFocusBlockingBoundary:", (v47 == 0) & v154);

  v31 = v150;
  v45 = v155;
LABEL_22:

  return v47;
}

- (id)_nextFocusedItemForLinearFocusMovementRequest:(id)a3 startingFromRegion:(id)a4 inRegions:(id)a5 withSnapshot:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _UIFocusMovementRequest *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v37;
  _UIFocusMap *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  char IsFocusableInFocusSystemWithSearchInfo;
  _BOOL4 v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  _UIFocusGroupMap *focusGroupMap;
  void *v62;
  _UIFocusGroupMap *v63;
  void *v64;
  id v66;
  void *v67;
  __int16 v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id obj;
  id WeakRetained;
  uint64_t v76;
  void *v77;
  _UIFocusMovementRequest *v78;
  _QWORD v79[4];
  id v80;
  _UIFocusMap *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  uint64_t v87;
  CGRect v88;

  v87 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[_UIFocusMap _beginTrackingFocusMovementSearchInfoIfNecessary](self, "_beginTrackingFocusMovementSearchInfoIfNecessary");
  if (v11)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
    objc_msgSend(v10, "movementInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "heading");
    objc_msgSend(v13, "snapshotFrameForRegion:", v11);
    if (!v15)
    {
LABEL_50:

      goto LABEL_51;
    }
    v20 = v16;
    v21 = v17;
    v22 = v18;
    v23 = v19;
    if (!objc_msgSend(v12, "count")
      || (v88.origin.x = v20, v88.origin.y = v21, v88.size.width = v22, v88.size.height = v23, CGRectIsEmpty(v88)))
    {
      v15 = 0;
      goto LABEL_50;
    }
    v69 = v12;
    v70 = v14;
    v66 = v11;
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v14, "_linearHeading");
    objc_msgSend(v10, "focusedItemInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "item");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = v24;
    if (v24)
      v15 = (void *)v24;
    objc_msgSend(v10, "movementInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "_linearHeading") & 0x110) != 0)
      v27 = 256;
    else
      v27 = 512;

    v28 = -[_UIFocusMovementRequest initWithFocusSystem:]([_UIFocusMovementRequest alloc], "initWithFocusSystem:", WeakRetained);
    objc_msgSend(v10, "movementInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIFocusRegionMovementInfo _movementWithHeading:linearHeading:originatingHeading:isInitial:inputType:](_UIFocusRegionMovementInfo, "_movementWithHeading:linearHeading:originatingHeading:isInitial:inputType:", v27, v27, v15, 1, objc_msgSend(v29, "_inputType"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFocusMovementRequest setMovementInfo:](v28, "setMovementInfo:", v30);

    objc_msgSend(v10, "focusedItemInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v28;
    -[_UIFocusMovementRequest setFocusedItemInfo:](v28, "setFocusedItemInfo:", v31);

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v67 = v10;
    if ((objc_msgSend(v14, "_linearHeading") & 0x100) != 0)
    {
      objc_msgSend(v69, "reverseObjectEnumerator");
      v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = v69;
    }
    v33 = v32;
    v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
    if (!v34)
    {
LABEL_46:

      objc_msgSend(v73, "allObjects");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __103___UIFocusMap__nextFocusedItemForLinearFocusMovementRequest_startingFromRegion_inRegions_withSnapshot___block_invoke;
      v79[3] = &unk_1E16C6948;
      v80 = WeakRetained;
      v81 = self;
      objc_msgSend(v50, "bs_filter:", v79);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v67;
      objc_msgSend(v67, "movementInfo");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "_groupFilter");

      -[_UIFocusMap _linearlySortedFocusItemsForItems:groupFilter:itemStandInMap:](self, "_linearlySortedFocusItemsForItems:groupFilter:itemStandInMap:", v51, v53, v71);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v70;
      _UIFocusGetNextItemFromList(v77, v54, v68, objc_msgSend(v70, "_isLooping"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "objectForKey:", v15);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFocusMap _focusMovementSearchContext](self, "_focusMovementSearchContext");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "addDestinationRegion:", v55);

      if (v15 && (objc_msgSend(v55, "_shouldUseNextFocusedItemForLinearSorting") & 1) == 0)
      {
        objc_msgSend(v72, "objectForKey:", v15);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_cachedNextFocusedItemForRegion:withFocusMovementRequest:inMap:", v57, v78, self);
        v58 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v58;
      }
      -[_UIFocusMap _defaultItemSearchContext](self, "_defaultItemSearchContext");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setLinearSortedFocusItems:", v54);

      -[_UIFocusMap _focusMovementSearchContext](self, "_focusMovementSearchContext");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setLinearSortedFocusItems:", v54);

      focusGroupMap = self->_focusGroupMap;
      -[_UIFocusMap _defaultItemSearchContext](self, "_defaultItemSearchContext");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setFocusGroupMap:", focusGroupMap);

      v63 = self->_focusGroupMap;
      -[_UIFocusMap _focusMovementSearchContext](self, "_focusMovementSearchContext");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setFocusGroupMap:", v63);

      v11 = v66;
      v12 = v69;
      goto LABEL_50;
    }
    v35 = v34;
    v76 = *(_QWORD *)v83;
    v37 = (v68 & 0x300) == 0 && v77 != 0;
    v38 = self;
    obj = v33;
LABEL_23:
    v39 = 0;
    while (1)
    {
      if (*(_QWORD *)v83 != v76)
        objc_enumerationMutation(obj);
      v40 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v39);
      objc_msgSend(v13, "_cachedNextFocusedItemForRegion:withFocusMovementRequest:inMap:", v40, v78, self);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v40, "item");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v41)
          goto LABEL_30;
      }
      else
      {
        v42 = 0;
        if (!v41)
        {
LABEL_30:
          IsFocusableInFocusSystemWithSearchInfo = 0;
          goto LABEL_31;
        }
      }
      -[_UIFocusMap searchInfo](self, "searchInfo");
      v43 = v13;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      IsFocusableInFocusSystemWithSearchInfo = _UIFocusItemIsFocusableInFocusSystemWithSearchInfo(v41, WeakRetained, v44);

      v13 = v43;
LABEL_31:
      v46 = v42 == v77 && v37;
      if ((IsFocusableInFocusSystemWithSearchInfo & 1) != 0 || v46)
      {
        if (v46)
          v48 = v42;
        else
          v48 = v41;
        v47 = v48;

        self = v38;
        if ((objc_msgSend(v40, "_shouldUseNextFocusedItemForLinearSorting") & 1) == 0)
        {
          objc_msgSend(v40, "_focusedItemForLinearSorting:inMap:withSnapshot:", v78, v38, v13);
          v49 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "setObject:forKey:", v47, v49);

          v47 = (id)v49;
        }
        if ((objc_msgSend(v73, "containsObject:", v47) & 1) == 0)
        {
          objc_msgSend(v72, "setObject:forKey:", v40, v47);
          objc_msgSend(v73, "addObject:", v47);
        }
      }
      else
      {
        v47 = v41;
        self = v38;
      }

      if (v35 == ++v39)
      {
        v33 = obj;
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v86, 16);
        if (!v35)
          goto LABEL_46;
        goto LABEL_23;
      }
    }
  }
  v15 = 0;
LABEL_51:

  return v15;
}

- (id)_allDefaultFocusableRegionsInContainer:(id)a3 intersectingRegion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  CGRect v20;

  v6 = a3;
  v7 = a4;
  -[_UIFocusMap coordinateSpace](self, "coordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIFocusRegionEvaluator frameForRegion:inCoordinateSpace:](_UIFocusRegionEvaluator, "frameForRegion:inCoordinateSpace:", v7, v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  if (v6 && (v20.origin.x = v10, v20.origin.y = v12, v20.size.width = v14, v20.size.height = v16, !CGRectIsEmpty(v20)))
  {
    -[_UIFocusMap _defaultMapSnapshotter](self, "_defaultMapSnapshotter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRegionsContainer:", v6);
    objc_msgSend(v18, "setSnapshotFrame:", v10, v12, v14, v16);
    -[_UIFocusMap _findAllDefaultFocusableRegionsWithSnapshotter:](self, "_findAllDefaultFocusableRegionsWithSnapshotter:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

- (id)_closestFocusableItemToPoint:(CGPoint)a3 inRect:(CGRect)a4 excludingItems:(id)a5 distanceMeasuringUnitPoint:(CGPoint)a6
{
  double y;
  double x;
  double height;
  double width;
  double v10;
  double v11;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  UICoordinateSpace **p_coordinateSpace;
  double v33;
  double v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  _BOOL4 v48;
  double v49;
  id v50;
  id v52;
  void *v53;
  void *v55;
  id v56;
  id WeakRetained;
  id obj;
  void *v59;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  y = a6.y;
  x = a6.x;
  height = a4.size.height;
  width = a4.size.width;
  v10 = a4.origin.y;
  v11 = a4.origin.x;
  v71 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v72.origin.x = v11;
  v72.origin.y = v10;
  v72.size.width = width;
  v72.size.height = height;
  if (CGRectIsEmpty(v72))
  {
    v14 = 0;
  }
  else
  {
    -[_UIFocusMap _defaultMapSnapshotter](self, "_defaultMapSnapshotter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSnapshotFrame:", v11, v10, width, height);
    v55 = v15;
    objc_msgSend(v15, "captureSnapshot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    objc_msgSend(v16, "regions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v66 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          objc_msgSend(v23, "_defaultFocusItem");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v13, "containsObject:", v24);
          if (v24 && (v25 & 1) == 0 && _UIFocusItemIsFocusableInFocusSystem(v24, WeakRetained))
            objc_msgSend(v17, "addObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      }
      while (v20);
    }
    v56 = v13;

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v17;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (v26)
    {
      v27 = v26;
      v59 = 0;
      v28 = 0;
      v29 = fmax(fmin(x, 1.0), 0.0);
      v30 = fmax(fmin(y, 1.0), 0.0);
      v31 = *(_QWORD *)v62;
      p_coordinateSpace = &self->_coordinateSpace;
      v33 = 1.79769313e308;
      v34 = 1.79769313e308;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v62 != v31)
            objc_enumerationMutation(obj);
          v36 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
          objc_msgSend(v36, "_defaultFocusItem");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            objc_msgSend(v16, "originalRegionForRegion:", v36);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "snapshotFrameForRegion:", v38);
            v40 = v39;
            v42 = v41;
            v44 = v43;
            v46 = v45;
            v47 = objc_loadWeakRetained((id *)p_coordinateSpace);
            objc_msgSend(v47, "bounds");
            v74.origin.x = v40;
            v74.origin.y = v42;
            v74.size.width = v44;
            v74.size.height = v46;
            v48 = CGRectContainsRect(v73, v74);

            v49 = (a3.x - (v40 + v29 * v44)) * (a3.x - (v40 + v29 * v44))
                + (a3.y - (v42 + v30 * v46)) * (a3.y - (v42 + v30 * v46));
            if (v49 <= v34)
            {
              v50 = v37;

              v34 = v49;
              v28 = v50;
            }
            if (v49 <= v33 && v48)
            {
              v52 = v37;

              v59 = v52;
              v33 = v49;
            }

          }
        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      }
      while (v27);
    }
    else
    {
      v59 = 0;
      v28 = 0;
    }

    if (v59)
      v53 = v59;
    else
      v53 = v28;
    v14 = v53;

    v13 = v56;
  }

  return v14;
}

- (id)_findAllDefaultFocusableRegionsWithSnapshotter:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int IsFocusableInFocusSystemWithSearchInfo;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "captureSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusMap _defaultItemSearchContext](self, "_defaultItemSearchContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSnapshot:", v4);

  -[_UIFocusMap _focusMovementSearchContext](self, "_focusMovementSearchContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSnapshot:", v4);

  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v18 = v4;
  objc_msgSend(v4, "regions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "_defaultFocusItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[_UIFocusMap searchInfo](self, "searchInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          IsFocusableInFocusSystemWithSearchInfo = _UIFocusItemIsFocusableInFocusSystemWithSearchInfo(v14, WeakRetained, v15);

          if (IsFocusableInFocusSystemWithSearchInfo)
            objc_msgSend(v19, "addObject:", v13);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  return v19;
}

- (id)_linearlySortedFocusItemsForItems:(id)a3 groupFilter:(int64_t)a4 itemStandInMap:(id)a5
{
  id v8;
  id v9;
  _UIFocusGroupMap *v10;
  void *v11;
  _UIFocusGroupMap *v12;
  _UIFocusGroupMap *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _UIFocusGroupMap *v18;
  void *v19;
  _UIFocusGroupMap *v20;
  _UIFocusGroupMap *focusGroupMap;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void *v33;
  _UIFocusMap *v34;
  id v35;

  v8 = a3;
  v9 = a5;
  if (a4 == 1)
  {
    -[_UIFocusMap focusSystem](self, "focusSystem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "focusedItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v8, "arrayByAddingObject:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = [_UIFocusGroupMap alloc];
      -[_UIFocusMap coordinateSpace](self, "coordinateSpace");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[_UIFocusGroupMap initWithItems:standInItemsMap:coordinateSpace:](v18, "initWithItems:standInItemsMap:coordinateSpace:", v17, v9, v19);
      focusGroupMap = self->_focusGroupMap;
      self->_focusGroupMap = v20;

      -[_UIFocusGroupMap focusGroupForItem:](self->_focusGroupMap, "focusGroupForItem:", v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0CB3880];
      v30 = MEMORY[0x1E0C809B0];
      v31 = 3221225472;
      v32 = __76___UIFocusMap__linearlySortedFocusItemsForItems_groupFilter_itemStandInMap___block_invoke;
      v33 = &unk_1E16C6970;
      v34 = self;
      v35 = v22;
      v24 = v22;
      objc_msgSend(v23, "predicateWithBlock:", &v30);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "filteredArrayUsingPredicate:", v25, v30, v31, v32, v33, v34);
      v26 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v26;
    }

    goto LABEL_7;
  }
  if (a4 != 2)
  {
LABEL_7:
    objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_205);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v27;
    v8 = v14;
    goto LABEL_8;
  }
  v10 = [_UIFocusGroupMap alloc];
  -[_UIFocusMap coordinateSpace](self, "coordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_UIFocusGroupMap initWithItems:standInItemsMap:coordinateSpace:](v10, "initWithItems:standInItemsMap:coordinateSpace:", v8, v9, v11);
  v13 = self->_focusGroupMap;
  self->_focusGroupMap = v12;

  -[_UIFocusGroupMap focusItems](self->_focusGroupMap, "focusItems");
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v28 = v14;

  return v28;
}

- (BOOL)verifyFocusabilityForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[_UIFocusItemInfo infoWithItem:](_UIFocusItemInfo, "infoWithItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ancestorEnvironmentScrollableContainers");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "scrollableContainer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIFocusMap focusSystem](self, "focusSystem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "_isScrollingScrollableContainer:targetContentOffset:", v11, 0);

        if ((v13 & 1) != 0)
        {
          LOBYTE(v18) = 1;
          v14 = v6;
          goto LABEL_21;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v8)
        continue;
      break;
    }
  }

  -[_UIFocusMap _defaultMapSnapshotter](self, "_defaultMapSnapshotter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFocusedRegion:", 0);
  objc_msgSend(v14, "coordinateSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSnapshotFrame:", _UIFocusItemFrameInCoordinateSpace(v4, v15));

  objc_msgSend(v14, "captureSnapshot");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v16, "regions", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v24;
    while (2)
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "_defaultFocusItem");
        v21 = (id)objc_claimAutoreleasedReturnValue();

        if (v21 == v4)
        {
          LOBYTE(v18) = 1;
          goto LABEL_20;
        }
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v18)
        continue;
      break;
    }
  }
LABEL_20:

LABEL_21:
  return v18;
}

- (void)_beginTrackingSearches
{
  void *v4;

  if (self->_trackingSearchInfo)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMap.m"), 1154, CFSTR("Attempted to begin tracking focus map searches  without finishing previous tracking."));

  }
  *(_WORD *)&self->_trackingSearchInfo = 257;
}

- (id)_stopTrackingSearches
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _UIFocusMapSearchInfo *defaultItemSearchInfo;
  _UIFocusMapSearchInfo *focusMovementSearchInfo;

  if (self->_trackingSearchInfo)
  {
    *(_WORD *)&self->_trackingSearchInfo = 0;
    -[_UIFocusMap _defaultItemSearchContext](self, "_defaultItemSearchContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      -[_UIFocusMap _focusMovementSearchContext](self, "_focusMovementSearchContext");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

    defaultItemSearchInfo = self->_defaultItemSearchInfo;
    self->_defaultItemSearchInfo = 0;

    focusMovementSearchInfo = self->_focusMovementSearchInfo;
    self->_focusMovementSearchInfo = 0;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_beginTrackingDefaultItemSearchInfoIfNecessary
{
  _UIFocusMapSearchInfo *v3;
  _UIFocusMapSearchInfo *defaultItemSearchInfo;

  if (self->_trackingSearchInfo && self->_needsSearchInfo)
  {
    v3 = objc_alloc_init(_UIFocusMapSearchInfo);
    defaultItemSearchInfo = self->_defaultItemSearchInfo;
    self->_defaultItemSearchInfo = v3;

    self->_needsSearchInfo = 0;
  }
}

- (void)_beginTrackingFocusMovementSearchInfoIfNecessary
{
  _UIFocusMapSearchInfo *v3;
  _UIFocusMapSearchInfo *focusMovementSearchInfo;

  if (self->_trackingSearchInfo && self->_needsSearchInfo)
  {
    v3 = objc_alloc_init(_UIFocusMapSearchInfo);
    focusMovementSearchInfo = self->_focusMovementSearchInfo;
    self->_focusMovementSearchInfo = v3;

    self->_needsSearchInfo = 0;
  }
}

- (void)_trackExternalSnapshot:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UIFocusMap _defaultItemSearchContext](self, "_defaultItemSearchContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSnapshot:", v4);

  -[_UIFocusMap _focusMovementSearchContext](self, "_focusMovementSearchContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSnapshot:", v4);

}

- (void)diagnoseFocusabilityForItem:(id)a3 report:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  BOOL v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
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
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMap.m"), 1203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusMap.m"), 1204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("report"));

LABEL_3:
  if ((objc_msgSend(v7, "canBecomeFocused") & 1) != 0)
  {
    -[_UIFocusMap _defaultMapSnapshotter](self, "_defaultMapSnapshotter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFocusedRegion:", 0);
    objc_msgSend(v10, "captureSnapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend(v11, "originalRegions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v61;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v61 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v18, "_defaultFocusItem");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          if (v19)
            v20 = v19 == v7;
          else
            v20 = 0;
          if (v20)
          {
            objc_msgSend(v12, "addObject:", v18);

            goto LABEL_18;
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_18:

    if (objc_msgSend(v12, "count"))
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v22 = v12;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      if (v23)
      {
        v24 = v23;
        v43 = v12;
        v44 = v10;
        v25 = *(_QWORD *)v57;
        v48 = v11;
        v49 = v9;
        v47 = v22;
        v45 = v7;
        v46 = *(_QWORD *)v57;
        do
        {
          v26 = 0;
          v50 = v24;
          do
          {
            if (*(_QWORD *)v57 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v26);
            objc_msgSend(v11, "regionsForOriginalRegion:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v28, "count"))
            {
              v51 = v26;
              +[_UIDebugIssue issueWithDescription:](_UIDebugIssue, "issueWithDescription:", CFSTR("The item is being visually occluded by the following items:"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = 0u;
              v53 = 0u;
              v54 = 0u;
              v55 = 0u;
              objc_msgSend(v11, "occludingRegionsForRegion:", v27);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
              if (v31)
              {
                v32 = v31;
                v33 = *(_QWORD *)v53;
                do
                {
                  for (j = 0; j != v32; ++j)
                  {
                    if (*(_QWORD *)v53 != v33)
                      objc_enumerationMutation(v30);
                    objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "_debugAssociatedObject");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v35)
                    {
                      v36 = (void *)MEMORY[0x1E0CB3940];
                      v37 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v37);
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v36, "stringWithFormat:", CFSTR("<%@: %p>"), v38, v35);
                      v39 = (void *)objc_claimAutoreleasedReturnValue();

                      +[_UIDebugIssue issueWithDescription:](_UIDebugIssue, "issueWithDescription:", v39);
                      v40 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v40, "setPrefix:", &stru_1E16EDF20);
                      objc_msgSend(v29, "addIssue:", v40);

                    }
                  }
                  v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
                }
                while (v32);
              }

              v9 = v49;
              objc_msgSend(v49, "addIssue:", v29);

              v22 = v47;
              v11 = v48;
              v25 = v46;
              v24 = v50;
              v26 = v51;
            }

            ++v26;
          }
          while (v26 != v24);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        }
        while (v24);
        v10 = v44;
        v7 = v45;
        v12 = v43;
      }
    }
    else
    {
      +[_UIDebugIssue issueWithDescription:](_UIDebugIssue, "issueWithDescription:", CFSTR("This item is not visible onscreen."));
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addIssue:", v22);
    }

  }
  else
  {
    +[_UIDebugIssue issueWithDescription:](_UIDebugIssue, "issueWithDescription:", CFSTR("This item returns NO from -canBecomeFocused."));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addIssue:", v21);

  }
}

- (UIFocusSystem)focusSystem
{
  return (UIFocusSystem *)objc_loadWeakRetained((id *)&self->_focusSystem);
}

- (_UIFocusRegionContainer)rootContainer
{
  return (_UIFocusRegionContainer *)objc_loadWeakRetained((id *)&self->_rootContainer);
}

- (UICoordinateSpace)coordinateSpace
{
  return (UICoordinateSpace *)objc_loadWeakRetained((id *)&self->_coordinateSpace);
}

- (_UIFocusGroupMap)focusGroupMap
{
  return self->_focusGroupMap;
}

- (_UIFocusSearchInfo)searchInfo
{
  return self->_searchInfo;
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

- (_UIFocusMapSearchInfo)_defaultItemSearchContext
{
  return self->_defaultItemSearchInfo;
}

- (_UIFocusMapSearchInfo)_focusMovementSearchContext
{
  return self->_focusMovementSearchInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusMovementSearchInfo, 0);
  objc_storeStrong((id *)&self->_defaultItemSearchInfo, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_storeStrong((id *)&self->_focusGroupMap, 0);
  objc_destroyWeak((id *)&self->_coordinateSpace);
  objc_destroyWeak((id *)&self->_rootContainer);
  objc_destroyWeak((id *)&self->_focusSystem);
  objc_storeStrong((id *)&self->_rootContainerProxy, 0);
}

@end
