@implementation _UITableViewCellSwipeContainerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _UITableViewCellSwipeContainerView *v5;
  void *v6;
  uint64_t v7;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_UITableViewCellSwipeContainerView;
  -[UIView hitTest:withEvent:](&v14, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UITableViewCellSwipeContainerView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    -[UIView subviews](self, "subviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
LABEL_3:

      v5 = 0;
      return v5;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        goto LABEL_11;
      -[UIView superview](self, "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _logResponderChain(self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "A leftover _UITableViewCellSwipeContainerView was hit tested that had no children. This indicates UIKit is not properly cleaning up the container view. tableView: %@; responder chain: %@",
        buf,
        0x16u);
    }
    else
    {
      v9 = hitTest_withEvent____s_category;
      if (!hitTest_withEvent____s_category)
      {
        v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&hitTest_withEvent____s_category);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_3;
      v11 = v10;
      -[UIView superview](self, "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _logResponderChain(self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "A leftover _UITableViewCellSwipeContainerView was hit tested that had no children. This indicates UIKit is not properly cleaning up the container view. tableView: %@; responder chain: %@",
        buf,
        0x16u);
    }

LABEL_11:
    goto LABEL_3;
  }
  return v5;
}

@end
