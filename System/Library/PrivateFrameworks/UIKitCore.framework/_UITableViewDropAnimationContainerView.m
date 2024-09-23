@implementation _UITableViewDropAnimationContainerView

- (_UITableViewDropAnimationContainerView)init
{
  _UITableViewDropAnimationContainerView *v2;
  _UITableViewDropAnimationContainerView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITableViewDropAnimationContainerView;
  v2 = -[_UITableViewContainerView init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIView setEdgesInsettingLayoutMarginsFromSafeArea:](v2, "setEdgesInsettingLayoutMarginsFromSafeArea:", -[UIView edgesInsettingLayoutMarginsFromSafeArea](v2, "edgesInsettingLayoutMarginsFromSafeArea") & 0xA);
    -[_UITableViewDropAnimationContainerView setOriginalTargetCenterY:](v3, "setOriginalTargetCenterY:", 1.79769313e308);
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  }
  return v3;
}

- (NSArray)cells
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[UIView subviews](self, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9, (_QWORD)v11);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)updateOffsetFromTargetCenterIfNeeded
{
  double v3;
  double v4;
  double v5;

  -[_UITableViewDropAnimationContainerView originalTargetCenterY](self, "originalTargetCenterY");
  v4 = v3;
  if (v3 != 1.79769313e308)
  {
    -[UIView center](self, "center");
    -[_UITableViewDropAnimationContainerView set_tableViewContainerOffsetFromTargetCenter:](self, "set_tableViewContainerOffsetFromTargetCenter:", 0.0, v5 - v4);
  }
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITableViewDropAnimationContainerView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UITableViewDropAnimationContainerView updateOffsetFromTargetCenterIfNeeded](self, "updateOffsetFromTargetCenterIfNeeded");
}

- (void)setCenter:(CGPoint)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITableViewDropAnimationContainerView;
  -[UIView setCenter:](&v4, sel_setCenter_, a3.x, a3.y);
  -[_UITableViewDropAnimationContainerView updateOffsetFromTargetCenterIfNeeded](self, "updateOffsetFromTargetCenterIfNeeded");
}

- (void)beginDropAnimation
{
  int has_internal_diagnostics;
  _BOOL4 v4;
  double v5;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  int v9;
  _UITableViewDropAnimationContainerView *v10;
  uint64_t v11;
  CGRect v12;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[_UITableViewDropAnimationContainerView activeDropAnimationCount](self, "activeDropAnimationCount"))
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    -[UIView frame](self, "frame");
    v4 = CGRectEqualToRect(v12, *MEMORY[0x1E0C9D648]);
    if (has_internal_diagnostics)
    {
      if (v4)
      {
        __UIFaultDebugAssertLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          v9 = 138412290;
          v10 = self;
          _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "The drop animation container view needs to have a valid frame set before -beginDropAnimation is called the first time: %@", (uint8_t *)&v9, 0xCu);
        }

      }
    }
    else if (v4)
    {
      v7 = beginDropAnimation___s_category;
      if (!beginDropAnimation___s_category)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&beginDropAnimation___s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 138412290;
        v10 = self;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "The drop animation container view needs to have a valid frame set before -beginDropAnimation is called the first time: %@", (uint8_t *)&v9, 0xCu);
      }
    }
    -[UIView center](self, "center");
    -[_UITableViewDropAnimationContainerView setOriginalTargetCenterY:](self, "setOriginalTargetCenterY:", v5);
  }
  -[_UITableViewDropAnimationContainerView setActiveDropAnimationCount:](self, "setActiveDropAnimationCount:", -[_UITableViewDropAnimationContainerView activeDropAnimationCount](self, "activeDropAnimationCount") + 1);
}

- (void)endDropAnimation
{
  void *v4;

  -[_UITableViewDropAnimationContainerView setActiveDropAnimationCount:](self, "setActiveDropAnimationCount:", -[_UITableViewDropAnimationContainerView activeDropAnimationCount](self, "activeDropAnimationCount") - 1);
  if (-[_UITableViewDropAnimationContainerView activeDropAnimationCount](self, "activeDropAnimationCount") < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITableViewDropAnimationContainerView.m"), 94, CFSTR("UITableView internal inconsistency: attempted to end an animation on the drop animation container view that never began"));

  }
  if (!-[_UITableViewDropAnimationContainerView activeDropAnimationCount](self, "activeDropAnimationCount"))
    -[_UITableViewDropAnimationContainerView setOriginalTargetCenterY:](self, "setOriginalTargetCenterY:", 1.79769313e308);
}

- (BOOL)hasCompletedAllDropAnimations
{
  return -[_UITableViewDropAnimationContainerView activeDropAnimationCount](self, "activeDropAnimationCount") == 0;
}

- (CGPoint)_tableViewContainerOffsetFromTargetCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->__tableViewContainerOffsetFromTargetCenter.x;
  y = self->__tableViewContainerOffsetFromTargetCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)set_tableViewContainerOffsetFromTargetCenter:(CGPoint)a3
{
  self->__tableViewContainerOffsetFromTargetCenter = a3;
}

- (int64_t)activeDropAnimationCount
{
  return self->_activeDropAnimationCount;
}

- (void)setActiveDropAnimationCount:(int64_t)a3
{
  self->_activeDropAnimationCount = a3;
}

- (double)originalTargetCenterY
{
  return self->_originalTargetCenterY;
}

- (void)setOriginalTargetCenterY:(double)a3
{
  self->_originalTargetCenterY = a3;
}

@end
