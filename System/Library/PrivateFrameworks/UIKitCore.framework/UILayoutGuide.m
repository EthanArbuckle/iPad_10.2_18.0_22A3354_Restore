@implementation UILayoutGuide

- (id)nsli_superitem
{
  return objc_loadWeakRetained((id *)&self->_owningView);
}

- (BOOL)_uili_isFocusGuide
{
  return 0;
}

- (id)nsli_minXVariable
{
  NSISVariable *minXVariable;
  NSISVariable *v4;
  NSISVariable *v5;

  minXVariable = self->_minXVariable;
  if (!minXVariable)
  {
    _UILayoutItemCreateAndObserveVariableWithValueRestriction(self, 0, 1);
    v4 = (NSISVariable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_minXVariable;
    self->_minXVariable = v4;

    minXVariable = self->_minXVariable;
  }
  return minXVariable;
}

- (id)nsli_minYVariable
{
  NSISVariable *minYVariable;
  NSISVariable *v4;
  NSISVariable *v5;

  minYVariable = self->_minYVariable;
  if (!minYVariable)
  {
    _UILayoutItemCreateAndObserveVariableWithValueRestriction(self, 0, 1);
    v4 = (NSISVariable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_minYVariable;
    self->_minYVariable = v4;

    minYVariable = self->_minYVariable;
  }
  return minYVariable;
}

- (id)nsli_boundsWidthVariable
{
  NSISVariable *boundsWidthVariable;
  NSISVariable *v4;
  NSISVariable *v5;

  boundsWidthVariable = self->_boundsWidthVariable;
  if (!boundsWidthVariable)
  {
    _UILayoutItemCreateAndObserveVariableWithValueRestriction(self, -[UILayoutGuide _allowsNegativeDimensions](self, "_allowsNegativeDimensions") ^ 1, 1);
    v4 = (NSISVariable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_boundsWidthVariable;
    self->_boundsWidthVariable = v4;

    boundsWidthVariable = self->_boundsWidthVariable;
  }
  return boundsWidthVariable;
}

- (id)nsli_boundsHeightVariable
{
  NSISVariable *boundsHeightVariable;
  NSISVariable *v4;
  NSISVariable *v5;

  boundsHeightVariable = self->_boundsHeightVariable;
  if (!boundsHeightVariable)
  {
    _UILayoutItemCreateAndObserveVariableWithValueRestriction(self, -[UILayoutGuide _allowsNegativeDimensions](self, "_allowsNegativeDimensions") ^ 1, 1);
    v4 = (NSISVariable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_boundsHeightVariable;
    self->_boundsHeightVariable = v4;

    boundsHeightVariable = self->_boundsHeightVariable;
  }
  return boundsHeightVariable;
}

- (void)nsis_valueOfVariable:(id)a3 didChangeInEngine:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[UILayoutGuide nsli_layoutEngine](self, "nsli_layoutEngine");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[UILayoutGuide _invalidateLayoutFrame](self, "_invalidateLayoutFrame");
}

- (id)nsli_layoutEngine
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  objc_msgSend(WeakRetained, "nsli_layoutEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_uili_requiresObservationForVariable:(id)a3
{
  return 1;
}

- (BOOL)_allowsNegativeDimensions
{
  return self->__allowsNegativeDimensions;
}

- (BOOL)_isSafeAreaAspectFitLayoutGuide
{
  return 0;
}

- (BOOL)nsli_lowerAttribute:(int)a3 intoExpression:(id)a4 withCoefficient:(double)a5 forConstraint:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  char v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  int v24;
  UILayoutGuide *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v8 = *(_QWORD *)&a3;
  v34 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  objc_msgSend(v11, "container");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || WeakRetained && (objc_msgSend(WeakRetained, "isDescendantOfView:", v13) & 1) != 0)
  {
    v14 = objc_msgSend(WeakRetained, "nsli_lowerAttribute:intoExpression:withCoefficient:forConstraint:onBehalfOfLayoutGuide:", v8, v10, v11, self, a5);
  }
  else
  {
    v15 = nsli_lowerAttribute_intoExpression_withCoefficient_forConstraint____s_category;
    if (!nsli_lowerAttribute_intoExpression_withCoefficient_forConstraint____s_category)
    {
      v15 = __UILogCategoryGetNode("LayoutConstraints", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&nsli_lowerAttribute_intoExpression_withCoefficient_forConstraint____s_category);
    }
    v16 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = v16;
      v18 = (void *)objc_msgSend(v13, "performSelector:", sel_recursiveDescription);
      v19 = v18;
      objc_msgSend(WeakRetained, "superview");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      v24 = 138413314;
      v22 = CFSTR("NO SUPERVIEW");
      v25 = self;
      if (v20)
        v22 = (const __CFString *)v20;
      v26 = 2112;
      v27 = v11;
      v28 = 2112;
      v29 = v18;
      v30 = 2112;
      v31 = WeakRetained;
      v32 = 2112;
      v33 = v22;
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "UILayoutGuide's owningView hierarchy unprepared for constraint.\n\tself = %@\n\tConstraint: %@\n\tContainer hierarchy: \n%@\n\tView not found in container hierarchy: %@\n\tThat view's superview: %@", (uint8_t *)&v24, 0x34u);

    }
    v14 = 0;
  }

  return v14;
}

- (void)_updateLayoutFrameInOwningView:(id)a3 fromEngine:(id)a4
{
  CGSize v5;
  __int128 v11;
  float64x2_t v12;
  float64x2_t v13;

  if (!self->_useManualLayoutFrame)
  {
    v13 = 0uLL;
    v11 = 0u;
    v12 = 0u;
    -[UIView _nsis_center:bounds:inEngine:forLayoutGuide:](a3, v13.f64, (double *)&v11, a4, self);
    v5 = (CGSize)v12;
    __asm { FMOV            V3.2D, #-0.5 }
    self->_layoutFrame.origin = (CGPoint)vaddq_f64(v13, vmulq_f64(v12, _Q3));
    self->_layoutFrame.size = v5;
    self->_isLayoutFrameValid = 1;
  }
}

- (id)_uili_existingBaseFrameVariables
{
  void *v3;
  void *v4;

  if (self->_minXVariable || self->_minYVariable || self->_boundsWidthVariable || self->_boundsHeightVariable)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (self->_minXVariable)
      objc_msgSend(v3, "addObject:");
    if (self->_minYVariable)
      objc_msgSend(v4, "addObject:");
    if (self->_boundsWidthVariable)
      objc_msgSend(v4, "addObject:");
    if (self->_boundsHeightVariable)
      objc_msgSend(v4, "addObject:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (CGRect)layoutFrame
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v7;
  _QWORD *v8;
  void *v9;
  CGSize v10;
  _QWORD *WeakRetained;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  if (self->_useManualLayoutFrame)
  {
    x = self->_layoutFrame.origin.x;
    y = self->_layoutFrame.origin.y;
    width = self->_layoutFrame.size.width;
    height = self->_layoutFrame.size.height;
  }
  else
  {
    -[UILayoutGuide nsli_layoutEngine](self, "nsli_layoutEngine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegate");
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (-[UIView _usesLayoutEngineHostingConstraints]((uint64_t)v8))
      -[UIView _resetLayoutEngineHostConstraints](v8);
    -[UILayoutGuide nsli_layoutEngine](self, "nsli_layoutEngine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSISEngine _UIKitPerformPendingChangeNotifications]((uint64_t)v9);

    if (!self->_isLayoutFrameValid)
    {
      v10 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      self->_layoutFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      self->_layoutFrame.size = v10;
      if (v7)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
        v12 = WeakRetained;
        if ((WeakRetained[14] & 4) == 0 && (!v8 || (v8[14] & 0x20) == 0))
          -[UIView _updateConstraintsAtEngineLevelIfNeededWithViewForVariableChangeNotifications:](WeakRetained, WeakRetained);
        -[UILayoutGuide _updateLayoutFrameInOwningView:fromEngine:](self, "_updateLayoutFrameInOwningView:fromEngine:", v12, v7);

      }
    }
    v13 = objc_loadWeakRetained((id *)&self->_owningView);
    objc_msgSend(v13, "_layoutGuide:adjustedLayoutFrameForFrame:", self, self->_layoutFrame.origin.x, self->_layoutFrame.origin.y, self->_layoutFrame.size.width, self->_layoutFrame.size.height);
    x = v14;
    y = v15;
    width = v16;
    height = v17;

  }
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (UIView)owningView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_owningView);
}

- (void)_setAllowOwningViewSetting:(BOOL)a3
{
  self->_allowOwningViewSetting = a3;
}

- (BOOL)_isLockedToOwningView
{
  return self->_isLockedToOwningView;
}

- (void)setOwningView:(UIView *)owningView
{
  UIView *v4;
  void *v5;
  UIView *v6;
  UIView *v7;

  v4 = owningView;
  if (self->_allowOwningViewSetting
    || (v6 = v4,
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Do not use -[UILayoutGuide setOwningView:] directly. Use -[UIView add/removeLayoutGuide:] instead"), 0), v5 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "raise"), v5, v4 = v6, self->_allowOwningViewSetting))
  {
    if (!self->_isLockedToOwningView)
    {
      v7 = v4;
      -[UILayoutGuide _setOwningView:](self, "_setOwningView:", v4);
      v4 = v7;
      self->_allowOwningViewSetting = 0;
    }
  }

}

- (void)_setOwningView:(id)a3
{
  UIView *WeakRetained;
  UIView *obj;

  obj = (UIView *)a3;
  WeakRetained = (UIView *)objc_loadWeakRetained((id *)&self->_owningView);
  if (WeakRetained != obj)
  {
    if (WeakRetained)
      -[UILayoutGuide _snipReferencingConstraints](self, "_snipReferencingConstraints");
    objc_storeWeak((id *)&self->_owningView, obj);
    self->_unsafeUnretainedOwningView = obj;
    -[UILayoutGuide _invalidateLayoutFrame](self, "_invalidateLayoutFrame");
  }

}

- (void)_invalidateLayoutFrame
{
  if (!self->_useManualLayoutFrame)
    self->_isLayoutFrameValid = 0;
}

- (void)_uili_removeLayoutVariableObservationsOnlyToSupportTAMICChange:(BOOL)a3
{
  -[NSMapTable removeAllObjects](self->_stashedLayoutVariableObservations, "removeAllObjects", a3);
}

- (void)_owningViewIsDeallocating
{
  if (self->_unsafeUnretainedOwningView)
    -[UILayoutGuide _snipReferencingConstraints](self, "_snipReferencingConstraints");
  self->_unsafeUnretainedOwningView = 0;
}

- (void)_snipReferencingConstraints
{
  UIView *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = self->_unsafeUnretainedOwningView;
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    do
    {
      objc_msgSend(v4, "nsli_installedConstraints");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        if (!v5)
          v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v16 = 0u;
        v17 = 0u;
        v14 = 0u;
        v15 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v15;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v15 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
              if (objc_msgSend(v12, "_referencesLayoutItem:", self))
                objc_msgSend(v5, "addObject:", v12);
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          }
          while (v9);
        }

      }
      objc_msgSend(v4, "nsli_superitem");
      v13 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v13;
    }
    while (v13);
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", v5);

}

- (void)_referenceView
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);

  return WeakRetained;
}

- (int)nsis_orientationHintForVariable:(id)a3
{
  NSISVariable *v4;
  NSISVariable *v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  int v12;
  UILayoutGuide *v13;
  __int16 v14;
  NSISVariable *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (NSISVariable *)a3;
  v5 = v4;
  if (self->_minXVariable == v4 || self->_boundsWidthVariable == v4)
    goto LABEL_12;
  if (self->_minYVariable == v4 || self->_boundsHeightVariable == v4)
  {
    v10 = 1;
    goto LABEL_14;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    -[NSISVariable delegate](v5, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = self;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v9;
    _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "%@ got asked for the orientationHint of a variable it doesn't know about: %@, which is owned by:%@", (uint8_t *)&v12, 0x20u);
  }
  else
  {
    v6 = nsis_orientationHintForVariable____s_category;
    if (!nsis_orientationHintForVariable____s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&nsis_orientationHintForVariable____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v8 = v7;
    -[NSISVariable delegate](v5, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = self;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "%@ got asked for the orientationHint of a variable it doesn't know about: %@, which is owned by:%@", (uint8_t *)&v12, 0x20u);
  }

LABEL_11:
LABEL_12:
  v10 = 0;
LABEL_14:

  return v10;
}

- (NSLayoutDimension)widthAnchor
{
  NSLayoutDimension *widthAnchor;
  NSLayoutDimension *v4;
  NSLayoutDimension *v5;

  widthAnchor = self->_widthAnchor;
  if (!widthAnchor)
  {
    -[UILayoutGuide _createAnchorWithClass:attribute:](self, "_createAnchorWithClass:attribute:", objc_opt_class(), 7);
    v4 = (NSLayoutDimension *)objc_claimAutoreleasedReturnValue();
    v5 = self->_widthAnchor;
    self->_widthAnchor = v4;

    widthAnchor = self->_widthAnchor;
  }
  return widthAnchor;
}

- (NSLayoutYAxisAnchor)topAnchor
{
  NSLayoutYAxisAnchor *topAnchor;
  NSLayoutYAxisAnchor *v4;
  NSLayoutYAxisAnchor *v5;

  topAnchor = self->_topAnchor;
  if (!topAnchor)
  {
    -[UILayoutGuide _createAnchorWithClass:attribute:](self, "_createAnchorWithClass:attribute:", objc_opt_class(), 3);
    v4 = (NSLayoutYAxisAnchor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_topAnchor;
    self->_topAnchor = v4;

    topAnchor = self->_topAnchor;
  }
  return topAnchor;
}

- (NSLayoutXAxisAnchor)trailingAnchor
{
  NSLayoutXAxisAnchor *trailingAnchor;
  NSLayoutXAxisAnchor *v4;
  NSLayoutXAxisAnchor *v5;

  trailingAnchor = self->_trailingAnchor;
  if (!trailingAnchor)
  {
    -[UILayoutGuide _createAnchorWithClass:attribute:](self, "_createAnchorWithClass:attribute:", objc_opt_class(), 6);
    v4 = (NSLayoutXAxisAnchor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_trailingAnchor;
    self->_trailingAnchor = v4;

    trailingAnchor = self->_trailingAnchor;
  }
  return trailingAnchor;
}

- (NSLayoutXAxisAnchor)leadingAnchor
{
  NSLayoutXAxisAnchor *leadingAnchor;
  NSLayoutXAxisAnchor *v4;
  NSLayoutXAxisAnchor *v5;

  leadingAnchor = self->_leadingAnchor;
  if (!leadingAnchor)
  {
    -[UILayoutGuide _createAnchorWithClass:attribute:](self, "_createAnchorWithClass:attribute:", objc_opt_class(), 5);
    v4 = (NSLayoutXAxisAnchor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_leadingAnchor;
    self->_leadingAnchor = v4;

    leadingAnchor = self->_leadingAnchor;
  }
  return leadingAnchor;
}

- (id)_createAnchorWithClass:(Class)a3 attribute:(int64_t)a4
{
  return (id)objc_msgSend([a3 alloc], "initWithItem:attribute:", self, a4);
}

- (NSArray)_systemConstraints
{
  return self->_systemConstraints;
}

- (UILayoutGuide)init
{
  UILayoutGuide *v2;
  UILayoutGuide *v3;
  NSString *identifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UILayoutGuide;
  v2 = -[UILayoutGuide init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)&stru_1E16EDF20;

  }
  return v3;
}

- (void)setIdentifier:(NSString *)identifier
{
  objc_setProperty_nonatomic_copy(self, a2, identifier, 88);
}

- (void)_setLockedToOwningView:(BOOL)a3
{
  NSArray *systemConstraints;

  if (self->_isLockedToOwningView != a3)
  {
    if (!self->_isLockedToOwningView)
    {
      systemConstraints = self->_systemConstraints;
      self->_systemConstraints = 0;

    }
    self->_isLockedToOwningView = a3;
  }
}

- (void)_setAllowsNegativeDimensions:(BOOL)a3
{
  self->__allowsNegativeDimensions = a3;
}

- (void)_setSystemConstraints:(id)a3
{
  id v6;
  NSArray *v7;
  NSArray **p_systemConstraints;
  NSArray *systemConstraints;
  char v10;
  void *v11;
  id v12;

  v6 = a3;
  v12 = v6;
  if (self->_isLockedToOwningView
    || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UILayoutGuide.m"), 79, CFSTR("The layout guide must be locked to its owning view before retaining system constraints")), v11, v6 = v12, self->_isLockedToOwningView))
  {
    if ((systemConstraints = self->_systemConstraints,
          p_systemConstraints = &self->_systemConstraints,
          v7 = systemConstraints,
          !v6)
      && v7
      || (v10 = objc_msgSend(v6, "isEqualToArray:", v7), v6 = v12, (v10 & 1) == 0))
    {
      objc_storeStrong((id *)p_systemConstraints, a3);
      v6 = v12;
    }
  }

}

- (NSLayoutDimension)heightAnchor
{
  NSLayoutDimension *heightAnchor;
  NSLayoutDimension *v4;
  NSLayoutDimension *v5;

  heightAnchor = self->_heightAnchor;
  if (!heightAnchor)
  {
    -[UILayoutGuide _createAnchorWithClass:attribute:](self, "_createAnchorWithClass:attribute:", objc_opt_class(), 8);
    v4 = (NSLayoutDimension *)objc_claimAutoreleasedReturnValue();
    v5 = self->_heightAnchor;
    self->_heightAnchor = v4;

    heightAnchor = self->_heightAnchor;
  }
  return heightAnchor;
}

- (NSLayoutYAxisAnchor)bottomAnchor
{
  NSLayoutYAxisAnchor *bottomAnchor;
  NSLayoutYAxisAnchor *v4;
  NSLayoutYAxisAnchor *v5;

  bottomAnchor = self->_bottomAnchor;
  if (!bottomAnchor)
  {
    -[UILayoutGuide _createAnchorWithClass:attribute:](self, "_createAnchorWithClass:attribute:", objc_opt_class(), 4);
    v4 = (NSLayoutYAxisAnchor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bottomAnchor;
    self->_bottomAnchor = v4;

    bottomAnchor = self->_bottomAnchor;
  }
  return bottomAnchor;
}

- (void)nsli_addConstraint:(id)a3
{
  UIView **p_owningView;
  id v4;
  id WeakRetained;

  p_owningView = &self->_owningView;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_owningView);
  objc_msgSend(WeakRetained, "nsli_addConstraint:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerYAnchor, 0);
  objc_storeStrong((id *)&self->_centerXAnchor, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_storeStrong((id *)&self->_widthAnchor, 0);
  objc_storeStrong((id *)&self->_bottomAnchor, 0);
  objc_storeStrong((id *)&self->_topAnchor, 0);
  objc_storeStrong((id *)&self->_rightAnchor, 0);
  objc_storeStrong((id *)&self->_leftAnchor, 0);
  objc_storeStrong((id *)&self->_trailingAnchor, 0);
  objc_storeStrong((id *)&self->_leadingAnchor, 0);
  objc_storeStrong((id *)&self->_stashedLayoutVariableObservations, 0);
  objc_storeStrong((id *)&self->_systemConstraints, 0);
  objc_storeStrong((id *)&self->_boundsHeightVariable, 0);
  objc_storeStrong((id *)&self->_boundsWidthVariable, 0);
  objc_storeStrong((id *)&self->_minYVariable, 0);
  objc_storeStrong((id *)&self->_minXVariable, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_owningView);
  objc_storeStrong((id *)&self->_constraintsToBeProcessedAfterDecoding, 0);
  objc_storeStrong((id *)&self->_layoutRect, 0);
}

- (NSLayoutYAxisAnchor)centerYAnchor
{
  NSLayoutYAxisAnchor *centerYAnchor;
  NSLayoutYAxisAnchor *v4;
  NSLayoutYAxisAnchor *v5;

  centerYAnchor = self->_centerYAnchor;
  if (!centerYAnchor)
  {
    -[UILayoutGuide _createAnchorWithClass:attribute:](self, "_createAnchorWithClass:attribute:", objc_opt_class(), 10);
    v4 = (NSLayoutYAxisAnchor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_centerYAnchor;
    self->_centerYAnchor = v4;

    centerYAnchor = self->_centerYAnchor;
  }
  return centerYAnchor;
}

- (NSLayoutXAxisAnchor)centerXAnchor
{
  NSLayoutXAxisAnchor *centerXAnchor;
  NSLayoutXAxisAnchor *v4;
  NSLayoutXAxisAnchor *v5;

  centerXAnchor = self->_centerXAnchor;
  if (!centerXAnchor)
  {
    -[UILayoutGuide _createAnchorWithClass:attribute:](self, "_createAnchorWithClass:attribute:", objc_opt_class(), 9);
    v4 = (NSLayoutXAxisAnchor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_centerXAnchor;
    self->_centerXAnchor = v4;

    centerXAnchor = self->_centerXAnchor;
  }
  return centerXAnchor;
}

- (NSLayoutXAxisAnchor)leftAnchor
{
  NSLayoutXAxisAnchor *leftAnchor;
  NSLayoutXAxisAnchor *v4;
  NSLayoutXAxisAnchor *v5;

  leftAnchor = self->_leftAnchor;
  if (!leftAnchor)
  {
    -[UILayoutGuide _createAnchorWithClass:attribute:](self, "_createAnchorWithClass:attribute:", objc_opt_class(), 1);
    v4 = (NSLayoutXAxisAnchor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_leftAnchor;
    self->_leftAnchor = v4;

    leftAnchor = self->_leftAnchor;
  }
  return leftAnchor;
}

- (NSLayoutXAxisAnchor)rightAnchor
{
  NSLayoutXAxisAnchor *rightAnchor;
  NSLayoutXAxisAnchor *v4;
  NSLayoutXAxisAnchor *v5;

  rightAnchor = self->_rightAnchor;
  if (!rightAnchor)
  {
    -[UILayoutGuide _createAnchorWithClass:attribute:](self, "_createAnchorWithClass:attribute:", objc_opt_class(), 2);
    v4 = (NSLayoutXAxisAnchor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_rightAnchor;
    self->_rightAnchor = v4;

    rightAnchor = self->_rightAnchor;
  }
  return rightAnchor;
}

- (void)_setShouldBeArchived:(BOOL)a3
{
  self->__shouldBeArchived = a3;
}

- (id)nsli_constraintWithAnchor:(id)a3 relatedBy:(int64_t)a4 toAnchor:(id)a5 withSystemSpacingMultipliedBy:(double)a6
{
  uint64_t v9;
  id v10;
  id v11;
  void *v12;

  v9 = _MergedGlobals_1306;
  v10 = a5;
  v11 = a3;
  if (v9 != -1)
    dispatch_once(&_MergedGlobals_1306, &__block_literal_global_630);
  objc_msgSend((id)qword_1ECD822A8, "nsli_constraintWithAnchor:relatedBy:toAnchor:withSystemSpacingMultipliedBy:", v11, a4, v10, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_setManualLayoutFrame:(CGRect)a3
{
  self->_useManualLayoutFrame = 1;
  self->_isLayoutFrameValid = 1;
  self->_layoutFrame = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

+ (double)_defaultSpacingBetweenGuidesForResolvingSymbolicConstant
{
  return 8.0;
}

- (void)dealloc
{
  UIView **p_owningView;
  id WeakRetained;
  id v5;
  objc_super v6;

  p_owningView = &self->_owningView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);

  if (WeakRetained)
  {
    -[UILayoutGuide _setLockedToOwningView:](self, "_setLockedToOwningView:", 0);
    v5 = objc_loadWeakRetained((id *)p_owningView);
    objc_msgSend(v5, "removeLayoutGuide:", self);

  }
  -[NSISVariable setDelegate:](self->_minXVariable, "setDelegate:", 0);
  -[NSISVariable setDelegate:](self->_minYVariable, "setDelegate:", 0);
  -[NSISVariable setDelegate:](self->_boundsWidthVariable, "setDelegate:", 0);
  -[NSISVariable setDelegate:](self->_boundsHeightVariable, "setDelegate:", 0);
  v6.receiver = self;
  v6.super_class = (Class)UILayoutGuide;
  -[UILayoutGuide dealloc](&v6, sel_dealloc);
}

void __92__UILayoutGuide_nsli_constraintWithAnchor_relatedBy_toAnchor_withSystemSpacingMultipliedBy___block_invoke()
{
  UIView *v0;
  void *v1;

  v0 = objc_alloc_init(UIView);
  v1 = (void *)qword_1ECD822A8;
  qword_1ECD822A8 = (uint64_t)v0;

}

- (UILayoutGuide)initWithCoder:(id)a3
{
  id v4;
  UILayoutGuide *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  NSArray *systemConstraints;
  id *WeakRetained;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSMutableArray *constraintsToBeProcessedAfterDecoding;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UILayoutGuide;
  v5 = -[UILayoutGuide init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UILayoutGuideOwningView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_owningView, v6);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UILayoutGuideIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v5->_isLockedToOwningView = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UILayoutGuideOwningViewIsLocked"));
    v5->__shouldBeArchived = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UILayoutGuideShouldBeArchived"));
    v5->__allowsNegativeDimensions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UILayoutGuideAllowsNegativeDimensions"));
    if (v5->_isLockedToOwningView)
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UILayoutGuideSystemConstraints"));
      v9 = objc_claimAutoreleasedReturnValue();
      systemConstraints = v5->_systemConstraints;
      v5->_systemConstraints = (NSArray *)v9;

    }
    WeakRetained = (id *)objc_loadWeakRetained((id *)&v5->_owningView);
    -[UIView _finishDecodingLayoutGuideConnections:](WeakRetained, v5);

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v5->_constraintsToBeProcessedAfterDecoding;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v17, "container", (_QWORD)v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "_faultInGuidesForConstraint:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v14);
    }

    constraintsToBeProcessedAfterDecoding = v5->_constraintsToBeProcessedAfterDecoding;
    v5->_constraintsToBeProcessedAfterDecoding = 0;

  }
  return v5;
}

- (BOOL)_ui_usesManualLayout
{
  return 0;
}

- (void)_ui_addToView:(id)a3 atIndex:(int64_t)a4
{
  objc_msgSend(a3, "addLayoutGuide:", self, a4);
}

- (void)_ui_addSubLayoutItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UILayoutGuide owningView](self, "owningView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ui_addToView:atIndex:", v5, -1);

}

- (void)_ui_insertSubLayoutItem:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[UILayoutGuide owningView](self, "owningView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_ui_addToView:atIndex:", v7, a4);

}

- (void)_ui_removeFromParentLayoutItem
{
  id v3;

  -[UILayoutGuide owningView](self, "owningView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeLayoutGuide:", self);

}

- (UITraitCollection)traitCollection
{
  void *v2;
  void *v3;

  -[UILayoutGuide _ui_view](self, "_ui_view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITraitCollection *)v3;
}

- (NSArray)constraintsAffectingLayoutForAxis:(UILayoutConstraintAxis)axis
{
  NSArray *result;

  result = -[UIView constraintsAffectingLayoutForAxis:ofItem:](-[UILayoutGuide owningView](self, "owningView"), "constraintsAffectingLayoutForAxis:ofItem:", axis, self);
  if (!result)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return result;
}

- (BOOL)hasAmbiguousLayout
{
  return objc_msgSend((id)_layoutVariablesWithAmbiguousValueForLayoutItem(self), "count") != 0;
}

- (id)_autolayoutTraceAtLevel:(int64_t)a3 recursively:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const __CFString *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("\n"), a4);
  if (a3 >= 1)
  {
    do
    {
      objc_msgSend(v6, "appendString:", CFSTR("|   "));
      --a3;
    }
    while (a3);
  }
  v7 = (void *)_layoutVariablesWithAmbiguousValueForLayoutItem(self);
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
            objc_enumerationMutation(v7);
          objc_msgSend(v8, "appendString:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "description"));
          objc_msgSend(v8, "appendString:", CFSTR(", "));
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }
    objc_msgSend(v8, "deleteCharactersInRange:", objc_msgSend(v8, "length") - 2, 2);
    v13 = -[UILayoutGuide _descriptionForLayoutTrace](self, "_descriptionForLayoutTrace");
    if (v8)
      v14 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("- AMBIGUOUS LAYOUT for %@"), v8);
    else
      v14 = CFSTR(" - AMBIGUOUS LAYOUT");
  }
  else
  {
    v13 = -[UILayoutGuide _descriptionForLayoutTrace](self, "_descriptionForLayoutTrace");
    v14 = &stru_1E16EDF20;
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("*%@%@"), v13, v14);
  return v6;
}

- (id)_layoutRect
{
  NSLayoutRect *layoutRect;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSLayoutRect *v9;
  NSLayoutRect *v10;

  layoutRect = self->_layoutRect;
  if (!layoutRect)
  {
    v4 = (void *)MEMORY[0x1E0D156F0];
    -[UILayoutGuide leadingAnchor](self, "leadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide widthAnchor](self, "widthAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide heightAnchor](self, "heightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutRectWithLeadingAnchor:topAnchor:widthAnchor:heightAnchor:", v5, v6, v7, v8);
    v9 = (NSLayoutRect *)objc_claimAutoreleasedReturnValue();
    v10 = self->_layoutRect;
    self->_layoutRect = v9;

    layoutRect = self->_layoutRect;
  }
  return layoutRect;
}

- (void)encodeWithCoder:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  objc_msgSend(v5, "encodeObject:forKey:", WeakRetained, CFSTR("UILayoutGuideOwningView"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("UILayoutGuideIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isLockedToOwningView, CFSTR("UILayoutGuideOwningViewIsLocked"));
  objc_msgSend(v5, "encodeBool:forKey:", self->__shouldBeArchived, CFSTR("UILayoutGuideShouldBeArchived"));
  objc_msgSend(v5, "encodeBool:forKey:", self->__allowsNegativeDimensions, CFSTR("UILayoutGuideAllowsNegativeDimensions"));
  if (self->_isLockedToOwningView)
    objc_msgSend(v5, "encodeObject:forKey:", self->_systemConstraints, CFSTR("UILayoutGuideSystemConstraints"));

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGRect v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide layoutFrame](self, "layoutFrame");
  NSStringFromCGRect(v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide owningView](self, "owningView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p - \"%@\", layoutFrame = %@, owningView = %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)_addConstraintToBeProcessedAfterDecoding:(id)a3
{
  id v4;
  NSMutableArray *constraintsToBeProcessedAfterDecoding;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    constraintsToBeProcessedAfterDecoding = self->_constraintsToBeProcessedAfterDecoding;
    v8 = v4;
    if (!constraintsToBeProcessedAfterDecoding)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_constraintsToBeProcessedAfterDecoding;
      self->_constraintsToBeProcessedAfterDecoding = v6;

      constraintsToBeProcessedAfterDecoding = self->_constraintsToBeProcessedAfterDecoding;
    }
    -[NSMutableArray addObject:](constraintsToBeProcessedAfterDecoding, "addObject:", v8);
    v4 = v8;
  }

}

- (CGSize)nsli_convertSizeToEngineSpace:(CGSize)a3
{
  double height;
  double width;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  objc_msgSend(WeakRetained, "nsli_convertSizeToEngineSpace:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)nsli_convertSizeFromEngineSpace:(CGSize)a3
{
  double height;
  double width;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  objc_msgSend(WeakRetained, "nsli_convertSizeFromEngineSpace:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)nsli_resolvedValue:(double *)a3 forSymbolicConstant:(id)a4 inConstraint:(id)a5 error:(id *)a6
{
  *a3 = 0.0;
  return 1;
}

- (BOOL)nsli_defaultResolvedValue:(double *)a3 forSymbolicConstant:(id)a4 inConstraint:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a5;
  v11 = a4;
  -[UILayoutGuide owningView](self, "owningView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v12, "nsli_defaultResolvedValue:forSymbolicConstant:inConstraint:error:", a3, v11, v10, a6);

  return (char)a6;
}

- (id)nsli_description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%p'%@'"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)nsli_descriptionIncludesPointer
{
  return 1;
}

- (unint64_t)nsli_autoresizingMask
{
  return 0;
}

- (BOOL)nsli_isFlipped
{
  return 1;
}

- (BOOL)nsli_removeConstraint:(id)a3
{
  UIView **p_owningView;
  id v4;
  id WeakRetained;
  char v6;

  p_owningView = &self->_owningView;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_owningView);
  v6 = objc_msgSend(WeakRetained, "nsli_removeConstraint:", v4);

  return v6;
}

- (id)nsli_installedConstraints
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (double)nsli_marginOffsetForAttribute:(int64_t)a3
{
  return 0.0;
}

- (BOOL)nsli_lowerAttribute:(int)a3 intoExpression:(id)a4 withCoefficient:(double)a5 container:(id)a6
{
  unint64_t v6;
  NSObject *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = nsli_lowerAttribute_intoExpression_withCoefficient_container____s_category_0;
  if (!nsli_lowerAttribute_intoExpression_withCoefficient_container____s_category_0)
  {
    v6 = __UILogCategoryGetNode("LayoutConstraints", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&nsli_lowerAttribute_intoExpression_withCoefficient_container____s_category_0);
  }
  v7 = *(NSObject **)(v6 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 136315138;
    v10 = "-[UILayoutGuide nsli_lowerAttribute:intoExpression:withCoefficient:container:]";
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Unexpected call to %s", (uint8_t *)&v9, 0xCu);
  }
  return 0;
}

- (id)nsli_contentWidthVariable
{
  return 0;
}

- (id)nsli_contentHeightVariable
{
  return 0;
}

- (BOOL)nsli_isCollectingConstraintChangesForLaterCoordinatedFlush:(id)a3
{
  return 0;
}

- (BOOL)nsli_isLegalConstraintItem
{
  return 1;
}

- (BOOL)nsli_isRTL
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  v3 = objc_msgSend(WeakRetained, "nsli_isRTL");

  return v3;
}

- (CGSize)nsli_engineToUserScalingCoefficients
{
  int has_internal_diagnostics;
  UIView **p_owningView;
  id WeakRetained;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];
  CGSize result;

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  p_owningView = &self->_owningView;
  WeakRetained = objc_loadWeakRetained((id *)p_owningView);

  if (has_internal_diagnostics)
  {
    if (!WeakRetained)
    {
      __UIFaultDebugAssertLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "Unexpected access to UILayoutGuide without an owning view", buf, 2u);
      }

    }
  }
  else if (!WeakRetained)
  {
    v15 = nsli_engineToUserScalingCoefficients___s_category;
    if (!nsli_engineToUserScalingCoefficients___s_category)
    {
      v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&nsli_engineToUserScalingCoefficients___s_category);
    }
    v16 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Unexpected access to UILayoutGuide without an owning view", v17, 2u);
    }
  }
  v6 = objc_loadWeakRetained((id *)p_owningView);

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)p_owningView);
    objc_msgSend(v7, "nsli_engineToUserScalingCoefficients");
    v9 = v8;
    v11 = v10;

  }
  else
  {
    objc_opt_self();
    v9 = 0x3F66C16C16C16C17;
    v11 = 0x3F66C16C16C16C17;
  }
  v12 = *(double *)&v9;
  v13 = *(double *)&v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)_uili_stashLayoutVariableObservation:(id)a3 forVariable:(id)a4
{
  id v6;
  NSMapTable *stashedLayoutVariableObservations;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  stashedLayoutVariableObservations = self->_stashedLayoutVariableObservations;
  if (!stashedLayoutVariableObservations)
  {
    v8 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 4);
    v9 = self->_stashedLayoutVariableObservations;
    self->_stashedLayoutVariableObservations = v8;

    stashedLayoutVariableObservations = self->_stashedLayoutVariableObservations;
  }
  -[NSMapTable setObject:forKey:](stashedLayoutVariableObservations, "setObject:forKey:", v10, v6);

}

- (BOOL)nsis_shouldIntegralizeVariable:(id)a3
{
  return 0;
}

- (BOOL)nsis_valueOfVariableIsUserObservable:(id)a3
{
  return 1;
}

- (id)nsis_descriptionOfVariable:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_owningView);
    objc_msgSend(v6, "nsis_descriptionOfVariable:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    if (!self->_identifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("variable for UILayoutGuide%@ with no owning view."), &stru_1E16EDF20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@,"), self->_identifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("variable for UILayoutGuide%@ with no owning view."), v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;

LABEL_6:
  return v9;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  UIView **p_owningView;
  id WeakRetained;
  void *v7;
  size_t v8;
  void *v9;
  objc_super v10;
  _OWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (dyld_program_sdk_at_least())
  {
    v10.receiver = self;
    v10.super_class = (Class)UILayoutGuide;
    -[UILayoutGuide forwardInvocation:](&v10, sel_forwardInvocation_, v4);
  }
  else
  {
    p_owningView = &self->_owningView;
    WeakRetained = objc_loadWeakRetained((id *)p_owningView);

    if (WeakRetained)
    {
      v7 = objc_loadWeakRetained((id *)p_owningView);
      objc_msgSend(v4, "invokeWithTarget:", v7);
    }
    else
    {
      objc_msgSend(v4, "methodSignature");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "methodReturnLength");
      if (v8)
      {
        memset(v11, 0, sizeof(v11));
        if (v8 <= 0x20)
        {
          objc_msgSend(v4, "setReturnValue:", v11);
        }
        else
        {
          v9 = malloc_type_calloc(v8, 1uLL, 0x100004077774924uLL);
          objc_msgSend(v4, "setReturnValue:", v9);
          free(v9);
        }
      }
    }

  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  UIView **p_owningView;
  id WeakRetained;
  id v8;
  void *v9;
  objc_super v11;

  if (dyld_program_sdk_at_least())
  {
    v11.receiver = self;
    v11.super_class = (Class)UILayoutGuide;
    -[UILayoutGuide methodSignatureForSelector:](&v11, sel_methodSignatureForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    p_owningView = &self->_owningView;
    WeakRetained = objc_loadWeakRetained((id *)p_owningView);

    if (WeakRetained)
    {
      v8 = objc_loadWeakRetained((id *)p_owningView);
      objc_msgSend(v8, "methodSignatureForSelector:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      return v9;
    }
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)_allowOwningViewSetting
{
  return self->_allowOwningViewSetting;
}

- (NSISVariable)_minXVariable
{
  return self->_minXVariable;
}

- (NSISVariable)_minYVariable
{
  return self->_minYVariable;
}

- (NSISVariable)_boundsWidthVariable
{
  return self->_boundsWidthVariable;
}

- (NSISVariable)_boundsHeightVariable
{
  return self->_boundsHeightVariable;
}

- (BOOL)_useManualLayoutFrame
{
  return self->_useManualLayoutFrame;
}

- (NSMapTable)_stashedLayoutVariableObservations
{
  return self->_stashedLayoutVariableObservations;
}

- (BOOL)_shouldBeArchived
{
  return self->__shouldBeArchived;
}

- (CGRect)frameInView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UILayoutGuide _frameInCoordinateSpace:window:](self, "_frameInCoordinateSpace:window:", a3, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_frameInCoordinateSpace:(id)a3 window:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v5 = a3;
  -[UILayoutGuide owningView](self, "owningView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide layoutFrame](self, "layoutFrame");
  objc_msgSend(v6, "convertRect:toCoordinateSpace:", v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)_nearestViewController
{
  return 0;
}

@end
