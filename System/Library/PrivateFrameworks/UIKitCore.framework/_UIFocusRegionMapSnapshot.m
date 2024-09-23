@implementation _UIFocusRegionMapSnapshot

- (id)_initWithRequest:(id)a3
{
  id v4;
  _UIFocusRegionMapSnapshot *v5;
  uint64_t v6;
  _UIFocusRegionMapSnapshotRequest *request;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  NSMutableArray *v27;
  NSMutableArray *detectedFocusableViewMapEntries;
  NSMutableArray *v29;
  NSMutableArray *detectedFocusableGuideMapEntries;
  NSMutableArray *v31;
  NSMutableArray *detectedFocusContainerGuideMapEntries;
  CGSize v33;
  objc_super v35;
  CGRect v36;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_UIFocusRegionMapSnapshot;
  v5 = -[_UIFocusRegionMapSnapshot init](&v35, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    request = v5->_request;
    v5->_request = (_UIFocusRegionMapSnapshotRequest *)v6;

    objc_msgSend(v4, "rootView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_rootView, v8);

    objc_msgSend(v4, "snapshotRect");
    if (CGRectIsEmpty(v36))
    {
      objc_msgSend(v4, "rootView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_focusRegionFrame");
      v5->_snapshottedRect.origin.x = v10;
      v5->_snapshottedRect.origin.y = v11;
      v5->_snapshottedRect.size.width = v12;
      v5->_snapshottedRect.size.height = v13;

    }
    else
    {
      objc_msgSend(v4, "snapshotRect");
      v5->_snapshottedRect.origin.x = v14;
      v5->_snapshottedRect.origin.y = v15;
      v5->_snapshottedRect.size.width = v16;
      v5->_snapshottedRect.size.height = v17;
    }
    objc_msgSend(v4, "focusedRect");
    v5->_focusedRect.origin.x = v18;
    v5->_focusedRect.origin.y = v19;
    v5->_focusedRect.size.width = v20;
    v5->_focusedRect.size.height = v21;
    v5->_focusHeading = objc_msgSend(v4, "focusHeading");
    v5->_clipToSnapshotRect = objc_msgSend(v4, "clipToSnapshotRect");
    objc_msgSend(v4, "visualRepresentationMinimumArea");
    v5->_visualRepresentationMinimumArea.origin.x = v22;
    v5->_visualRepresentationMinimumArea.origin.y = v23;
    v5->_visualRepresentationMinimumArea.size.width = v24;
    v5->_visualRepresentationMinimumArea.size.height = v25;
    objc_msgSend(v4, "focusableRegionAncestorView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_focusableRegionAncestorView, v26);

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    detectedFocusableViewMapEntries = v5->_detectedFocusableViewMapEntries;
    v5->_detectedFocusableViewMapEntries = v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    detectedFocusableGuideMapEntries = v5->_detectedFocusableGuideMapEntries;
    v5->_detectedFocusableGuideMapEntries = v29;

    v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    detectedFocusContainerGuideMapEntries = v5->_detectedFocusContainerGuideMapEntries;
    v5->_detectedFocusContainerGuideMapEntries = v31;

    v33 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v5->_regionClipFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v5->_regionClipFrame.size = v33;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  CGSize size;
  CGSize v9;
  CGSize v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v4 = -[_UIFocusRegionMapSnapshot _initWithRequest:](+[_UIFocusRegionMapSnapshot allocWithZone:](_UIFocusRegionMapSnapshot, "allocWithZone:", a3), "_initWithRequest:", self->_request);
  v5 = -[_UIFocusRegionMapSnapshotRequest copy](self->_request, "copy");
  v6 = (void *)*((_QWORD *)v4 + 8);
  *((_QWORD *)v4 + 8) = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_rootView);
  objc_storeWeak((id *)v4 + 9, WeakRetained);

  size = self->_snapshottedRect.size;
  *((_OWORD *)v4 + 12) = self->_snapshottedRect.origin;
  *((CGSize *)v4 + 13) = size;
  *((_BYTE *)v4 + 48) = self->_committed;
  v9 = self->_focusedRect.size;
  *((_OWORD *)v4 + 14) = self->_focusedRect.origin;
  *((CGSize *)v4 + 15) = v9;
  *((_QWORD *)v4 + 15) = self->_focusHeading;
  *((_BYTE *)v4 + 50) = self->_clipToSnapshotRect;
  v10 = self->_visualRepresentationMinimumArea.size;
  *((_OWORD *)v4 + 16) = self->_visualRepresentationMinimumArea.origin;
  *((CGSize *)v4 + 17) = v10;
  v11 = objc_loadWeakRetained((id *)&self->_focusableRegionAncestorView);
  objc_storeWeak((id *)v4 + 16, v11);

  v12 = -[NSMutableArray mutableCopy](self->_retainedPromiseRegions, "mutableCopy");
  v13 = (void *)*((_QWORD *)v4 + 14);
  *((_QWORD *)v4 + 14) = v12;

  v14 = -[NSMutableArray mutableCopy](self->_detectedFocusableViewMapEntries, "mutableCopy");
  v15 = (void *)*((_QWORD *)v4 + 11);
  *((_QWORD *)v4 + 11) = v14;

  v16 = -[NSMutableArray mutableCopy](self->_detectedFocusableGuideMapEntries, "mutableCopy");
  v17 = (void *)*((_QWORD *)v4 + 12);
  *((_QWORD *)v4 + 12) = v16;

  v18 = -[NSMutableArray mutableCopy](self->_detectedFocusContainerGuideMapEntries, "mutableCopy");
  v19 = (void *)*((_QWORD *)v4 + 13);
  *((_QWORD *)v4 + 13) = v18;

  v20 = -[NSArray copy](self->_finalFocusableRegionMapEntries, "copy");
  v21 = (void *)*((_QWORD *)v4 + 17);
  *((_QWORD *)v4 + 17) = v20;

  v22 = -[NSArray copy](self->_sortedFocusContainerGuideMapEntries, "copy");
  v23 = (void *)*((_QWORD *)v4 + 10);
  *((_QWORD *)v4 + 10) = v22;

  return v4;
}

- (void)setFocusedRect:(CGRect)a3
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
  if (!CGRectEqualToRect(self->_focusedRect, a3))
  {
    self->_focusedRect.origin.x = x;
    self->_focusedRect.origin.y = y;
    self->_focusedRect.size.width = width;
    self->_focusedRect.size.height = height;
    v8.origin.x = x;
    v8.origin.y = y;
    v8.size.width = width;
    v8.size.height = height;
    self->_isFocusedRectEmpty = CGRectIsEmpty(v8);
  }
}

- (CGRect)_clippedRegionFrame:(CGRect)a3 isFocusGuide:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect result;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[_UIFocusRegionMapSnapshot clipToSnapshotRect](self, "clipToSnapshotRect"))
  {
    -[_UIFocusRegionMapSnapshot snapshottedRect](self, "snapshottedRect");
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    v35 = CGRectIntersection(v34, v41);
    v10 = v35.origin.x;
    v11 = v35.origin.y;
    v12 = v35.size.width;
    v13 = v35.size.height;
    if (!self->_isFocusedRectEmpty && v4 && !CGRectIsNull(v35))
    {
      if (self->_didSetRegionClipFrame)
      {
        v14 = self->_regionClipFrame.origin.x;
        v15 = self->_regionClipFrame.origin.y;
        v16 = self->_regionClipFrame.size.width;
        v17 = self->_regionClipFrame.size.height;
      }
      else
      {
        -[_UIFocusRegionMapSnapshot snapshottedRect](self, "snapshottedRect");
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v25 = v24;
        -[_UIFocusRegionMapSnapshot focusedRect](self, "focusedRect");
        v42.origin.x = v26;
        v42.origin.y = v27;
        v42.size.width = v28;
        v42.size.height = v29;
        v36.origin.x = v19;
        v36.origin.y = v21;
        v36.size.width = v23;
        v36.size.height = v25;
        *(CGRect *)&v14 = CGRectUnion(v36, v42);
        self->_regionClipFrame.origin.x = v14;
        self->_regionClipFrame.origin.y = v15;
        self->_regionClipFrame.size.width = v16;
        self->_regionClipFrame.size.height = v17;
        self->_didSetRegionClipFrame = 1;
      }
      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = width;
      v43.size.height = height;
      v37 = CGRectIntersection(*(CGRect *)&v14, v43);
      v10 = v37.origin.x;
      v11 = v37.origin.y;
      v12 = v37.size.width;
      v13 = v37.size.height;
    }
    v38.origin.x = v10;
    v38.origin.y = v11;
    v38.size.width = v12;
    v38.size.height = v13;
    if (fabs(CGRectGetWidth(v38)) < 0.0001
      || (v39.origin.x = v10,
          v39.origin.y = v11,
          v39.size.width = v12,
          v39.size.height = v13,
          fabs(CGRectGetHeight(v39)) < 0.0001))
    {
      v10 = *MEMORY[0x1E0C9D628];
      v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }
  }
  else
  {
    v10 = x;
    v11 = y;
    v12 = width;
    v13 = height;
  }
  v30 = v10;
  v31 = v11;
  v32 = v12;
  v33 = v13;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)_addFocusableRegion:(id)a3 isFocusGuide:(BOOL)a4 withFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v9;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL IsNull;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _UIFocusableRegionMapEntry *v20;
  void *v21;
  NSMutableArray *retainedPromiseRegions;
  NSMutableArray *v23;
  NSMutableArray *v24;
  id v25;
  CGRect v26;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4;
  v25 = a3;
  -[_UIFocusRegionMapSnapshot _clippedRegionFrame:isFocusGuide:](self, "_clippedRegionFrame:isFocusGuide:", v9, x, y, width, height);
  v11 = v26.origin.x;
  v12 = v26.origin.y;
  v13 = v26.size.width;
  v14 = v26.size.height;
  IsNull = CGRectIsNull(v26);
  v16 = v25;
  if (!IsNull)
  {
    if (v9)
    {
      -[_UIFocusRegionMapSnapshot detectedFocusableGuideMapEntries](self, "detectedFocusableGuideMapEntries");
    }
    else
    {
      -[_UIFocusRegionMapSnapshot detectedFocusableViewMapEntries](self, "detectedFocusableViewMapEntries");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFocusRegionMapSnapshot _punchHoleInMap:atFrame:](self, "_punchHoleInMap:atFrame:", v17, v11, v12, v13, v14);

      -[_UIFocusRegionMapSnapshot detectedFocusableGuideMapEntries](self, "detectedFocusableGuideMapEntries");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFocusRegionMapSnapshot _punchHoleInMap:atFrame:](self, "_punchHoleInMap:atFrame:", v18, v11, v12, v13, v14);

      -[_UIFocusRegionMapSnapshot detectedFocusContainerGuideMapEntries](self, "detectedFocusContainerGuideMapEntries");
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFocusRegionMapSnapshot _punchHoleInMap:atFrame:](self, "_punchHoleInMap:atFrame:", v19, v11, v12, v13, v14);

    v20 = -[_UIFocusRegionMapEntry initWithFrame:originalRegionFrame:]([_UIFocusableRegionMapEntry alloc], "initWithFrame:originalRegionFrame:", v11, v12, v13, v14, x, y, width, height);
    -[_UIFocusableRegionMapEntry setFocusableRegion:](v20, "setFocusableRegion:", v25);
    -[_UIFocusableRegionMapEntry setIsFocusGuide:](v20, "setIsFocusGuide:", v9);
    if (v9)
      -[_UIFocusRegionMapSnapshot detectedFocusableGuideMapEntries](self, "detectedFocusableGuideMapEntries");
    else
      -[_UIFocusRegionMapSnapshot detectedFocusableViewMapEntries](self, "detectedFocusableViewMapEntries");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v20);

    if (objc_msgSend(v25, "_isPromiseFocusRegion"))
    {
      retainedPromiseRegions = self->_retainedPromiseRegions;
      if (!retainedPromiseRegions)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v23 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v24 = self->_retainedPromiseRegions;
        self->_retainedPromiseRegions = v23;

        retainedPromiseRegions = self->_retainedPromiseRegions;
      }
      -[NSMutableArray addObject:](retainedPromiseRegions, "addObject:", v25);
    }

    v16 = v25;
  }

}

- (void)_addFocusContainerGuide:(id)a3 withFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL IsNull;
  _UIFocusContainerGuideMapEntry *v16;
  void *v17;
  id v18;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  if (!self->_isFocusedRectEmpty)
  {
    v18 = v9;
    v10 = -[_UIFocusRegionMapSnapshot focusHeading](self, "focusHeading");
    v9 = v18;
    if (v10)
    {
      -[_UIFocusRegionMapSnapshot _clippedRegionFrame:isFocusGuide:](self, "_clippedRegionFrame:isFocusGuide:", 1, x, y, width, height);
      v11 = v19.origin.x;
      v12 = v19.origin.y;
      v13 = v19.size.width;
      v14 = v19.size.height;
      IsNull = CGRectIsNull(v19);
      v9 = v18;
      if (!IsNull)
      {
        v16 = -[_UIFocusRegionMapEntry initWithFrame:originalRegionFrame:]([_UIFocusContainerGuideMapEntry alloc], "initWithFrame:originalRegionFrame:", v11, v12, v13, v14, x, y, width, height);
        -[_UIFocusContainerGuideMapEntry setFocusContainerGuide:](v16, "setFocusContainerGuide:", v18);
        -[_UIFocusContainerGuideMapEntry setFocusContainmentFrame:](v16, "setFocusContainmentFrame:", x, y, width, height);
        -[_UIFocusRegionMapSnapshot detectedFocusContainerGuideMapEntries](self, "detectedFocusContainerGuideMapEntries");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v16);

        v9 = v18;
      }
    }
  }

}

- (void)_occludeFocusInFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  id v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIFocusRegionMapSnapshot detectedFocusableViewMapEntries](self, "detectedFocusableViewMapEntries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMapSnapshot _punchHoleInMap:atFrame:](self, "_punchHoleInMap:atFrame:", v8, x, y, width, height);

  -[_UIFocusRegionMapSnapshot detectedFocusableGuideMapEntries](self, "detectedFocusableGuideMapEntries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMapSnapshot _punchHoleInMap:atFrame:](self, "_punchHoleInMap:atFrame:", v9, x, y, width, height);

  -[_UIFocusRegionMapSnapshot detectedFocusContainerGuideMapEntries](self, "detectedFocusContainerGuideMapEntries");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMapSnapshot _punchHoleInMap:atFrame:](self, "_punchHoleInMap:atFrame:", v10, x, y, width, height);

}

- (void)_punchHoleInMap:(id)a3 atFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v16, "_mapEntriesByOccludingWithFrame:", x, y, width, height, (_QWORD)v18);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v9, "addIndex:", objc_msgSend(v11, "indexOfObject:", v16));
            objc_msgSend(v10, "addObjectsFromArray:", v17);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    objc_msgSend(v11, "removeObjectsAtIndexes:", v9);
    objc_msgSend(v11, "addObjectsFromArray:", v10);

  }
}

- (id)_finalFocusableRegionMapEntriesFromMapEntries:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _UIFocusRegionMapSnapshot *v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  int v44;
  id v46;
  id obj;
  char v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;
  CGRect v60;
  CGRect v61;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v54 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v10, "focusableRegion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v5, "containsObject:", v11);

        if ((v12 & 1) == 0)
        {
          -[_UIFocusRegionMapSnapshot focusableRegionAncestorView](self, "focusableRegionAncestorView");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            objc_msgSend(v10, "focusableRegion");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "_focusRegionView");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIFocusRegionMapSnapshot focusableRegionAncestorView](self, "focusableRegionAncestorView");
            v17 = v7;
            v18 = v8;
            v19 = v5;
            v20 = self;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v16, "isDescendantOfView:", v21);

            self = v20;
            v5 = v19;
            v8 = v18;
            v7 = v17;

            if ((v48 & 1) == 0)
            {
LABEL_12:
              objc_msgSend(v10, "focusableRegion");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v36);

              continue;
            }
          }
          if (objc_msgSend(v10, "isFocusGuide"))
          {
            objc_msgSend(v10, "focusableRegion");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v22, "_automaticallyDisableWhenIntersectingFocus") & 1) != 0)
            {
              objc_msgSend(v10, "frame");
              v24 = v23;
              v26 = v25;
              v28 = v27;
              v30 = v29;
              -[_UIFocusRegionMapSnapshot focusedRect](self, "focusedRect");
              v61.origin.x = v31;
              v61.origin.y = v32;
              v61.size.width = v33;
              v61.size.height = v34;
              v60.origin.x = v24;
              v60.origin.y = v26;
              v60.size.width = v28;
              v60.size.height = v30;
              v35 = CGRectIntersectsRect(v60, v61);

              if (v35)
                goto LABEL_12;
            }
            else
            {

            }
          }
          objc_msgSend(v46, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v46, "count") && objc_msgSend(v5, "count"))
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v37 = (void *)objc_msgSend(v46, "copy");
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v50 != v40)
            objc_enumerationMutation(v37);
          v42 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          objc_msgSend(v42, "focusableRegion");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v5, "containsObject:", v43);

          if (v44)
            objc_msgSend(v46, "removeObject:", v42);
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v39);
    }

  }
  return v46;
}

- (id)_finalFocusableRegionMapEntriesFromViewMapEntries:(id)a3 guideMapEntries:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[_UIFocusRegionMapSnapshot _finalFocusableRegionMapEntriesFromMapEntries:](self, "_finalFocusableRegionMapEntriesFromMapEntries:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMapSnapshot _finalFocusableRegionMapEntriesFromMapEntries:](self, "_finalFocusableRegionMapEntriesFromMapEntries:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
        -[_UIFocusRegionMapSnapshot detectedFocusContainerGuideMapEntries](self, "detectedFocusContainerGuideMapEntries");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "frame");
        -[_UIFocusRegionMapSnapshot _punchHoleInMap:atFrame:](self, "_punchHoleInMap:atFrame:", v14);

        objc_msgSend(v13, "frame");
        -[_UIFocusRegionMapSnapshot _punchHoleInMap:atFrame:](self, "_punchHoleInMap:atFrame:", v7);
        objc_msgSend(v7, "addObject:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_sortedEligibleFocusContainerGuidesInArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t j;
  void *v40;
  void *v41;
  char v42;
  double v43;
  double v44;
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
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  id v71;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;
  CGRect v86;
  CGRect v87;

  v85 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count") || self->_isFocusedRectEmpty)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v73 = v4;
  v74 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
  if (!v9)
    goto LABEL_19;
  v10 = v9;
  v11 = *(_QWORD *)v80;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v80 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
      objc_msgSend(v13, "focusContainerGuide", v73);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v7, "containsObject:", v14);

      if ((v15 & 1) == 0)
      {
        objc_msgSend(v13, "focusContainerGuide");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "_automaticallyDisableWhenIntersectingFocus"))
        {
          objc_msgSend(v13, "frame");
          v18 = v17;
          v20 = v19;
          v22 = v21;
          v24 = v23;
          -[_UIFocusRegionMapSnapshot focusedRect](self, "focusedRect");
          v87.origin.x = v25;
          v87.origin.y = v26;
          v87.size.width = v27;
          v87.size.height = v28;
          v86.origin.x = v18;
          v86.origin.y = v20;
          v86.size.width = v22;
          v86.size.height = v24;
          v29 = CGRectIntersectsRect(v86, v87);

          if (v29)
          {
            objc_msgSend(v13, "focusContainerGuide");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v7;
LABEL_16:
            objc_msgSend(v31, "addObject:", v30);

            continue;
          }
        }
        else
        {

        }
        objc_msgSend(v13, "focusContainerGuide");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v74, "containsObject:", v32);

        if ((v33 & 1) != 0)
          continue;
        objc_msgSend(v6, "addObject:", v13);
        objc_msgSend(v13, "focusContainerGuide");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v74;
        goto LABEL_16;
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
  }
  while (v10);
LABEL_19:

  if (objc_msgSend(v6, "count"))
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v34 = (void *)objc_msgSend(v6, "copy");
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v76;
      v38 = -1.0;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v76 != v37)
            objc_enumerationMutation(v34);
          v40 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
          objc_msgSend(v40, "focusContainerGuide", v73);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v7, "containsObject:", v41);

          if ((v42 & 1) != 0)
            goto LABEL_29;
          if (v38 < 0.0)
          {
            -[_UIFocusRegionMapSnapshot focusedRect](self, "focusedRect");
            v47 = _UIRectDeparturePointAlongFocusHeading(-[_UIFocusRegionMapSnapshot focusHeading](self, "focusHeading"), v43, v44, v45, v46);
            v49 = v48;
            -[_UIFocusRegionMapSnapshot snapshottedRect](self, "snapshottedRect");
            v54 = _UIRectDeparturePointAlongFocusHeading(-[_UIFocusRegionMapSnapshot focusHeading](self, "focusHeading"), v50, v51, v52, v53);
            _UIPointAxisAlignedDistanceAlongFocusHeading(-[_UIFocusRegionMapSnapshot focusHeading](self, "focusHeading"), v47, v49, v54, v55);
            v38 = v56;
          }
          -[_UIFocusRegionMapSnapshot focusedRect](self, "focusedRect");
          v61 = _UIRectDeparturePointAlongFocusHeading(-[_UIFocusRegionMapSnapshot focusHeading](self, "focusHeading"), v57, v58, v59, v60);
          v63 = v62;
          objc_msgSend(v40, "focusContainmentFrame");
          v68 = _UIRectDeparturePointAlongFocusHeading(-[_UIFocusRegionMapSnapshot focusHeading](self, "focusHeading"), v64, v65, v66, v67);
          _UIPointAxisAlignedDistanceAlongFocusHeading(-[_UIFocusRegionMapSnapshot focusHeading](self, "focusHeading"), v61, v63, v68, v69);
          objc_msgSend(v40, "setAxisAlignedDistanceFromFocusedRect:");
          objc_msgSend(v40, "axisAlignedDistanceFromFocusedRect");
          if (v70 > v38)
LABEL_29:
            objc_msgSend(v6, "removeObject:", v40);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      }
      while (v36);
    }

  }
  v71 = v6;
  v5 = v71;
  if ((unint64_t)objc_msgSend(v71, "count") >= 2)
  {
    objc_msgSend(v71, "sortedArrayUsingComparator:", &__block_literal_global_204);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v4 = v73;
LABEL_36:

  return v5;
}

- (void)_updateFinalFocusableRegionMapEntries
{
  void *v3;
  void *v4;
  id v5;

  -[_UIFocusRegionMapSnapshot detectedFocusableViewMapEntries](self, "detectedFocusableViewMapEntries");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMapSnapshot detectedFocusableGuideMapEntries](self, "detectedFocusableGuideMapEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMapSnapshot _finalFocusableRegionMapEntriesFromViewMapEntries:guideMapEntries:](self, "_finalFocusableRegionMapEntriesFromViewMapEntries:guideMapEntries:", v5, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMapSnapshot setFinalFocusableRegionMapEntries:](self, "setFinalFocusableRegionMapEntries:", v4);

}

- (void)_updateSortedFocusContainerGuideMapEntries
{
  void *v3;
  id v4;

  -[_UIFocusRegionMapSnapshot detectedFocusContainerGuideMapEntries](self, "detectedFocusContainerGuideMapEntries");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMapSnapshot _sortedEligibleFocusContainerGuidesInArray:](self, "_sortedEligibleFocusContainerGuidesInArray:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMapSnapshot setSortedFocusContainerGuideMapEntries:](self, "setSortedFocusContainerGuideMapEntries:", v3);

}

- (void)_commit
{
  -[_UIFocusRegionMapSnapshot _updateFinalFocusableRegionMapEntries](self, "_updateFinalFocusableRegionMapEntries");
  -[_UIFocusRegionMapSnapshot _updateSortedFocusContainerGuideMapEntries](self, "_updateSortedFocusContainerGuideMapEntries");
  -[_UIFocusRegionMapSnapshot setCommitted:](self, "setCommitted:", 1);
}

- (id)focusableRegionMapEntriesLimitedByFocusContainerGuide:(id)a3
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusRegionMapSnapshot.m"), 608, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusContainerGuide"));

  }
  -[_UIFocusRegionMapSnapshot snapshottedRect](self, "snapshottedRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "_focusRegionFrame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[_UIFocusRegionMapSnapshot focusedRect](self, "focusedRect");
  v50.origin.x = v22;
  v50.origin.y = v23;
  v50.size.width = v24;
  v50.size.height = v25;
  v46.origin.x = v15;
  v46.origin.y = v17;
  v46.size.width = v19;
  v46.size.height = v21;
  v51 = CGRectUnion(v46, v50);
  v47.origin.x = v7;
  v47.origin.y = v9;
  v47.size.width = v11;
  v47.size.height = v13;
  v48 = CGRectIntersection(v47, v51);
  x = v48.origin.x;
  y = v48.origin.y;
  width = v48.size.width;
  height = v48.size.height;
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[_UIFocusRegionMapSnapshot finalFocusableRegionMapEntries](self, "finalFocusableRegionMapEntries");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v41 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v36, "frame");
        v52.origin.x = x;
        v52.origin.y = y;
        v52.size.width = width;
        v52.size.height = height;
        if (CGRectIntersectsRect(v49, v52))
          objc_msgSend(v30, "addObject:", v36);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v33);
  }

  v37 = (void *)objc_msgSend(v30, "copy");
  return v37;
}

- (id)_snapshotByFulfillingPromiseFocusRegionEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t m;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v75;
  void *v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;
  CGRect v99;
  CGRect v100;

  v98 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[_UIFocusRegionMapSnapshot copy](self, "copy");
  if (v4
    && (objc_msgSend(v4, "focusableRegion"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "_isPromiseFocusRegion"),
        v6,
        (v7 & 1) != 0))
  {
    objc_msgSend(v4, "focusableRegion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_fulfillPromisedFocusRegion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v76 = v5;
      if (!_UIFocusItemIsFocusedOrFocusable(v9))
        goto LABEL_17;
      objc_msgSend(v9, "_focusRegionFrame");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(v4, "originalRegionFrame");
      v100.origin.x = v18;
      v100.origin.y = v19;
      v100.size.width = v20;
      v100.size.height = v21;
      v99.origin.x = v11;
      v99.origin.y = v13;
      v99.size.width = v15;
      v99.size.height = v17;
      if (CGRectEqualToRect(v99, v100))
      {
        v22 = v9;
        v77 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        v89 = 0u;
        objc_msgSend(v5, "detectedFocusableViewMapEntries");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v87;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v87 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
              objc_msgSend(v29, "focusableRegion");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "focusableRegion");
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (v30 == v31)
              {
                objc_msgSend(v29, "frame");
                objc_msgSend(v29, "sliceWithFrame:");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "setFocusableRegion:", v22);
                objc_msgSend(v23, "addObject:", v32);
                objc_msgSend(v77, "addObject:", v29);

              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
          }
          while (v26);
        }

        v5 = v76;
        objc_msgSend(v76, "detectedFocusableViewMapEntries");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "removeObjectsInArray:", v77);

        objc_msgSend(v76, "detectedFocusableViewMapEntries");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObjectsFromArray:", v23);

        objc_msgSend(v76, "_updateFinalFocusableRegionMapEntries");
      }
      else
      {
LABEL_17:
        -[_UIFocusRegionMapSnapshot request](self, "request");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(v36, "copy");

        v75 = v9;
        objc_msgSend(v37, "setRootView:", v9);
        objc_msgSend(v4, "originalEntry");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "frame");
        objc_msgSend(v37, "setSnapshotRect:");

        v77 = v37;
        objc_msgSend(v37, "takeSnapshot");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        objc_msgSend(v4, "originalEntry");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "occludingFrames");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v83;
          do
          {
            for (j = 0; j != v42; ++j)
            {
              if (*(_QWORD *)v83 != v43)
                objc_enumerationMutation(v40);
              objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * j), "CGRectValue");
              objc_msgSend(v23, "_occludeFocusInFrame:");
            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
          }
          while (v42);
        }

        v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        objc_msgSend(v76, "detectedFocusableViewMapEntries");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v79;
          do
          {
            for (k = 0; k != v48; ++k)
            {
              if (*(_QWORD *)v79 != v49)
                objc_enumerationMutation(v46);
              v51 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * k);
              objc_msgSend(v51, "focusableRegion");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "focusableRegion");
              v53 = (void *)objc_claimAutoreleasedReturnValue();

              if (v52 == v53)
                objc_msgSend(v45, "addObject:", v51);
            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
          }
          while (v48);
        }

        objc_msgSend(v76, "detectedFocusableViewMapEntries");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "removeObjectsInArray:", v45);

        objc_msgSend(v76, "detectedFocusableViewMapEntries");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "detectedFocusableViewMapEntries");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addObjectsFromArray:", v56);

        objc_msgSend(v76, "detectedFocusableGuideMapEntries");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "detectedFocusableGuideMapEntries");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "addObjectsFromArray:", v58);

        objc_msgSend(v76, "detectedFocusContainerGuideMapEntries");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "detectedFocusContainerGuideMapEntries");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "addObjectsFromArray:", v60);

        v5 = v76;
        objc_msgSend(v76, "_commit");

        v22 = v75;
      }

      v61 = v5;
    }
    else
    {
      v62 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v93 = 0u;
      v63 = v5;
      objc_msgSend(v5, "detectedFocusableViewMapEntries");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
      if (v65)
      {
        v66 = v65;
        v67 = *(_QWORD *)v91;
        do
        {
          for (m = 0; m != v66; ++m)
          {
            if (*(_QWORD *)v91 != v67)
              objc_enumerationMutation(v64);
            v69 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * m);
            objc_msgSend(v69, "focusableRegion");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "focusableRegion");
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            if (v70 == v71)
              objc_msgSend(v62, "addObject:", v69);
          }
          v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
        }
        while (v66);
      }

      v5 = v63;
      objc_msgSend(v63, "detectedFocusableViewMapEntries");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "removeObjectsInArray:", v62);

      objc_msgSend(v63, "_updateFinalFocusableRegionMapEntries");
      v73 = v63;

      v22 = 0;
    }

  }
  else
  {
    v35 = v5;
  }

  return v5;
}

- (void)_didChooseFocusCandidateRegion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[_UIFocusRegionMapSnapshot finalFocusableRegionMapEntries](self, "finalFocusableRegionMapEntries", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "focusableRegion");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
          objc_msgSend(v10, "setFocusCandidate:", 1);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (CGRect)mapEntriesFrame
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL IsNull;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  BOOL v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  double x;
  double y;
  double width;
  double height;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect result;

  v71 = *MEMORY[0x1E0C80C00];
  if (-[_UIFocusRegionMapSnapshot isCommitted](self, "isCommitted") && CGRectIsNull(self->_mapEntriesFrame))
  {
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    -[_UIFocusRegionMapSnapshot detectedFocusableViewMapEntries](self, "detectedFocusableViewMapEntries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v65;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v65 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v11);
          v72.origin.x = v3;
          v72.origin.y = v4;
          v72.size.width = v5;
          v72.size.height = v6;
          IsNull = CGRectIsNull(v72);
          objc_msgSend(v12, "frame");
          v18 = v14;
          v19 = v15;
          v20 = v16;
          v21 = v17;
          if (!IsNull)
          {
            v73.origin.x = v3;
            v73.origin.y = v4;
            v73.size.width = v5;
            v73.size.height = v6;
            *(CGRect *)&v14 = CGRectUnion(v73, *(CGRect *)&v18);
          }
          v3 = v14;
          v4 = v15;
          v5 = v16;
          v6 = v17;
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      }
      while (v9);
    }

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    -[_UIFocusRegionMapSnapshot detectedFocusableGuideMapEntries](self, "detectedFocusableGuideMapEntries");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v61;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v61 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v26);
          v74.origin.x = v3;
          v74.origin.y = v4;
          v74.size.width = v5;
          v74.size.height = v6;
          v28 = CGRectIsNull(v74);
          objc_msgSend(v27, "frame");
          v33 = v29;
          v34 = v30;
          v35 = v31;
          v36 = v32;
          if (!v28)
          {
            v75.origin.x = v3;
            v75.origin.y = v4;
            v75.size.width = v5;
            v75.size.height = v6;
            *(CGRect *)&v29 = CGRectUnion(v75, *(CGRect *)&v33);
          }
          v3 = v29;
          v4 = v30;
          v5 = v31;
          v6 = v32;
          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      }
      while (v24);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    -[_UIFocusRegionMapSnapshot sortedFocusContainerGuideMapEntries](self, "sortedFocusContainerGuideMapEntries", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v57;
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v57 != v40)
            objc_enumerationMutation(v37);
          v42 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v41);
          v76.origin.x = v3;
          v76.origin.y = v4;
          v76.size.width = v5;
          v76.size.height = v6;
          v43 = CGRectIsNull(v76);
          objc_msgSend(v42, "frame");
          v48 = v44;
          v49 = v45;
          v50 = v46;
          v51 = v47;
          if (!v43)
          {
            v77.origin.x = v3;
            v77.origin.y = v4;
            v77.size.width = v5;
            v77.size.height = v6;
            *(CGRect *)&v44 = CGRectUnion(v77, *(CGRect *)&v48);
          }
          v3 = v44;
          v4 = v45;
          v5 = v46;
          v6 = v47;
          ++v41;
        }
        while (v39 != v41);
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
      }
      while (v39);
    }

    self->_mapEntriesFrame.origin.x = v3;
    self->_mapEntriesFrame.origin.y = v4;
    self->_mapEntriesFrame.size.width = v5;
    self->_mapEntriesFrame.size.height = v6;
  }
  x = self->_mapEntriesFrame.origin.x;
  y = self->_mapEntriesFrame.origin.y;
  width = self->_mapEntriesFrame.size.width;
  height = self->_mapEntriesFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIImage)visualRepresentation
{
  UIImage *visualRepresentation;
  UIImage *v4;
  UIImage *v5;

  visualRepresentation = self->_visualRepresentation;
  if (!visualRepresentation)
  {
    -[_UIFocusRegionMapSnapshot visualRepresentationMinimumArea](self, "visualRepresentationMinimumArea");
    -[_UIFocusRegionMapSnapshot visualRepresentationWithMinimumArea:](self, "visualRepresentationWithMinimumArea:");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v5 = self->_visualRepresentation;
    self->_visualRepresentation = v4;

    visualRepresentation = self->_visualRepresentation;
  }
  return visualRepresentation;
}

- (id)visualRepresentationWithMinimumArea:(CGRect)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  BOOL IsEmpty;
  _BOOL4 v15;
  int v16;
  _BOOL4 v17;
  _BOOL4 v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  void *v39;
  void *v40;
  CGFloat v41;
  CGFloat v42;
  void *v43;
  _QWORD *ContextStack;
  CGContext *v45;
  id v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  id v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  void *v72;
  id v73;
  _BOOL4 v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  void *v79;
  id v80;
  _BOOL4 v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t i;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t j;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t k;
  void *v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  void *v106;
  id v107;
  CGFloat v108;
  CGFloat v109;
  CGFloat v110;
  CGFloat v111;
  void *v112;
  id v113;
  void *v114;
  int v116;
  CGFloat v117;
  CGFloat v118;
  CGFloat v119;
  CGFloat v120;
  double MidX;
  void *v122;
  void *v123;
  void *v124;
  double dx;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  uint64_t v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;

  v141 = *MEMORY[0x1E0C80C00];
  -[_UIFocusRegionMapSnapshot rootView](self, "rootView", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[_UIFocusRegionMapSnapshot focusedRect](self, "focusedRect");
  IsEmpty = CGRectIsEmpty(v142);
  -[_UIFocusRegionMapSnapshot snapshottedRect](self, "snapshottedRect");
  if (CGRectIsEmpty(v143))
  {
    v15 = 0;
  }
  else
  {
    -[_UIFocusRegionMapSnapshot snapshottedRect](self, "snapshottedRect");
    v175.origin.x = v7;
    v175.origin.y = v9;
    v175.size.width = v11;
    v175.size.height = v13;
    v15 = !CGRectEqualToRect(v144, v175);
  }
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v16 = _UIInternalPreferencesRevisionVar;
  v123 = v5;
  if (_UIInternalPreferencesRevisionVar < 1
    || (v116 = _UIInternalPreference_ShowFocusSnapshotViewSearchRect,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_ShowFocusSnapshotViewSearchRect))
  {
    v17 = 0;
  }
  else
  {
    do
    {
      v17 = v16 < v116;
      if (v16 < v116)
        break;
      _UIInternalPreferenceSync(v16, &_UIInternalPreference_ShowFocusSnapshotViewSearchRect, (uint64_t)CFSTR("ShowFocusSnapshotViewSearchRect"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      v116 = _UIInternalPreference_ShowFocusSnapshotViewSearchRect;
    }
    while (v16 != _UIInternalPreference_ShowFocusSnapshotViewSearchRect);
  }
  if (byte_1EDDA80A4)
    v18 = v17;
  else
    v18 = 0;
  -[_UIFocusRegionMapSnapshot mapEntriesFrame](self, "mapEntriesFrame");
  x = v19;
  y = v20;
  width = v21;
  height = v22;
  if (v5)
  {
    v176.origin.x = v7;
    v176.origin.y = v9;
    v176.size.width = v11;
    v176.size.height = v13;
    v145 = CGRectUnion(*(CGRect *)&v19, v176);
    x = v145.origin.x;
    y = v145.origin.y;
    width = v145.size.width;
    height = v145.size.height;
  }
  if (!IsEmpty)
  {
    -[_UIFocusRegionMapSnapshot focusedRect](self, "focusedRect");
    v177.origin.x = v27;
    v177.origin.y = v28;
    v177.size.width = v29;
    v177.size.height = v30;
    v146.origin.x = x;
    v146.origin.y = y;
    v146.size.width = width;
    v146.size.height = height;
    v147 = CGRectUnion(v146, v177);
    x = v147.origin.x;
    y = v147.origin.y;
    width = v147.size.width;
    height = v147.size.height;
  }
  if (v15)
  {
    -[_UIFocusRegionMapSnapshot snapshottedRect](self, "snapshottedRect");
    v178.origin.x = v31;
    v178.origin.y = v32;
    v178.size.width = v33;
    v178.size.height = v34;
    v148.origin.x = x;
    v148.origin.y = y;
    v148.size.width = width;
    v148.size.height = height;
    v149 = CGRectUnion(v148, v178);
    x = v149.origin.x;
    y = v149.origin.y;
    width = v149.size.width;
    height = v149.size.height;
  }
  v150.origin.x = x;
  v150.origin.y = y;
  v150.size.width = width;
  v150.size.height = height;
  v151 = CGRectInset(v150, -90.0, -60.0);
  v35 = v151.origin.x;
  v36 = v151.origin.y;
  v37 = v151.size.width;
  v38 = v151.size.height;
  -[_UIFocusRegionMapSnapshot rootView](self, "rootView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "_window");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v40, "frame");
    _UIGraphicsBeginImageContextWithOptions(0, 0, v41, v42, 0.0);
    objc_msgSend(v40, "bounds");
    objc_msgSend(v40, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  else
  {
    v43 = 0;
  }
  _UIGraphicsBeginImageContextWithOptions(0, 0, v37, v38, 0.0);
  ContextStack = GetContextStack(0);
  v122 = v40;
  v120 = v7;
  if (*(int *)ContextStack < 1)
    v45 = 0;
  else
    v45 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  +[UIColor whiteColor](UIColor, "whiteColor", *(_QWORD *)&v13, *(_QWORD *)&v11, *(_QWORD *)&v9);
  v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v45, (CGColorRef)objc_msgSend(v46, "CGColor"));

  v152.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v152.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  v152.size.width = v37;
  v152.size.height = v38;
  CGContextFillRect(v45, v152);
  v47 = -v36;
  dx = -v35;
  if (v43)
  {
    -[_UIFocusRegionMapSnapshot rootView](self, "rootView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "_window");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "frame");
    v154 = CGRectOffset(v153, dx, -v36);
    v50 = v154.origin.x;
    v51 = v154.origin.y;
    v52 = v154.size.width;
    v53 = v154.size.height;

    v54 = v51;
    v47 = -v36;
    objc_msgSend(v43, "drawInRect:blendMode:alpha:", 0, v50, v54, v52, v53, 0.3);
  }
  if (v5)
  {
    CGContextSaveGState(v45);
    v155.origin.y = v119;
    v155.origin.x = v120;
    v155.size.height = v117;
    v155.size.width = v118;
    v156 = CGRectOffset(v155, dx, v47);
    v55 = v156.origin.x;
    v56 = v156.origin.y;
    v57 = v156.size.width;
    v58 = v156.size.height;
    MidX = CGRectGetMidX(v156);
    v157.origin.x = v55;
    v157.origin.y = v56;
    v157.size.width = v57;
    v157.size.height = v58;
    -[_UIFocusRegionMapSnapshot setVisualRepresentationScreenCenter:](self, "setVisualRepresentationScreenCenter:", MidX, CGRectGetMidY(v157));
    +[UIColor blackColor](UIColor, "blackColor");
    v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(v45, (CGColorRef)objc_msgSend(v59, "CGColor"));

    v158.origin.x = v55;
    v158.origin.y = v56;
    v47 = -v36;
    v158.size.width = v57;
    v158.size.height = v58;
    CGContextStrokeRect(v45, v158);
    CGContextRestoreGState(v45);
  }
  if (!IsEmpty)
  {
    CGContextSaveGState(v45);
    -[_UIFocusRegionMapSnapshot focusedRect](self, "focusedRect");
    v160 = CGRectOffset(v159, dx, v47);
    v60 = v160.origin.x;
    v61 = v160.origin.y;
    v62 = v160.size.width;
    v63 = v160.size.height;
    +[UIColor redColor](UIColor, "redColor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "colorWithAlphaComponent:", 0.5);
    v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(v45, (CGColorRef)objc_msgSend(v65, "CGColor"));

    v161.origin.x = v60;
    v161.origin.y = v61;
    v161.size.width = v62;
    v161.size.height = v63;
    CGContextFillRect(v45, v161);
    +[UIColor redColor](UIColor, "redColor");
    v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(v45, (CGColorRef)objc_msgSend(v66, "CGColor"));

    CGContextSetLineWidth(v45, 4.0);
    v162.origin.x = v60;
    v162.origin.y = v61;
    v162.size.width = v62;
    v162.size.height = v63;
    v47 = -v36;
    CGContextStrokeRect(v45, v162);
    CGContextRestoreGState(v45);
  }
  if (v18)
  {
    CGContextSaveGState(v45);
    -[_UIFocusRegionMapSnapshot request](self, "request");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "viewSearchRect");
    v164 = CGRectOffset(v163, dx, v47);
    v68 = v164.origin.x;
    v69 = v164.origin.y;
    v70 = v164.size.width;
    v71 = v164.size.height;

    +[UIColor yellowColor](UIColor, "yellowColor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "colorWithAlphaComponent:", 0.1);
    v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(v45, (CGColorRef)objc_msgSend(v73, "CGColor"));

    v165.origin.x = v68;
    v165.origin.y = v69;
    v47 = -v36;
    v165.size.width = v70;
    v165.size.height = v71;
    CGContextFillRect(v45, v165);
    CGContextRestoreGState(v45);
  }
  v74 = v15;
  if (v15)
  {
    CGContextSaveGState(v45);
    -[_UIFocusRegionMapSnapshot snapshottedRect](self, "snapshottedRect");
    v167 = CGRectOffset(v166, dx, v47);
    v75 = v167.origin.x;
    v76 = v167.origin.y;
    v77 = v167.size.width;
    v78 = v167.size.height;
    +[UIColor redColor](UIColor, "redColor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "colorWithAlphaComponent:", 0.1);
    v80 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(v45, (CGColorRef)objc_msgSend(v80, "CGColor"));

    v168.origin.x = v75;
    v168.origin.y = v76;
    v47 = -v36;
    v168.size.width = v77;
    v168.size.height = v78;
    CGContextFillRect(v45, v168);
    CGContextRestoreGState(v45);
  }
  v124 = v43;
  v81 = v18;
  CGContextSaveGState(v45);
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  -[_UIFocusRegionMapSnapshot detectedFocusableViewMapEntries](self, "detectedFocusableViewMapEntries");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v134, v140, 16);
  if (v83)
  {
    v84 = v83;
    v85 = *(_QWORD *)v135;
    do
    {
      for (i = 0; i != v84; ++i)
      {
        if (*(_QWORD *)v135 != v85)
          objc_enumerationMutation(v82);
        v87 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * i);
        -[_UIFocusRegionMapSnapshot finalFocusableRegionMapEntries](self, "finalFocusableRegionMapEntries");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "drawVisualRepresentationInContext:imageFrame:isFinal:", v45, objc_msgSend(v88, "containsObject:", v87), v35, v36, v37, v38);

      }
      v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v134, v140, 16);
    }
    while (v84);
  }

  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  -[_UIFocusRegionMapSnapshot detectedFocusableGuideMapEntries](self, "detectedFocusableGuideMapEntries");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v130, v139, 16);
  if (v90)
  {
    v91 = v90;
    v92 = *(_QWORD *)v131;
    do
    {
      for (j = 0; j != v91; ++j)
      {
        if (*(_QWORD *)v131 != v92)
          objc_enumerationMutation(v89);
        v94 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * j);
        -[_UIFocusRegionMapSnapshot finalFocusableRegionMapEntries](self, "finalFocusableRegionMapEntries");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "drawVisualRepresentationInContext:imageFrame:isFinal:", v45, objc_msgSend(v95, "containsObject:", v94), v35, v36, v37, v38);

      }
      v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v130, v139, 16);
    }
    while (v91);
  }

  CGContextRestoreGState(v45);
  CGContextSaveGState(v45);
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  -[_UIFocusRegionMapSnapshot sortedFocusContainerGuideMapEntries](self, "sortedFocusContainerGuideMapEntries");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v126, v138, 16);
  if (v97)
  {
    v98 = v97;
    v99 = *(_QWORD *)v127;
    do
    {
      for (k = 0; k != v98; ++k)
      {
        if (*(_QWORD *)v127 != v99)
          objc_enumerationMutation(v96);
        objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * k), "drawVisualRepresentationInContext:imageFrame:", v45, v35, v36, v37, v38);
      }
      v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v126, v138, 16);
    }
    while (v98);
  }

  CGContextRestoreGState(v45);
  if (v81)
  {
    CGContextSaveGState(v45);
    -[_UIFocusRegionMapSnapshot request](self, "request");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "viewSearchRect");
    v170 = CGRectOffset(v169, dx, v47);
    v102 = v170.origin.x;
    v103 = v170.origin.y;
    v104 = v170.size.width;
    v105 = v170.size.height;

    +[UIColor yellowColor](UIColor, "yellowColor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "colorWithAlphaComponent:", 0.5);
    v107 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(v45, (CGColorRef)objc_msgSend(v107, "CGColor"));

    CGContextSetLineDash(v45, 0.0, &visualRepresentationWithMinimumArea__dashedLineLength, 1uLL);
    CGContextSetLineWidth(v45, 4.0);
    v171.origin.x = v102;
    v171.origin.y = v103;
    v171.size.width = v104;
    v171.size.height = v105;
    CGContextStrokeRect(v45, v171);
    CGContextRestoreGState(v45);
  }
  if (v74)
  {
    CGContextSaveGState(v45);
    -[_UIFocusRegionMapSnapshot snapshottedRect](self, "snapshottedRect");
    v173 = CGRectOffset(v172, dx, v47);
    v108 = v173.origin.x;
    v109 = v173.origin.y;
    v110 = v173.size.width;
    v111 = v173.size.height;
    +[UIColor redColor](UIColor, "redColor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "colorWithAlphaComponent:", 0.5);
    v113 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(v45, (CGColorRef)objc_msgSend(v113, "CGColor"));

    CGContextSetLineDash(v45, 0.0, &visualRepresentationWithMinimumArea__dashedLineLength_93, 1uLL);
    CGContextSetLineWidth(v45, 4.0);
    v174.origin.x = v108;
    v174.origin.y = v109;
    v174.size.width = v110;
    v174.size.height = v111;
    CGContextStrokeRect(v45, v174);
    CGContextRestoreGState(v45);
  }
  _UIGraphicsGetImageFromCurrentImageContext(0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v114;
}

+ (id)combinedVisualRepresentationForSnapshots:(id)a3 scaleFactor:(double)a4
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  double v14;
  double v15;
  unint64_t v16;
  int v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  _QWORD *ContextStack;
  CGContext *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  double v47;
  double v48;
  uint64_t v49;
  double v50;
  uint64_t j;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  id v70;
  uint64_t v71;
  double y;
  double v74;
  void *v75;
  double v76;
  void *v77;
  id v78;
  double v79;
  double v80;
  double v81;
  double v82;
  CGFloat v83;
  id obj;
  unint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _QWORD v95[2];
  _QWORD v96[2];
  _BYTE v97[128];
  uint64_t v98;
  CGRect v99;

  v98 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    v28 = 0;
    goto LABEL_68;
  }
  v76 = a4;
  v85 = objc_msgSend(v5, "count");
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C9D820];
  v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v78 = v5;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
  if (!v10)
  {
    LOBYTE(v16) = 1;
    v14 = 0.0;
    v15 = 0.0;
    v17 = 1;
    goto LABEL_26;
  }
  v11 = v10;
  v12 = *(_QWORD *)v91;
  v13 = 1;
  v14 = 0.0;
  v15 = 0.0;
  LOBYTE(v16) = 1;
  LOBYTE(v17) = 1;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v91 != v12)
        objc_enumerationMutation(v9);
      v19 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
      objc_msgSend(v19, "visualRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v13 & 1) != 0)
      {
        if (!objc_msgSend(v19, "focusHeading") || (objc_msgSend(v19, "focusHeading") & 3) != 0)
        {
          v16 = ((unint64_t)objc_msgSend(v19, "focusHeading") >> 1) & 1;
LABEL_12:
          objc_msgSend(v20, "size");
          v7 = v7 + v21 + 0.0;
          objc_msgSend(v19, "visualRepresentationScreenCenter");
          if (v15 < v22)
            v15 = v22;
          objc_msgSend(v20, "size");
          v24 = v23 - v15;
          v17 = 1;
          goto LABEL_19;
        }
        v16 = ((unint64_t)objc_msgSend(v19, "focusHeading") >> 3) & 1;
      }
      else if ((v17 & 1) != 0)
      {
        goto LABEL_12;
      }
      objc_msgSend(v20, "size");
      v8 = v8 + v25 + 0.0;
      objc_msgSend(v19, "visualRepresentationScreenCenter");
      if (v15 < v26)
        v15 = v26;
      objc_msgSend(v20, "size");
      v17 = 0;
      v24 = v27 - v15;
LABEL_19:
      if (v14 < v24)
        v14 = v24;

      v13 = 0;
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
    v13 = 0;
  }
  while (v11);
LABEL_26:

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v9, "count"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *(_QWORD *)off_1E1678D98;
  v95[0] = *(_QWORD *)off_1E1678D90;
  v95[1] = v30;
  v96[0] = v6;
  +[UIColor blackColor](UIColor, "blackColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v96[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = v29;
  objc_msgSend(v29, "sizeWithAttributes:", v32);
  if (v33 < v34)
    v33 = v34;
  v35 = v33 * 0.6;
  if (v17)
  {
    v36 = v35 * 5.0 + -60.0;
    if (v35 * 5.0 < 60.0)
      v36 = 0.0;
    if (v85 <= 1)
      v37 = 0.0;
    else
      v37 = v36;
    v8 = v14 + v15 + v37;
  }
  else
  {
    v38 = v35 * 6.0 + -90.0;
    if (v35 * 6.0 < 90.0)
      v38 = 0.0;
    if (v85 <= 1)
      v37 = 0.0;
    else
      v37 = v38;
    v7 = v14 + v15 + v37;
  }
  if ((v16 & 1) != 0)
    v39 = v37;
  else
    v39 = 0.0;
  _UIGraphicsBeginImageContextWithOptions(0, 0, v7, v8, 0.0);
  ContextStack = GetContextStack(0);
  v77 = (void *)v6;
  if (*(int *)ContextStack < 1)
    v41 = 0;
  else
    v41 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  +[UIColor whiteColor](UIColor, "whiteColor");
  v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v41, (CGColorRef)objc_msgSend(v42, "CGColor"));

  v99.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v99.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  y = v99.origin.y;
  v74 = *MEMORY[0x1E0C9D538];
  v79 = v8;
  v80 = v7;
  v99.size.width = v7;
  v99.size.height = v8;
  CGContextFillRect(v41, v99);
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v9;
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
  if (v43)
  {
    v44 = v43;
    v45 = v15 + v39;
    v46 = *(_QWORD *)v87;
    if ((v16 & 1) != 0)
      v47 = (v37 + 90.0) * 0.5;
    else
      v47 = v80 - (v37 + 90.0) * 0.5;
    v48 = (v37 + 60.0) * 0.5;
    if ((v16 & 1) == 0)
      v48 = v8 - v48;
    v81 = v48;
    v82 = v47;
    v49 = 1;
    v83 = v35;
    v50 = 0.0;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v87 != v46)
          objc_enumerationMutation(obj);
        v52 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
        objc_msgSend(v52, "visualRepresentation");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v49 + j);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "sizeWithAttributes:", v32);
        v56 = v55;
        v58 = v57;
        objc_msgSend(v52, "visualRepresentationScreenCenter");
        if (v17)
        {
          objc_msgSend(v53, "drawAtPoint:", v50, v45 - v60);
          objc_msgSend(v53, "size");
          v50 = v50 + v61 + 0.0;
          if (v85 < 2)
            goto LABEL_63;
          objc_msgSend(v53, "size");
          v63 = v56 * 0.5;
          v64 = v50 - v62 * 0.5 - v56 * 0.5;
          v65 = v58 * 0.5;
          v66 = v81;
        }
        else
        {
          objc_msgSend(v53, "drawAtPoint:", v45 - v59, v50);
          objc_msgSend(v53, "size");
          v50 = v50 + v67 + 0.0;
          if (v85 < 2)
            goto LABEL_63;
          v63 = v56 * 0.5;
          v64 = v82 - v56 * 0.5;
          objc_msgSend(v53, "size");
          v66 = v50 - v68 * 0.5;
          v65 = v58 * 0.5;
        }
        v69 = v66 - v65;
        objc_msgSend(v54, "drawInRect:withAttributes:", v32, v64, v66 - v65, v56, v58);
        CGContextSetLineWidth(v41, 2.0);
        +[UIColor blackColor](UIColor, "blackColor");
        v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetStrokeColorWithColor(v41, (CGColorRef)objc_msgSend(v70, "CGColor"));

        CGContextAddArc(v41, v64 + v63, v69 + v65, v83, 0.0, 6.28318531, 1);
        CGContextStrokePath(v41);
LABEL_63:

      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
      v49 += j;
    }
    while (v44);
  }

  _UIGraphicsGetImageFromCurrentImageContext(0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  if (v76 + -1.0 > 2.22044605e-16)
  {
    _UIGraphicsBeginImageContextWithOptions(0, 0, v80 * v76, v79 * v76, 0.0);
    objc_msgSend(v28, "drawInRect:", v74, y, v80 * v76, v79 * v76);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v71 = objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

    v28 = (void *)v71;
  }
  v5 = v78;

LABEL_68:
  return v28;
}

- (_UIFocusRegionMapSnapshotRequest)request
{
  return self->_request;
}

- (UIView)rootView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_rootView);
}

- (CGRect)snapshottedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_snapshottedRect.origin.x;
  y = self->_snapshottedRect.origin.y;
  width = self->_snapshottedRect.size.width;
  height = self->_snapshottedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isCommitted
{
  return self->_committed;
}

- (void)setCommitted:(BOOL)a3
{
  self->_committed = a3;
}

- (BOOL)isPrivateSnapshot
{
  return self->_privateSnaphot;
}

- (void)setPrivateSnaphot:(BOOL)a3
{
  self->_privateSnaphot = a3;
}

- (NSArray)sortedFocusContainerGuideMapEntries
{
  return self->_sortedFocusContainerGuideMapEntries;
}

- (void)setSortedFocusContainerGuideMapEntries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSMutableArray)detectedFocusableViewMapEntries
{
  return self->_detectedFocusableViewMapEntries;
}

- (void)setDetectedFocusableViewMapEntries:(id)a3
{
  objc_storeStrong((id *)&self->_detectedFocusableViewMapEntries, a3);
}

- (NSMutableArray)detectedFocusableGuideMapEntries
{
  return self->_detectedFocusableGuideMapEntries;
}

- (void)setDetectedFocusableGuideMapEntries:(id)a3
{
  objc_storeStrong((id *)&self->_detectedFocusableGuideMapEntries, a3);
}

- (NSMutableArray)detectedFocusContainerGuideMapEntries
{
  return self->_detectedFocusContainerGuideMapEntries;
}

- (void)setDetectedFocusContainerGuideMapEntries:(id)a3
{
  objc_storeStrong((id *)&self->_detectedFocusContainerGuideMapEntries, a3);
}

- (NSMutableArray)retainedPromiseRegions
{
  return self->_retainedPromiseRegions;
}

- (void)setRetainedPromiseRegions:(id)a3
{
  objc_storeStrong((id *)&self->_retainedPromiseRegions, a3);
}

- (CGRect)focusedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_focusedRect.origin.x;
  y = self->_focusedRect.origin.y;
  width = self->_focusedRect.size.width;
  height = self->_focusedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)focusHeading
{
  return self->_focusHeading;
}

- (void)setFocusHeading:(unint64_t)a3
{
  self->_focusHeading = a3;
}

- (BOOL)clipToSnapshotRect
{
  return self->_clipToSnapshotRect;
}

- (void)setClipToSnapshotRect:(BOOL)a3
{
  self->_clipToSnapshotRect = a3;
}

- (CGRect)visualRepresentationMinimumArea
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visualRepresentationMinimumArea.origin.x;
  y = self->_visualRepresentationMinimumArea.origin.y;
  width = self->_visualRepresentationMinimumArea.size.width;
  height = self->_visualRepresentationMinimumArea.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVisualRepresentationMinimumArea:(CGRect)a3
{
  self->_visualRepresentationMinimumArea = a3;
}

- (UIView)focusableRegionAncestorView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_focusableRegionAncestorView);
}

- (void)setFocusableRegionAncestorView:(id)a3
{
  objc_storeWeak((id *)&self->_focusableRegionAncestorView, a3);
}

- (CGPoint)visualRepresentationScreenCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_visualRepresentationScreenCenter.x;
  y = self->_visualRepresentationScreenCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setVisualRepresentationScreenCenter:(CGPoint)a3
{
  self->_visualRepresentationScreenCenter = a3;
}

- (NSArray)finalFocusableRegionMapEntries
{
  return self->_finalFocusableRegionMapEntries;
}

- (void)setFinalFocusableRegionMapEntries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalFocusableRegionMapEntries, 0);
  objc_destroyWeak((id *)&self->_focusableRegionAncestorView);
  objc_storeStrong((id *)&self->_retainedPromiseRegions, 0);
  objc_storeStrong((id *)&self->_detectedFocusContainerGuideMapEntries, 0);
  objc_storeStrong((id *)&self->_detectedFocusableGuideMapEntries, 0);
  objc_storeStrong((id *)&self->_detectedFocusableViewMapEntries, 0);
  objc_storeStrong((id *)&self->_sortedFocusContainerGuideMapEntries, 0);
  objc_destroyWeak((id *)&self->_rootView);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_visualRepresentation, 0);
}

@end
