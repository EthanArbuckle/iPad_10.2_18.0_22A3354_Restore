@implementation UIStackView

+ (Class)layerClass
{
  void *v3;
  objc_super v5;

  if (dyld_program_sdk_at_least())
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___UIStackView;
    objc_msgSendSuper2(&v5, sel_layerClass);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v3;
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  -[_UIOrderedLayoutArrangement _intrinsicContentSizeInvalidatedForItem:](self->_distributionArrangement, "_intrinsicContentSizeInvalidatedForItem:", a3);
}

BOOL __53__UIStackView__vendedBaselineViewParametersDidChange__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _BOOL8 v6;
  id v7;
  uint64_t v8;
  char isKindOfClass;
  BOOL v10;

  v5 = a2;
  if (a3 == 12 && *(_BYTE *)(a1 + 40) || (v6 = 0, a3 == 11) && *(_BYTE *)(a1 + 41))
  {
    v7 = *(id *)(a1 + 32);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      do
      {
        objc_msgSend(v7, "superview");
        v8 = objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v10 = v7 == v5;
        v6 = v7 == v5;
        v7 = (id)v8;
      }
      while (!v10 && (isKindOfClass & 1) != 0);
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

void __53__UIStackView__vendedBaselineViewParametersDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;

  v3 = a2;
  objc_msgSend(v3, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_layoutEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v3, "hasBeenLowered"))
  {
    objc_msgSend(v3, "firstItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);

    if (v6 == v7)
      v8 = objc_msgSend(v3, "firstAttribute");
    else
      v8 = objc_msgSend(v3, "secondAttribute");
    v9 = v8;
    v15 = 0.0;
    -[UIView _baselineViewForConstraint:forFirstItem:withOffset:](*(void **)(a1 + 32), v3, v6 == v7, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 32);
    if ((v9 - 11) > 1)
    {
      if (v10 != v11)
        goto LABEL_8;
    }
    else
    {
      objc_msgSend(v11, "_viewForLoweringBaselineLayoutAttribute:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v12)
      {
LABEL_8:
        objc_msgSend(v3, "_removeFromEngine:", v5);
        objc_msgSend(v3, "_addToEngine:", v5);
LABEL_12:

        goto LABEL_13;
      }
    }
    v13 = v15;
    objc_msgSend(v10, "_baselineOffsetFromNearestEdgeForLayoutAttribute:", v9);
    if (v13 != v14)
      objc_msgSend(v3, "_containerGeometryDidChange");
    goto LABEL_12;
  }
LABEL_13:

}

- (BOOL)_recordBaselineLoweringInfo
{
  return 1;
}

uint64_t __66__UIStackView__commonStackViewInitializationWithArrangedSubviews___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _UIOrderedLayoutArrangement *v5;
  uint64_t v6;
  void *v7;
  _UIAlignedLayoutArrangement *v8;
  uint64_t v9;
  void *v10;
  uint64_t result;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 416);
  *(_QWORD *)(v3 + 416) = v2;

  v5 = -[_UILayoutArrangement initWithItems:onAxis:]([_UIOrderedLayoutArrangement alloc], "initWithItems:onAxis:", *(_QWORD *)(a1 + 40), 0);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 424);
  *(_QWORD *)(v6 + 424) = v5;

  v8 = -[_UILayoutArrangement initWithItems:onAxis:]([_UIAlignedLayoutArrangement alloc], "initWithItems:onAxis:", *(_QWORD *)(a1 + 40), 0);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 432);
  *(_QWORD *)(v9 + 432) = v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlignment:", 120);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setCanvas:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setCanvas:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setLayoutFillsCanvas:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setLayoutFillsCanvas:", 1);
  result = objc_msgSend(*(id *)(a1 + 32), "translatesAutoresizingMaskIntoConstraints");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_setHostsLayoutEngine:", 1);
  return result;
}

- (id)_mutableLayoutArrangements
{
  return self->_mutableLayoutArrangements;
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!a3)
    -[UIView _setHostsLayoutEngine:](self, "_setHostsLayoutEngine:", 0);
  v5.receiver = self;
  v5.super_class = (Class)UIStackView;
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](&v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, v3);
}

- (void)insertArrangedSubview:(UIView *)view atIndex:(NSUInteger)stackIndex
{
  UIView *v7;
  void *v8;
  NSUInteger v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSUInteger v13;
  _UIAlignedLayoutArrangement *alignmentArrangement;
  unint64_t v16;
  unint64_t v17;
  NSObject *log;
  NSObject *loga;
  os_log_t logd;
  NSObject *logb;
  NSObject *logc;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  NSUInteger v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = view;
  -[_UILayoutArrangement items](self->_distributionArrangement, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v9 < stackIndex)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("index out of bounds for arranged subview: index = %lu expected to be less than or equal to %lu"), stackIndex, v9);
  -[_UILayoutArrangement items](self->_alignmentArrangement, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v9 != v11)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      logb = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(logb, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = (uint64_t)v8;
        v25 = 2112;
        v26 = (NSUInteger)v10;
        _os_log_fault_impl(&dword_185066000, logb, OS_LOG_TYPE_FAULT, "number of items in the arrangements for the stack view have gotten out of sync. distribution items: %@ alignment items: %@", buf, 0x16u);
      }

    }
    else
    {
      v16 = qword_1ECD7B580;
      if (!qword_1ECD7B580)
      {
        v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&qword_1ECD7B580);
      }
      log = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v24 = (uint64_t)v8;
        v25 = 2112;
        v26 = (NSUInteger)v10;
        _os_log_impl(&dword_185066000, log, OS_LOG_TYPE_ERROR, "number of items in the arrangements for the stack view have gotten out of sync. distribution items: %@ alignment items: %@", buf, 0x16u);
      }
    }
  }
  -[_UIOrderedLayoutArrangement insertItem:atIndex:](self->_distributionArrangement, "insertItem:atIndex:", v7, stackIndex);
  -[_UILayoutArrangement items](self->_alignmentArrangement, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  if (v13 != v11)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      logc = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(logc, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218240;
        v24 = v11;
        v25 = 2048;
        v26 = v13;
        _os_log_fault_impl(&dword_185066000, logc, OS_LOG_TYPE_FAULT, "number of items in the alignment arrangement changed from %lu to %lu after inserting item in the distribution arrangement", buf, 0x16u);
      }

    }
    else
    {
      v17 = qword_1ECD7B588;
      if (!qword_1ECD7B588)
      {
        v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v17, (unint64_t *)&qword_1ECD7B588);
      }
      loga = *(NSObject **)(v17 + 8);
      if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v24 = v11;
        v25 = 2048;
        v26 = v13;
        _os_log_impl(&dword_185066000, loga, OS_LOG_TYPE_ERROR, "number of items in the alignment arrangement changed from %lu to %lu after inserting item in the distribution arrangement", buf, 0x16u);
      }
    }
  }
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    logd = (os_log_t)objc_claimAutoreleasedReturnValue();
    -[NSObject handleFailureInMethod:object:file:lineNumber:description:](logd, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStackView.m"), 118, CFSTR("number of items in the alignment arrangement is NSNotFound"));

  }
  alignmentArrangement = self->_alignmentArrangement;
  if (v9 == v11 || v13 >= stackIndex)
    -[_UILayoutArrangement insertItem:atIndex:](alignmentArrangement, "insertItem:atIndex:", v7, stackIndex);
  else
    -[_UILayoutArrangement addItem:](alignmentArrangement, "addItem:", v7);

}

- (void)addArrangedSubview:(UIView *)view
{
  _UIOrderedLayoutArrangement *distributionArrangement;
  UIView *v5;

  distributionArrangement = self->_distributionArrangement;
  v5 = view;
  -[_UILayoutArrangement addItem:](distributionArrangement, "addItem:", v5);
  -[_UILayoutArrangement addItem:](self->_alignmentArrangement, "addItem:", v5);

}

- (void)_vendedBaselineViewDidMoveForFirst:(BOOL)a3
{
  uint64_t v3;

  v3 = 7;
  if (a3)
    v3 = 6;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___UIStackView__mutableLayoutArrangements[v3]) = 1;
}

- (BOOL)_shouldRequestTallestBaselineViewForFirst:(BOOL)a3
{
  _BOOL4 v3;
  UIStackViewAlignment v5;
  BOOL v7;

  v3 = a3;
  v5 = -[UIStackView alignment](self, "alignment");
  if (-[UIStackView axis](self, "axis"))
    return 0;
  if ((unint64_t)(v5 - 3) >= 0xFFFFFFFFFFFFFFFELL && !v3)
    return 1;
  v7 = (v5 & 0xFFFFFFFFFFFFFFFELL) == 4 && v3;
  return v5 == UIStackViewAlignmentCenter || v7;
}

- (UILayoutConstraintAxis)axis
{
  return -[_UILayoutArrangement axis](self->_distributionArrangement, "axis");
}

- (UIStackViewAlignment)alignment
{
  unsigned int v2;

  v2 = -[_UIAlignedLayoutArrangement alignment](self->_alignmentArrangement, "alignment");
  if ((v2 & 0x200) != 0)
    return 3;
  if ((v2 & 0x1000) != 0)
    return 2;
  if ((v2 & 0x800) != 0)
    return 5;
  if ((v2 & 8) != 0)
    return ~(v2 >> 4) & 1;
  return 4;
}

- (double)_calculatedIntrinsicHeight
{
  double result;

  -[_UIOrderedLayoutArrangement _calculatedIntrinsicHeight](self->_distributionArrangement, "_calculatedIntrinsicHeight");
  return result;
}

- (CGSize)_systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5 hasIntentionallyCollapsedHeight:(BOOL *)a6
{
  double height;
  double width;
  _BOOL8 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v12 = -[UIView _isInAnimatedLayout](self, "_isInAnimatedLayout");
  if (!v12
    && +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
  {
    -[UIView _setInAnimatedLayout:](self, "_setInAnimatedLayout:", 1);
    -[UIView _setNeedsUpdateConstraintsNeedingLayout:](self, "_setNeedsUpdateConstraintsNeedingLayout:", 0);
  }
  v21.receiver = self;
  v21.super_class = (Class)UIStackView;
  *(float *)&v13 = a4;
  *(float *)&v14 = a5;
  -[UIView _systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:hasIntentionallyCollapsedHeight:](&v21, sel__systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_hasIntentionallyCollapsedHeight_, a6, width, height, v13, v14);
  v16 = v15;
  v18 = v17;
  -[UIView _setInAnimatedLayout:](self, "_setInAnimatedLayout:", v12);
  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (UIStackViewDistribution)distribution
{
  return -[_UIOrderedLayoutArrangement distribution](self->_distributionArrangement, "distribution");
}

- (BOOL)_hasLayoutArrangements
{
  return 1;
}

- (id)viewForFirstBaselineLayout
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIStackView _baselineViewForFirst:](self, "_baselineViewForFirst:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewForFirstBaselineLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = self;
  v6 = v4;

  return v6;
}

- (id)viewForLastBaselineLayout
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIStackView _baselineViewForFirst:](self, "_baselineViewForFirst:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewForLastBaselineLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = self;
  v6 = v4;

  return v6;
}

- (id)_baselineViewForFirst:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[UIStackView _shouldRequestTallestBaselineViewForFirst:](self, "_shouldRequestTallestBaselineViewForFirst:");
  v6 = 5;
  if (v3)
    v6 = 4;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___UIStackView__mutableLayoutArrangements[v6]) = v5;
  return -[_UIOrderedLayoutArrangement _baselineViewVendTallest:forFirstBaseline:](self->_distributionArrangement, "_baselineViewVendTallest:forFirstBaseline:", v5, v3);
}

- (void)_vendedBaselineViewParametersDidChange
{
  BOOL v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD aBlock[5];
  BOOL v10;
  BOOL v11;
  _QWORD v12[7];

  v3 = self->_didRequestTallestBaselineViewForFirst
    || self->_viewForFirstBaselineLayoutDidChange
    || -[UIStackView _shouldRequestTallestBaselineViewForFirst:](self, "_shouldRequestTallestBaselineViewForFirst:", 1);
  if (self->_didRequestTallestBaselineViewForLast || self->_viewForLastBaselineLayoutDidChange)
  {
    LOBYTE(v4) = 1;
LABEL_7:
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__UIStackView__vendedBaselineViewParametersDidChange__block_invoke;
    aBlock[3] = &unk_1E16E97B8;
    v10 = v3;
    v11 = v4;
    aBlock[4] = self;
    v6 = _Block_copy(aBlock);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __53__UIStackView__vendedBaselineViewParametersDidChange__block_invoke_2;
    v8[3] = &unk_1E16E97E0;
    v8[4] = self;
    v7 = _Block_copy(v8);
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = ___UIViewEnumerateLayoutConstraintsAndAdjustForSelectedLayoutVariables_block_invoke;
    v12[3] = &unk_1E16E9900;
    v12[4] = self;
    v12[5] = v6;
    v12[6] = v7;
    -[UIView _withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:](self, "_withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:", v12);
    self->_viewForFirstBaselineLayoutDidChange = 0;
    self->_viewForLastBaselineLayoutDidChange = 0;

    return;
  }
  v4 = -[UIStackView _shouldRequestTallestBaselineViewForFirst:](self, "_shouldRequestTallestBaselineViewForFirst:", 0);
  if (v3 || v4)
    goto LABEL_7;
}

- (void)setSpacing:(CGFloat)spacing
{
  -[_UIOrderedLayoutArrangement setSpacing:](self->_distributionArrangement, "setSpacing:", spacing);
}

- (UIStackView)initWithArrangedSubviews:(NSArray *)views
{
  NSArray *v4;
  UIStackView *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = views;
  v5 = -[UIStackView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          -[UIStackView addArrangedSubview:](v5, "addArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12);
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (UIStackView)initWithFrame:(CGRect)frame
{
  UIStackView *v3;
  UIStackView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIStackView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIStackView _commonStackViewInitializationWithArrangedSubviews:](v3, "_commonStackViewInitializationWithArrangedSubviews:", MEMORY[0x1E0C9AA60]);
    -[UIView setLayoutMargins:](v4, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
  }
  return v4;
}

- (void)_commonStackViewInitializationWithArrangedSubviews:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__UIStackView__commonStackViewInitializationWithArrangedSubviews___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6);

}

- (void)setAlignment:(UIStackViewAlignment)alignment
{
  _UIAlignedLayoutArrangement *alignmentArrangement;
  uint64_t v4;
  void *v5;
  void *v6;

  alignmentArrangement = self->_alignmentArrangement;
  if ((unint64_t)alignment >= (UIStackViewAlignmentBottom|UIStackViewAlignmentFirstBaseline))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSLayoutFormatOptions _alignmentOptionsForStackViewAlignment(UIStackViewAlignment)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("UIStackView.m"), 223, CFSTR("failed to convert stackAlignment to alignmentOptions"));

    v4 = 0;
  }
  else
  {
    v4 = qword_1866850C8[alignment];
  }
  -[_UIAlignedLayoutArrangement setAlignment:](alignmentArrangement, "setAlignment:", v4);
}

- (void)setLayoutMarginsRelativeArrangement:(BOOL)layoutMarginsRelativeArrangement
{
  _BOOL8 v3;

  if (self->_layoutMarginsRelativeArrangement != layoutMarginsRelativeArrangement)
  {
    v3 = layoutMarginsRelativeArrangement;
    self->_layoutMarginsRelativeArrangement = layoutMarginsRelativeArrangement;
    -[_UIOrderedLayoutArrangement setLayoutUsesCanvasMarginsWhenFilling:](self->_distributionArrangement, "setLayoutUsesCanvasMarginsWhenFilling:");
    -[_UIAlignedLayoutArrangement setLayoutUsesCanvasMarginsWhenFilling:](self->_alignmentArrangement, "setLayoutUsesCanvasMarginsWhenFilling:", v3);
  }
}

- (void)setAxis:(UILayoutConstraintAxis)axis
{
  -[_UIOrderedLayoutArrangement setAxis:](self->_distributionArrangement, "setAxis:");
  -[_UIAlignedLayoutArrangement setAxis:](self->_alignmentArrangement, "setAxis:", axis);
}

- (void)updateConstraints
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __32__UIStackView_updateConstraints__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  -[UIView _withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:](self, "_withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:", v2);
}

void __32__UIStackView_updateConstraints__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)UIStackView;
  objc_msgSendSuper2(&v11, sel_updateConstraints);
  v2 = *(id *)(a1 + 32);
  if (qword_1ECD7B598 != -1)
    dispatch_once(&qword_1ECD7B598, &__block_literal_global_150_2);
  if (byte_1ECD7B579)
  {
    objc_msgSend(v2, "arrangedSubviews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    objc_getAssociatedObject(v2, &unk_1ECD7B57A);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 || v5)
    {
      if (!v4 || !v5)
        goto LABEL_11;
      objc_msgSend(v5, "setActive:", 0);
      v8 = 0;
    }
    else
    {
      objc_msgSend(v2, "heightAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintEqualToConstant:", 0.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v9) = 1.0;
      objc_msgSend(v8, "setPriority:", v9);
      objc_msgSend(v8, "setIdentifier:", CFSTR("UISV-fix-for-app-bug-ambiguity"));
      objc_msgSend(v8, "setActive:", 1);
      v6 = v8;
    }
    objc_setAssociatedObject(v2, &unk_1ECD7B57A, v8, (void *)1);
LABEL_11:

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v10 + 440) || *(_BYTE *)(v10 + 441))
    objc_msgSend(*(id *)(v10 + 424), "_didEvaluateMultilineHeightForView:");
}

- (void)setCustomSpacing:(CGFloat)spacing afterView:(UIView *)arrangedSubview
{
  -[_UIOrderedLayoutArrangement setCustomSpacing:afterItem:](self->_distributionArrangement, "setCustomSpacing:afterItem:", arrangedSubview, spacing);
}

- (NSArray)arrangedSubviews
{
  void *v2;
  void *v3;

  -[_UILayoutArrangement items](self->_distributionArrangement, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)setDistribution:(UIStackViewDistribution)distribution
{
  -[_UIOrderedLayoutArrangement setDistribution:](self->_distributionArrangement, "setDistribution:", distribution);
}

- (void)setBaselineRelativeArrangement:(BOOL)baselineRelativeArrangement
{
  -[_UIOrderedLayoutArrangement setBaselineRelativeArrangement:](self->_distributionArrangement, "setBaselineRelativeArrangement:", baselineRelativeArrangement);
}

- (CGFloat)spacing
{
  CGFloat result;

  -[_UIOrderedLayoutArrangement spacing](self->_distributionArrangement, "spacing");
  return result;
}

- (void)removeArrangedSubview:(UIView *)view
{
  _UIOrderedLayoutArrangement *distributionArrangement;
  UIView *v5;

  distributionArrangement = self->_distributionArrangement;
  v5 = view;
  -[_UIOrderedLayoutArrangement removeItem:](distributionArrangement, "removeItem:", v5);
  -[_UILayoutArrangement removeItem:](self->_alignmentArrangement, "removeItem:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alignmentArrangement, 0);
  objc_storeStrong((id *)&self->_distributionArrangement, 0);
  objc_storeStrong((id *)&self->_mutableLayoutArrangements, 0);
}

- (BOOL)_ola_isCandidateForMultilineTextWidthDisambiguationWhenArranged
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[UIView _ola_shouldUseImprovedMultilineTextDisambiguation](self, "_ola_shouldUseImprovedMultilineTextDisambiguation"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[_UILayoutArrangement items](self->_distributionArrangement, "items");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "_ola_isCandidateForMultilineTextWidthDisambiguationWhenArranged") & 1) != 0)
          {

            return 1;
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }

    return 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIStackView;
    return -[UIView _ola_isCandidateForMultilineTextWidthDisambiguationWhenArranged](&v9, sel__ola_isCandidateForMultilineTextWidthDisambiguationWhenArranged);
  }
}

void __34__UIStackView_setBackgroundColor___block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_19_5 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.CarPlayApp"));

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (dyld_program_sdk_at_least())
  {
    if (qword_1ECD7B590 != -1)
      dispatch_once(&qword_1ECD7B590, &__block_literal_global_626);
    if (!_MergedGlobals_19_5)
    {
      v5.receiver = self;
      v5.super_class = (Class)UIStackView;
      -[UIView setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);
    }
  }

}

- (void)setOpaque:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dyld_program_sdk_at_least())
  {
    v5.receiver = self;
    v5.super_class = (Class)UIStackView;
    -[UIView setOpaque:](&v5, sel_setOpaque_, v3);
  }
}

- (UIStackView)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIStackView *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v4 = coder;
  v10.receiver = self;
  v10.super_class = (Class)UIStackView;
  v5 = -[UIView initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIStackViewArrangedSubviews"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = v6;
    else
      v8 = MEMORY[0x1E0C9AA60];
    -[UIStackView _commonStackViewInitializationWithArrangedSubviews:](v5, "_commonStackViewInitializationWithArrangedSubviews:", v8);
    -[UIStackView setAxis:](v5, "setAxis:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIStackViewAxis")));
    -[UIStackView setDistribution:](v5, "setDistribution:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIStackViewDistribution")));
    -[UIStackView setAlignment:](v5, "setAlignment:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIStackViewAlignment")));
    -[NSCoder decodeDoubleForKey:](v4, "decodeDoubleForKey:", CFSTR("UIStackViewSpacing"));
    -[UIStackView setSpacing:](v5, "setSpacing:");
    -[UIStackView setBaselineRelativeArrangement:](v5, "setBaselineRelativeArrangement:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIStackViewBaselineRelative")));
    -[UIStackView setLayoutMarginsRelativeArrangement:](v5, "setLayoutMarginsRelativeArrangement:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIStackViewLayoutMarginsRelative")));

  }
  return v5;
}

- (void)setArrangedSubviews:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIStackView arrangedSubviews](self, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
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
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v12) & 1) == 0)
          -[UIStackView removeArrangedSubview:](self, "removeArrangedSubview:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __35__UIStackView_setArrangedSubviews___block_invoke;
  v13[3] = &unk_1E16B24A0;
  v13[4] = self;
  objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v13);

}

uint64_t __35__UIStackView_setArrangedSubviews___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertArrangedSubview:atIndex:", a2, 0);
}

- (CGFloat)customSpacingAfterView:(UIView *)arrangedSubview
{
  CGFloat result;

  -[_UIOrderedLayoutArrangement customSpacingAfterItem:](self->_distributionArrangement, "customSpacingAfterItem:", arrangedSubview);
  return result;
}

- (BOOL)isBaselineRelativeArrangement
{
  return -[_UIOrderedLayoutArrangement isBaselineRelativeArrangement](self->_distributionArrangement, "isBaselineRelativeArrangement");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIStackView;
  -[UIView encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[UIStackView arrangedSubviews](self, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UIStackViewArrangedSubviews"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIStackView axis](self, "axis"), CFSTR("UIStackViewAxis"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIStackView distribution](self, "distribution"), CFSTR("UIStackViewDistribution"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIStackView alignment](self, "alignment"), CFSTR("UIStackViewAlignment"));
  -[UIStackView spacing](self, "spacing");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UIStackViewSpacing"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UIStackView isBaselineRelativeArrangement](self, "isBaselineRelativeArrangement"), CFSTR("UIStackViewBaselineRelative"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UIStackView isLayoutMarginsRelativeArrangement](self, "isLayoutMarginsRelativeArrangement"), CFSTR("UIStackViewLayoutMarginsRelative"));

}

- (double)_proportionalFillLengthForOrderedArrangement:(id)a3 relevantParentAxis:(int64_t)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  CGFloat Width;
  double v32;
  double v33;
  CGRect v34;

  objc_msgSend(a3, "canvas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4 == 1 && !objc_msgSend(v6, "alignment"))
  {
    v12 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    if ((objc_msgSend(v7, "translatesAutoresizingMaskIntoConstraints") & 1) == 0)
    {
      objc_msgSend(v7, "_layoutEngine");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v7, "_nsis_bounds");
        v12 = v17;
        v13 = v18;
        v14 = v19;
        v15 = v20;
      }
    }
    v21 = *MEMORY[0x1E0C9D820];
    v22 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (*MEMORY[0x1E0C9D820] == v14 && v22 == v15)
    {
      objc_msgSend(v7, "bounds", v21, v22);
      v12 = v21;
      v13 = v22;
      v14 = v24;
      v15 = v25;
    }
    if (objc_msgSend(v7, "isLayoutMarginsRelativeArrangement", v21, v22))
    {
      objc_msgSend(v7, "layoutMargins");
      v12 = v12 + v26;
      v13 = v13 + v27;
      v14 = v14 - (v26 + v28);
      v15 = v15 - (v27 + v29);
    }
    -[UIView _layoutEngine](self, "_layoutEngine");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSISEngine _UIKitPerformPendingChangeNotifications]((uint64_t)v30);

    v34.origin.x = v12;
    v34.origin.y = v13;
    v34.size.width = v14;
    v34.size.height = v15;
    Width = CGRectGetWidth(v34);
    LODWORD(v32) = 1148846080;
    LODWORD(v33) = 1112014848;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v32, v33);
  }
  else
  {
    -[UIView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", 0.0, 0.0);
  }
  if (a4)
    v10 = v9;
  else
    v10 = v8;

  return v10;
}

- (id)description
{
  void *v3;
  UILayoutConstraintAxis v4;
  __CFString *v5;
  __CFString *v6;
  UIStackViewDistribution v7;
  const __CFString *v8;
  UIStackViewAlignment v9;
  UILayoutConstraintAxis v10;
  __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  char v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)UIStackView;
  -[UIView description](&v32, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIStackView axis](self, "axis");
  v5 = CFSTR("vert");
  if (v4 == UILayoutConstraintAxisHorizontal)
    v5 = CFSTR("horiz");
  v6 = v5;
  v7 = -[UIStackView distribution](self, "distribution");
  if ((unint64_t)v7 > UIStackViewDistributionEqualCentering)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E16E9800[v7];
  v9 = -[UIStackView alignment](self, "alignment");
  v10 = -[UIStackView axis](self, "axis");
  v11 = CFSTR("fill");
  switch(v9)
  {
    case UIStackViewAlignmentFill:
      break;
    case UIStackViewAlignmentLeading:
      v12 = CFSTR("leading");
      v13 = CFSTR("top");
      goto LABEL_12;
    case UIStackViewAlignmentFirstBaseline:
      v11 = CFSTR("firstBaseline");
      break;
    case UIStackViewAlignmentCenter:
      v11 = CFSTR("center");
      break;
    case UIStackViewAlignmentTrailing:
      v12 = CFSTR("trailing");
      v13 = CFSTR("bottom");
LABEL_12:
      if (v10 == UILayoutConstraintAxisHorizontal)
        v12 = (__CFString *)v13;
      v11 = v12;
      break;
    case UIStackViewAlignmentLastBaseline:
      v11 = CFSTR("lastBaseline");
      break;
    default:
      v11 = CFSTR("unknown");
      break;
  }
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" axis=%@ distribution=%@ alignment=%@"), v6, v8, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UIStackView axis](self, "axis") == UILayoutConstraintAxisVertical
    && -[UIStackView isBaselineRelativeArrangement](self, "isBaselineRelativeArrangement"))
  {
    objc_msgSend(v14, "stringByAppendingString:", CFSTR(" baselineRelative"));
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }
  if (-[UIStackView isLayoutMarginsRelativeArrangement](self, "isLayoutMarginsRelativeArrangement"))
  {
    objc_msgSend(v14, "stringByAppendingString:", CFSTR(" layoutMarginsRelative"));
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v16;
  }
  if (os_variant_has_internal_diagnostics())
  {
    -[_UILayoutArrangement _mutableItems](self->_distributionArrangement, "_mutableItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23)
    {
      -[_UILayoutArrangement _mutableItems](self->_distributionArrangement, "_mutableItems");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingFormat:", CFSTR(" arrangedSubviews=%p distributionArrangement=%p alignmentArrangement=%p"), v24, self->_distributionArrangement, self->_alignmentArrangement);
      v25 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v25;
    }
    else
    {
      objc_msgSend(v14, "stringByAppendingString:", CFSTR(" NO ARRANGED SUBVIEWS"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UILayoutArrangement _mutableItems](self->_distributionArrangement, "_mutableItems");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UILayoutArrangement _mutableItems](self->_alignmentArrangement, "_mutableItems");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = UIEqual(v26, v27);

      if ((v28 & 1) != 0)
      {
        v14 = v24;
LABEL_32:
        -[_UILayoutArrangement _mutableItems](self->_distributionArrangement, "_mutableItems");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UILayoutArrangement _mutableItems](self->_alignmentArrangement, "_mutableItems");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = UIEqual(v29, v30);

        if ((v31 & 1) != 0)
          return v14;
        v19 = CFSTR(" ERROR: arrangement mismatch");
        goto LABEL_24;
      }
      objc_msgSend(v24, "stringByAppendingFormat:", CFSTR(" distributionArrangement=%p alignmentArrangement=%p"), self->_distributionArrangement, self->_alignmentArrangement);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_32;
  }
  -[UIStackView arrangedSubviews](self, "arrangedSubviews");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (!v18)
  {
    v19 = CFSTR(" NO ARRANGED SUBVIEWS");
LABEL_24:
    objc_msgSend(v14, "stringByAppendingString:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v20;
  }
  return v14;
}

- (BOOL)isLayoutMarginsRelativeArrangement
{
  return self->_layoutMarginsRelativeArrangement;
}

@end
