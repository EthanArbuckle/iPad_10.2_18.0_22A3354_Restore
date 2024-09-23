@implementation _UIFocusScrollRequest

- (_UIFocusScrollRequest)initWithEnvironmentScrollableContainer:(id)a3 focusItemInfo:(id)a4 focusMovement:(id)a5 focusItemFrame:(CGRect)a6 targetContentOffsetValue:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  id v18;
  id v19;
  _UIFocusScrollRequest *v20;
  _UIFocusScrollRequest *v21;
  unint64_t v22;
  unint64_t v23;
  NSObject *v24;
  _UIFocusScrollRequest *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  double MaxX;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  NSObject *v70;
  double MaxY;
  double v72;
  double MinX;
  double v74;
  double MinY;
  double v76;
  id v77;
  id v78;
  id v79;
  objc_super v80;
  uint8_t buf[32];
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v80.receiver = self;
  v80.super_class = (Class)_UIFocusScrollRequest;
  v20 = -[_UIFocusScrollRequest init](&v80, sel_init);
  v21 = v20;
  if (!v20)
    goto LABEL_20;
  objc_storeStrong((id *)&v20->_environmentScrollableContainer, a3);
  objc_storeStrong((id *)&v21->_focusMovement, a5);
  objc_storeStrong((id *)&v21->_focusItemInfo, a4);
  v21->_focusItemFrame.origin.x = x;
  v21->_focusItemFrame.origin.y = y;
  v21->_focusItemFrame.size.width = width;
  v21->_focusItemFrame.size.height = height;
  if (v21->_focusItemInfo)
  {
    v82.origin.x = x;
    v82.origin.y = y;
    v82.size.width = width;
    v82.size.height = height;
    if (!CGRectIsNull(v82))
    {
      v22 = _MergedGlobals_935;
      if (!_MergedGlobals_935)
      {
        v22 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v22, (unint64_t *)&_MergedGlobals_935);
      }
      if ((*(_BYTE *)v22 & 1) != 0)
      {
        v70 = *(NSObject **)(v22 + 8);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v70, OS_LOG_TYPE_ERROR, "Creating a _UIFocusScrollRequest with non-nil focusItemInfo and non-null focusItemFrame. focusItemFrame will be used instead of converting the frame of the focusItemInfo to the scrollableContainer.coordinateSpace, which may result in stale self.focusItemFrame access after scrolling.", buf, 2u);
        }
      }
    }
    if (v21->_focusItemInfo)
      goto LABEL_14;
    x = v21->_focusItemFrame.origin.x;
    y = v21->_focusItemFrame.origin.y;
    width = v21->_focusItemFrame.size.width;
    height = v21->_focusItemFrame.size.height;
  }
  v83.origin.x = x;
  v83.origin.y = y;
  v83.size.width = width;
  v83.size.height = height;
  if (CGRectIsNull(v83))
  {
    v23 = qword_1ECD7CAA0;
    if (!qword_1ECD7CAA0)
    {
      v23 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v23, (unint64_t *)&qword_1ECD7CAA0);
    }
    v24 = *(NSObject **)(v23 + 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "Creating a _UIFocusScrollRequest with nil focusItemInfo and null focusItemFrame. This is uselesss.", buf, 2u);
    }
  }
LABEL_14:
  v78 = v18;
  v79 = v16;
  v25 = v21;
  v77 = v19;
  v26 = v19;
  -[_UIFocusEnvironmentScrollableContainerTuple scrollableContainer](v21->_environmentScrollableContainer, "scrollableContainer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusEnvironmentScrollableContainerTuple owningEnvironment](v21->_environmentScrollableContainer, "owningEnvironment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFocusEnvironmentContainingView(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "window");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIFocusSystemSceneComponent sceneComponentForEnvironment:](_UIFocusSystemSceneComponent, "sceneComponentForEnvironment:", v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "scrollManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v25->_scrollOffsetResolver = _UIFocusItemScrollableContainerScrollOffsetResolverTypeForFocusMovement(v21->_environmentScrollableContainer, v21->_focusMovement);
  objc_msgSend(v32, "targetContentOffsetForScrollableContainer:", v27);
  v25->_originatingContentOffset.x = v33;
  v25->_originatingContentOffset.y = v34;
  *(CGPoint *)buf = v25->_originatingContentOffset;
  objc_msgSend(v27, "visibleSize");
  v25->_originatingBounds.origin = *(CGPoint *)buf;
  v25->_originatingBounds.size.width = v35;
  v25->_originatingBounds.size.height = v36;
  objc_msgSend(v27, "contentOffset");
  v38 = v37;
  v40 = v39;
  objc_msgSend(v27, "visibleSize");
  v42 = v41;
  v44 = v43;
  objc_msgSend(v27, "coordinateSpace");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "convertRect:fromCoordinateSpace:", v45, v38, v40, v42, v44);
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;

  objc_msgSend(v30, "bounds");
  v94.origin.x = v54;
  v94.origin.y = v55;
  v94.size.width = v56;
  v94.size.height = v57;
  v84.origin.x = v47;
  v84.origin.y = v49;
  v84.size.width = v51;
  v84.size.height = v53;
  v85 = CGRectIntersection(v84, v94);
  v58 = v85.origin.x;
  v59 = v85.origin.y;
  v60 = v85.size.width;
  v61 = v85.size.height;
  if (!CGRectIsNull(v85))
  {
    v86.origin.x = v58;
    v86.origin.y = v59;
    v86.size.width = v60;
    v86.size.height = v61;
    MinY = CGRectGetMinY(v86);
    v87.origin.x = v47;
    v87.origin.y = v49;
    v87.size.width = v51;
    v87.size.height = v53;
    v76 = MinY - CGRectGetMinY(v87);
    v88.origin.x = v58;
    v88.origin.y = v59;
    v88.size.width = v60;
    v88.size.height = v61;
    MinX = CGRectGetMinX(v88);
    v89.origin.x = v47;
    v89.origin.y = v49;
    v89.size.width = v51;
    v89.size.height = v53;
    v74 = MinX - CGRectGetMinX(v89);
    v90.origin.x = v47;
    v90.origin.y = v49;
    v90.size.width = v51;
    v90.size.height = v53;
    MaxY = CGRectGetMaxY(v90);
    v91.origin.x = v58;
    v91.origin.y = v59;
    v91.size.width = v60;
    v91.size.height = v61;
    v72 = MaxY - CGRectGetMaxY(v91);
    v92.origin.x = v47;
    v92.origin.y = v49;
    v92.size.width = v51;
    v92.size.height = v53;
    MaxX = CGRectGetMaxX(v92);
    v93.origin.x = v58;
    v93.origin.y = v59;
    v93.size.width = v60;
    v93.size.height = v61;
    v63 = CGRectGetMaxX(v93);
    v64 = v76 + v25->_originatingBounds.origin.y;
    v65 = v25->_originatingBounds.size.width - (v74 + MaxX - v63);
    v66 = v25->_originatingBounds.size.height - (v76 + v72);
    v25->_originatingBounds.origin.x = v74 + v25->_originatingBounds.origin.x;
    v25->_originatingBounds.origin.y = v64;
    v25->_originatingBounds.size.width = v65;
    v25->_originatingBounds.size.height = v66;
  }
  v16 = v79;
  if (v26)
  {
    objc_msgSend(v26, "CGPointValue");
    v25->_targetContentOffset.x = v67;
    v25->_targetContentOffset.y = v68;
  }
  else
  {
    v25->_targetContentOffset = v25->_originatingContentOffset;
  }

  v19 = v77;
  v18 = v78;
LABEL_20:

  return v21;
}

- (_UIFocusScrollRequest)initWithBaseRequest:(id)a3 environmentScrollableContainer:(id)a4
{
  double *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  _UIFocusScrollRequest *v27;
  CGRect v29;

  v6 = (double *)a3;
  v7 = a4;
  objc_msgSend(v6, "environmentScrollableContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollableContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinateSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "scrollableContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v6[9];
  v14 = v6[10];
  v15 = v6[11];
  v16 = v6[12];
  v29.origin.x = v13;
  v29.origin.y = v14;
  v29.size.width = v15;
  v29.size.height = v16;
  if (CGRectIsNull(v29))
  {
    v17 = *MEMORY[0x1E0C9D628];
    v18 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v19 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v20 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    objc_msgSend(v12, "convertRect:fromCoordinateSpace:", v10, v13, v14, v15, v16);
    v17 = v21;
    v18 = v22;
    v19 = v23;
    v20 = v24;
  }
  objc_msgSend(v6, "focusItemInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "focusMovement");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[_UIFocusScrollRequest initWithEnvironmentScrollableContainer:focusItemInfo:focusMovement:focusItemFrame:targetContentOffsetValue:](self, "initWithEnvironmentScrollableContainer:focusItemInfo:focusMovement:focusItemFrame:targetContentOffsetValue:", v7, v25, v26, 0, v17, v18, v19, v20);

  return v27;
}

- (_UIFocusScrollRequest)initWithEnvironmentScrollableContainer:(id)a3 focusItemInfo:(id)a4 focusUpdateContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _UIFocusScrollRequest *v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a5, "_focusMovement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_UIFocusScrollRequest initWithEnvironmentScrollableContainer:focusItemInfo:focusMovement:focusItemFrame:targetContentOffsetValue:](self, "initWithEnvironmentScrollableContainer:focusItemInfo:focusMovement:focusItemFrame:targetContentOffsetValue:", v9, v8, v10, 0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

  return v11;
}

- (_UIFocusScrollRequest)initWithEnvironmentScrollableContainer:(id)a3 focusItemInfo:(id)a4 targetContentOffsetValue:(id)a5
{
  return -[_UIFocusScrollRequest initWithEnvironmentScrollableContainer:focusItemInfo:focusMovement:focusItemFrame:targetContentOffsetValue:](self, "initWithEnvironmentScrollableContainer:focusItemInfo:focusMovement:focusItemFrame:targetContentOffsetValue:", a3, a4, 0, a5, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (_UIFocusScrollRequest)initWithEnvironmentScrollableContainer:(id)a3 focusItemFrame:(CGRect)a4 targetContentOffsetValue:(id)a5
{
  return -[_UIFocusScrollRequest initWithEnvironmentScrollableContainer:focusItemInfo:focusMovement:focusItemFrame:targetContentOffsetValue:](self, "initWithEnvironmentScrollableContainer:focusItemInfo:focusMovement:focusItemFrame:targetContentOffsetValue:", a3, 0, 0, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (CGPoint)resolveTargetContentOffsetUsingScrollOffsetResolverClamped:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double x;
  double v11;
  double y;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  void *v24;
  uint64_t v25;
  CGPoint result;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  -[_UIFocusScrollRequest environmentScrollableContainer](self, "environmentScrollableContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollableContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _UIFocusScrollOffsetResolverForOffsetResolverType(-[_UIFocusScrollRequest scrollOffsetResolver](self, "scrollOffsetResolver"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "contentOffsetForScrollRequest:", self);
    x = v9;
    y = v11;
  }
  else
  {
    x = self->_targetContentOffset.x;
    y = self->_targetContentOffset.y;
    v13 = resolveTargetContentOffsetUsingScrollOffsetResolverClamped____s_category;
    if (!resolveTargetContentOffsetUsingScrollOffsetResolverClamped____s_category)
    {
      v13 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&resolveTargetContentOffsetUsingScrollOffsetResolverClamped____s_category);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      _UIFocusScrollOffsetResolverStringForOffsetResolverType(-[_UIFocusScrollRequest scrollOffsetResolver](self, "scrollOffsetResolver"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v16;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Failed to get scroll offset resolver for type: %@", (uint8_t *)&v23, 0xCu);

    }
  }
  if (v3)
  {
    v17 = _UIFocusItemScrollableContainerMinimumContentOffset(v6);
    v19 = v18;
    x = fmax(v17, fmin(x, _UIFocusItemScrollableContainerMaximumContentOffset(v6)));
    y = fmax(v19, fmin(y, v20));
  }
  self->_targetContentOffset.x = x;
  self->_targetContentOffset.y = y;

  v21 = x;
  v22 = y;
  result.y = v22;
  result.x = v21;
  return result;
}

- (CGRect)focusItemFrame
{
  _UIFocusItemInfo *focusItemInfo;
  void *v4;
  void *v5;
  double v6;
  CGFloat x;
  double v8;
  CGFloat y;
  double v10;
  CGFloat width;
  double v12;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  if (CGRectIsNull(self->_focusItemFrame))
  {
    focusItemInfo = self->_focusItemInfo;
    if (focusItemInfo)
    {
      -[_UIFocusEnvironmentScrollableContainerTuple scrollableContainer](self->_environmentScrollableContainer, "scrollableContainer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "coordinateSpace");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFocusItemInfo focusedRectInCoordinateSpace:](focusItemInfo, "focusedRectInCoordinateSpace:", v5);
      x = v6;
      y = v8;
      width = v10;
      height = v12;

    }
    else
    {
      x = *MEMORY[0x1E0C9D628];
      y = *(double *)(MEMORY[0x1E0C9D628] + 8);
      width = *(double *)(MEMORY[0x1E0C9D628] + 16);
      height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }
  }
  else
  {
    x = self->_focusItemFrame.origin.x;
    y = self->_focusItemFrame.origin.y;
    width = self->_focusItemFrame.size.width;
    height = self->_focusItemFrame.size.height;
  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)reloadFocusItemInfo
{
  _UIFocusItemInfo *v3;
  void *v4;
  uint64_t v5;
  _UIFocusItemInfo *focusItemInfo;
  _UIFocusItemInfo *v7;

  -[_UIFocusItemInfo item](self->_focusItemInfo, "item");
  v3 = (_UIFocusItemInfo *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3)
  {
    -[_UIFocusScrollRequest focusItemInfo](self, "focusItemInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "useFallbackAncestorScroller");

    +[_UIFocusItemInfo infoWithItem:useFallbackAncestorScroller:](_UIFocusItemInfo, "infoWithItem:useFallbackAncestorScroller:", v7, v5);
    v3 = (_UIFocusItemInfo *)objc_claimAutoreleasedReturnValue();
  }
  focusItemInfo = self->_focusItemInfo;
  self->_focusItemInfo = v3;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  __CFString *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  CGPoint v35;
  CGPoint v36;
  CGRect v37;
  CGRect v38;

  +[UIDescriptionBuilder descriptionBuilderWithObject:](UIDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusScrollRequest environmentScrollableContainer](self, "environmentScrollableContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "owningEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v8, v5);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("(nil)");
  }
  v10 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("owningEnvironment"), v9);

  -[_UIFocusScrollRequest environmentScrollableContainer](self, "environmentScrollableContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scrollableContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v15, v12);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = CFSTR("(nil)");
  }
  v17 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("scrollableContainer"), v16);

  _UIFocusScrollOffsetResolverStringForOffsetResolverType(-[_UIFocusScrollRequest scrollOffsetResolver](self, "scrollOffsetResolver"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("scrollOffsetResolver"), v18);

  -[_UIFocusScrollRequest focusItemInfo](self, "focusItemInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "shortDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("focusItemInfo"), v21);

  -[_UIFocusScrollRequest focusMovement](self, "focusMovement");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("focusMovement"), v23);

  -[_UIFocusScrollRequest originatingContentOffset](self, "originatingContentOffset");
  NSStringFromCGPoint(v35);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("originatingContentOffset"), v25);

  -[_UIFocusScrollRequest targetContentOffset](self, "targetContentOffset");
  NSStringFromCGPoint(v36);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("targetContentOffset"), v27);

  -[_UIFocusScrollRequest originatingBounds](self, "originatingBounds");
  NSStringFromCGRect(v37);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("originatingBounds"), v29);

  -[_UIFocusScrollRequest focusItemFrame](self, "focusItemFrame");
  NSStringFromCGRect(v38);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("focusItemFrame"), v31);

  objc_msgSend(v3, "string");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (unint64_t)scrollOffsetResolver
{
  return self->_scrollOffsetResolver;
}

- (CGRect)originatingBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originatingBounds.origin.x;
  y = self->_originatingBounds.origin.y;
  width = self->_originatingBounds.size.width;
  height = self->_originatingBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)originatingContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_originatingContentOffset.x;
  y = self->_originatingContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)targetContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_targetContentOffset.x;
  y = self->_targetContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (_UIFocusItemInfo)focusItemInfo
{
  return self->_focusItemInfo;
}

- (_UIFocusMovementInfo)focusMovement
{
  return self->_focusMovement;
}

- (_UIFocusEnvironmentScrollableContainerTuple)environmentScrollableContainer
{
  return self->_environmentScrollableContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentScrollableContainer, 0);
  objc_storeStrong((id *)&self->_focusMovement, 0);
  objc_storeStrong((id *)&self->_focusItemInfo, 0);
}

@end
