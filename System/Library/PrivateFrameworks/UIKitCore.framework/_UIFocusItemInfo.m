@implementation _UIFocusItemInfo

+ (_UIFocusItemInfo)infoWithItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithItem:containingView:useFallbackAncestorScroller:", v4, 0, 0);

  return (_UIFocusItemInfo *)v5;
}

+ (_UIFocusItemInfo)infoWithItem:(id)a3 useFallbackAncestorScroller:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithItem:containingView:useFallbackAncestorScroller:", v6, 0, v4);

  return (_UIFocusItemInfo *)v7;
}

+ (_UIFocusItemInfo)infoWithView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithItem:containingView:useFallbackAncestorScroller:", v4, v4, 0);

  return (_UIFocusItemInfo *)v5;
}

- (id)_initWithItem:(id)a3 containingView:(id)a4 useFallbackAncestorScroller:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  _UIFocusItemInfo *v10;
  _UIFocusItemInfo *v11;
  void *v12;
  char v13;
  objc_super v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIFocusItemInfo;
  v10 = -[_UIFocusItemInfo init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_item, v8);
    if (v9)
    {
      objc_storeWeak((id *)&v11->_containingView, v9);
    }
    else
    {
      _UIFocusEnvironmentContainingView(v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v11->_containingView, v12);

    }
    v11->_inheritedFocusMovementStyle = 0;
    if (v5)
      v13 = 16;
    else
      v13 = 0;
    *(_BYTE *)&v11->_flags = *(_BYTE *)&v11->_flags & 0xEF | v13;
  }

  return v11;
}

- (BOOL)itemIsKindOfView
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[_UIFocusItemInfo item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UIFocusItemInfo item](self, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFocusItemInfo containingView](self, "containingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4 == v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)ancestorEnvironmentScrollableContainers
{
  NSArray *ancestorEnvironmentScrollableContainers;
  id WeakRetained;
  NSArray *v5;
  NSArray *v6;

  ancestorEnvironmentScrollableContainers = self->_ancestorEnvironmentScrollableContainers;
  if (!ancestorEnvironmentScrollableContainers)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_item);
    _UIFocusAncestorEnvironmentScrollableContainers(WeakRetained, (*(_BYTE *)&self->_flags >> 4) & 1);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_ancestorEnvironmentScrollableContainers;
    self->_ancestorEnvironmentScrollableContainers = v5;

    ancestorEnvironmentScrollableContainers = self->_ancestorEnvironmentScrollableContainers;
  }
  return ancestorEnvironmentScrollableContainers;
}

- (int64_t)inheritedFocusMovementStyle
{
  int64_t result;
  void *v4;
  void *v5;

  result = self->_inheritedFocusMovementStyle;
  if (!result)
  {
    -[_UIFocusItemInfo item](self, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_UIFocusItemInfo item](self, "item");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      self->_inheritedFocusMovementStyle = _UIFocusEnvironmentInheritedFocusMovementStyle(v5);

      return self->_inheritedFocusMovementStyle;
    }
    else
    {
      result = 1;
      self->_inheritedFocusMovementStyle = 1;
    }
  }
  return result;
}

- (int64_t)focusTouchSensitivityStyle
{
  void *v3;
  int64_t v4;

  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    -[_UIFocusItemInfo item](self, "item");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (_UIFocusItemIsViewOrRespondsToSelector(v3))
      v4 = objc_msgSend(v3, "_focusTouchSensitivityStyle");
    else
      v4 = 0;
    self->_focusTouchSensitivityStyle = v4;
    *(_BYTE *)&self->_flags |= 1u;

  }
  return self->_focusTouchSensitivityStyle;
}

- (int64_t)rotaryFocusMovementAxis
{
  void *v3;

  if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    -[_UIFocusItemInfo item](self, "item");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_rotaryFocusMovementAxis = _UIFocusEnvironmentResolvedRotaryFocusMovementAxis(v3, 0);

    *(_BYTE *)&self->_flags |= 8u;
  }
  return self->_rotaryFocusMovementAxis;
}

- (BOOL)isFocusMovementFlippedHorizontally
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v9 = 0;
    -[_UIFocusItemInfo item](self, "item");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54___UIFocusItemInfo_isFocusMovementFlippedHorizontally__block_invoke;
    v5[3] = &unk_1E16C6008;
    v5[4] = &v6;
    _UIFocusEnvironmentEnumerateAncestorEnvironments(v3, v5);

    *((_BYTE *)&self->_flags + 1) = *((_BYTE *)v7 + 24);
    *(_BYTE *)&self->_flags |= 2u;
    _Block_object_dispose(&v6, 8);
  }
  return *((_BYTE *)&self->_flags + 1);
}

- (BOOL)useFallbackAncestorScroller
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (_UIFocusRegion)focusedRegion
{
  _UIFocusRegion *v3;
  _UIFocusRegion *focusedRegion;

  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    -[_UIFocusItemInfo _createFocusedRegion](self, "_createFocusedRegion");
    v3 = (_UIFocusRegion *)objc_claimAutoreleasedReturnValue();
    focusedRegion = self->_focusedRegion;
    self->_focusedRegion = v3;

    *(_BYTE *)&self->_flags |= 4u;
  }
  return self->_focusedRegion;
}

- (id)_createFocusedRegion
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _UIFocusItemRegion *v22;
  void *v23;
  _UIFocusItemRegion *v24;
  void *v25;
  unint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v36;
  void *v37;
  id v38;
  objc_class *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  NSObject *v43;
  void *v44;
  id v45;
  objc_class *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  id v50;
  objc_class *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  objc_class *v56;
  void *v57;
  __CFString *v58;
  unint64_t v59;
  void *v60;
  id v61;
  objc_class *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  objc_class *v68;
  void *v69;
  __CFString *v70;
  unint64_t v71;
  NSObject *v72;
  void *v73;
  id v74;
  NSObject *v75;
  objc_class *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  objc_class *v81;
  void *v82;
  void *v83;
  id v84;
  objc_class *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  objc_class *v91;
  void *v92;
  void *v93;
  objc_class *v94;
  void *v95;
  uint8_t buf[4];
  id v97;
  __int16 v98;
  __CFString *v99;
  __int16 v100;
  void *v101;
  uint64_t v102;
  CGRect v103;

  v102 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "parentFocusEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_3;
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x1E0CB3940];
      v38 = v5;
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", CFSTR("<%@: %p>"), v40, v38);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusItemInfo.m"), 190, CFSTR("Focus item %@ does not provide a parentFocusEnvironment."), v41);
    }
    else if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        goto LABEL_31;
      v79 = (void *)MEMORY[0x1E0CB3940];
      v80 = v5;
      v81 = (objc_class *)objc_opt_class();
      NSStringFromClass(v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "stringWithFormat:", CFSTR("<%@: %p>"), v82, v80);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v97 = v41;
      _os_log_fault_impl(&dword_185066000, v36, OS_LOG_TYPE_FAULT, "Focus item %@ does not provide a parentFocusEnvironment.  This will become an assert in a future version.", buf, 0xCu);
    }
    else
    {
      v42 = _MergedGlobals_1035;
      if (!_MergedGlobals_1035)
      {
        v42 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v42, (unint64_t *)&_MergedGlobals_1035);
      }
      v43 = *(NSObject **)(v42 + 8);
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
LABEL_3:
        if (!_UIFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(v6)
          || !_UIFocusItemIsViewOrRespondsToSelector(v5))
        {
          goto LABEL_11;
        }
        objc_msgSend(v6, "focusItemContainer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          objc_msgSend(v7, "coordinateSpace");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = _UIFocusItemFrameInCoordinateSpace(v5, v9);
          _UIFocusRectWithMinimumSize(v10, v11, v12, v13);
          v15 = v14;
          v17 = v16;
          v19 = v18;
          v21 = v20;

          v103.origin.x = v15;
          v103.origin.y = v17;
          v103.size.width = v19;
          v103.size.height = v21;
          if (CGRectIsNull(v103))
          {
LABEL_7:

            goto LABEL_11;
          }
          +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v5);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            goto LABEL_10;
          if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            v75 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
              goto LABEL_47;
            v89 = (void *)MEMORY[0x1E0CB3940];
            v90 = v5;
            v91 = (objc_class *)objc_opt_class();
            NSStringFromClass(v91);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "stringWithFormat:", CFSTR("<%@: %p>"), v92, v90);
            v78 = (void *)objc_claimAutoreleasedReturnValue();

            *(_DWORD *)buf = 138412290;
            v97 = v78;
            _os_log_fault_impl(&dword_185066000, v75, OS_LOG_TYPE_FAULT, "Unable to find focus system for item %@", buf, 0xCu);
          }
          else
          {
            v71 = qword_1ECD7D9A8;
            if (!qword_1ECD7D9A8)
            {
              v71 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v71, (unint64_t *)&qword_1ECD7D9A8);
            }
            v72 = *(NSObject **)(v71 + 8);
            if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            {
LABEL_10:
              v24 = [_UIFocusItemRegion alloc];
              objc_msgSend(v8, "coordinateSpace");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = -[_UIFocusItemRegion initWithFrame:coordinateSpace:item:focusSystem:](v24, "initWithFrame:coordinateSpace:item:focusSystem:", v25, v5, v23, v15, v17, v19, v21);

              if (v22)
              {
LABEL_19:

                goto LABEL_20;
              }
LABEL_11:
              if (os_variant_has_internal_diagnostics())
              {
                __UIFaultDebugAssertLog();
                v28 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
                  goto LABEL_17;
                objc_msgSend(v5, "debugDescription");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "parentFocusEnvironment");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "debugDescription");
                v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "parentFocusEnvironment");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "focusItemContainer");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "debugDescription");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v97 = v29;
                v98 = 2112;
                v99 = v31;
                v100 = 2112;
                v101 = v34;
                _os_log_fault_impl(&dword_185066000, v28, OS_LOG_TYPE_FAULT, "Failed to create FocusRegion for FocusItem: %@ with parentFocusEnvironment: %@  focusItemContainer: %@", buf, 0x20u);
              }
              else
              {
                v26 = qword_1ECD7D9B0;
                if (!qword_1ECD7D9B0)
                {
                  v26 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                  atomic_store(v26, (unint64_t *)&qword_1ECD7D9B0);
                }
                v27 = *(NSObject **)(v26 + 8);
                if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  goto LABEL_18;
                v28 = v27;
                objc_msgSend(v5, "debugDescription");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "parentFocusEnvironment");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "debugDescription");
                v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "parentFocusEnvironment");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "focusItemContainer");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "debugDescription");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v97 = v29;
                v98 = 2112;
                v99 = v31;
                v100 = 2112;
                v101 = v34;
                _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "Failed to create FocusRegion for FocusItem: %@ with parentFocusEnvironment: %@  focusItemContainer: %@", buf, 0x20u);
              }

LABEL_17:
LABEL_18:
              v22 = 0;
              goto LABEL_19;
            }
            v73 = (void *)MEMORY[0x1E0CB3940];
            v74 = v5;
            v75 = v72;
            v76 = (objc_class *)objc_opt_class();
            NSStringFromClass(v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "stringWithFormat:", CFSTR("<%@: %p>"), v77, v74);
            v78 = (void *)objc_claimAutoreleasedReturnValue();

            *(_DWORD *)buf = 138412290;
            v97 = v78;
            _os_log_impl(&dword_185066000, v75, OS_LOG_TYPE_ERROR, "Unable to find focus system for item %@", buf, 0xCu);
          }

LABEL_47:
          goto LABEL_10;
        }
        _UIIsPrivateMainBundle();
        if (dyld_program_sdk_at_least())
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = (void *)MEMORY[0x1E0CB3940];
          v50 = v5;
          v51 = (objc_class *)objc_opt_class();
          NSStringFromClass(v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "stringWithFormat:", CFSTR("<%@: %p>"), v52, v50);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          v54 = v6;
          if (v6)
          {
            v55 = (void *)MEMORY[0x1E0CB3940];
            v56 = (objc_class *)objc_opt_class();
            NSStringFromClass(v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "stringWithFormat:", CFSTR("<%@: %p>"), v57, v54);
            v58 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v58 = CFSTR("(nil)");
          }

          -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusItemInfo.m"), 195, CFSTR("Focus item %@ has a parent focus environment of %@ but this environment does not provide a container for focus items."), v53, v58);
          goto LABEL_53;
        }
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v48 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
            goto LABEL_53;
          v83 = (void *)MEMORY[0x1E0CB3940];
          v84 = v5;
          v85 = (objc_class *)objc_opt_class();
          NSStringFromClass(v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "stringWithFormat:", CFSTR("<%@: %p>"), v86, v84);
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          v65 = v87;
          v88 = v6;
          if (v6)
          {
            v93 = (void *)MEMORY[0x1E0CB3940];
            v94 = (objc_class *)objc_opt_class();
            NSStringFromClass(v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "stringWithFormat:", CFSTR("<%@: %p>"), v95, v88);
            v70 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v70 = CFSTR("(nil)");
          }

          *(_DWORD *)buf = 138412546;
          v97 = v65;
          v98 = 2112;
          v99 = v70;
          _os_log_fault_impl(&dword_185066000, v48, OS_LOG_TYPE_FAULT, "Focus item %@ has a parent focus environment of %@ but this environment does not provide a container for focus items.  This will become an assert in a future version.", buf, 0x16u);
        }
        else
        {
          v59 = qword_1ECD7D9A0;
          if (!qword_1ECD7D9A0)
          {
            v59 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v59, (unint64_t *)&qword_1ECD7D9A0);
          }
          v48 = *(id *)(v59 + 8);
          if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            goto LABEL_53;
          v60 = (void *)MEMORY[0x1E0CB3940];
          v61 = v5;
          v62 = (objc_class *)objc_opt_class();
          NSStringFromClass(v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "stringWithFormat:", CFSTR("<%@: %p>"), v63, v61);
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          v65 = v64;
          v66 = v6;
          if (v6)
          {
            v67 = (void *)MEMORY[0x1E0CB3940];
            v68 = (objc_class *)objc_opt_class();
            NSStringFromClass(v68);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "stringWithFormat:", CFSTR("<%@: %p>"), v69, v66);
            v70 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v70 = CFSTR("(nil)");
          }

          *(_DWORD *)buf = 138412546;
          v97 = v65;
          v98 = 2112;
          v99 = v70;
          _os_log_impl(&dword_185066000, v48, OS_LOG_TYPE_ERROR, "Focus item %@ has a parent focus environment of %@ but this environment does not provide a container for focus items.  This will become an assert in a future version.", buf, 0x16u);
        }

LABEL_53:
        goto LABEL_7;
      }
      v44 = (void *)MEMORY[0x1E0CB3940];
      v45 = v5;
      v36 = v43;
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringWithFormat:", CFSTR("<%@: %p>"), v47, v45);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v97 = v41;
      _os_log_impl(&dword_185066000, v36, OS_LOG_TYPE_ERROR, "Focus item %@ does not provide a parentFocusEnvironment.  This will become an assert in a future version.", buf, 0xCu);
    }

LABEL_31:
    goto LABEL_3;
  }
  v22 = 0;
LABEL_20:

  return v22;
}

- (CGRect)focusedRectInCoordinateSpace:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
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
  CGRect result;

  v4 = a3;
  -[_UIFocusItemInfo focusedRegion](self, "focusedRegion");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    +[_UIFocusRegionEvaluator frameForRegion:inCoordinateSpace:](_UIFocusRegionEvaluator, "frameForRegion:inCoordinateSpace:", v5, v4);
    _UIFocusRectWithMinimumSize(v7, v8, v9, v10);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D628];
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)invalidateFocusedRegion
{
  _UIFocusRegion *focusedRegion;

  focusedRegion = self->_focusedRegion;
  self->_focusedRegion = 0;

  *(_BYTE *)&self->_flags &= ~4u;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; item = %@, focusedRegion = %@>"),
    v4,
    self,
    WeakRetained,
    self->_focusedRegion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)shortDescription
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  __CFString *v9;
  _UIFocusRegion *focusedRegion;
  void *v11;
  _UIFocusRegion *v12;
  objc_class *v13;
  void *v14;
  __CFString *v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = objc_loadWeakRetained((id *)&self->_item);
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

  focusedRegion = self->_focusedRegion;
  if (focusedRegion)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = focusedRegion;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v12);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = CFSTR("(nil)");
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; item = %@, focusedRegion = %@>"), v4, self, v9, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (UIFocusItem)item
{
  return (UIFocusItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (UIView)containingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containingView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containingView);
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_focusedRegion, 0);
  objc_storeStrong((id *)&self->_ancestorEnvironmentScrollableContainers, 0);
}

@end
