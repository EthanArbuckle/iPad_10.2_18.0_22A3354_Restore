@implementation _UISearchBarSearchContainerView

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (void)setNeedsLayout
{
  objc_super v3;

  if (self->_frozenLayout)
  {
    self->_needsLayoutWhenThawed = 1;
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)_UISearchBarSearchContainerView;
    -[UIView setNeedsLayout](&v3, sel_setNeedsLayout);
    -[_UISearchBarLayoutBase invalidateLayout](self->_layout, "invalidateLayout");
  }
}

- (void)layoutSubviews
{
  int has_internal_diagnostics;
  _UISearchBarSearchContainerLayout *layout;
  double v5;
  double v6;
  int v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_frozenLayout)
  {
    self->_needsLayoutWhenThawed = 1;
    return;
  }
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  layout = self->_layout;
  if (has_internal_diagnostics)
  {
    if (!layout)
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v17) = 0;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Container can't do layoutSubviews without a layout object. This is a UIKit bug.", (uint8_t *)&v17, 2u);
      }

    }
  }
  else if (!layout)
  {
    v13 = _MergedGlobals_3_2;
    if (!_MergedGlobals_3_2)
    {
      v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&_MergedGlobals_3_2);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Container can't do layoutSubviews without a layout object. This is a UIKit bug.", (uint8_t *)&v17, 2u);
    }
  }
  -[UIView bounds](self, "bounds");
  -[_UISearchBarLayoutBase setLayoutSize:](self->_layout, "setLayoutSize:", v5, v6);
  -[_UISearchBarSearchContainerLayout sendWillLayoutSubviewsForSearchFieldContainerView:](self->_layout, "sendWillLayoutSubviewsForSearchFieldContainerView:", self);
  -[_UISearchBarSearchContainerLayout applyLayout](self->_layout, "applyLayout");
  v7 = os_variant_has_internal_diagnostics();
  -[_UISearchBarSearchContainerLayout delegate](self->_layout, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isProspective");

  if (v7)
  {
    if (v9)
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
LABEL_24:

        return;
      }
      -[UIView recursiveDescription](self, "recursiveDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v12;
      _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Live layout with a prospective search layout. Search Field container layout (e.g., search field and cancel button size and positioning) may be incorrect. Please send to UIKit for investigation, and include the following recursive description.\n%@", (uint8_t *)&v17, 0xCu);
LABEL_23:

      goto LABEL_24;
    }
  }
  else if (v9)
  {
    v15 = qword_1ECD7A4D8;
    if (!qword_1ECD7A4D8)
    {
      v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&qword_1ECD7A4D8);
    }
    v16 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v11 = v16;
      -[UIView recursiveDescription](self, "recursiveDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v12;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Live layout with a prospective search layout. Search Field container layout (e.g., search field and cancel button size and positioning) may be incorrect. Please send to UIKit for investigation, and include the following recursive description.\n%@", (uint8_t *)&v17, 0xCu);
      goto LABEL_23;
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  int has_internal_diagnostics;
  _UISearchBarSearchContainerLayout *layout;
  CGFloat Width;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];
  CGSize result;
  CGRect v16;

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  layout = self->_layout;
  if (has_internal_diagnostics)
  {
    if (!layout)
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Container can't calculate sizeThatFits without a layout object. This is a UIKit bug.", buf, 2u);
      }

    }
  }
  else if (!layout)
  {
    v11 = sizeThatFits____s_category_0;
    if (!sizeThatFits____s_category_0)
    {
      v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&sizeThatFits____s_category_0);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Container can't calculate sizeThatFits without a layout object. This is a UIKit bug.", v13, 2u);
    }
  }
  -[UIView bounds](self, "bounds");
  Width = CGRectGetWidth(v16);
  -[_UISearchBarSearchContainerLayout naturalContainerHeight](self->_layout, "naturalContainerHeight");
  v8 = v7;
  v9 = Width;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

- (void)setFrozenLayout:(BOOL)a3
{
  _BOOL4 frozenLayout;

  frozenLayout = self->_frozenLayout;
  self->_frozenLayout = a3;
  if (frozenLayout && !a3 && self->_needsLayoutWhenThawed)
  {
    -[_UISearchBarSearchContainerView setNeedsLayout](self, "setNeedsLayout");
    self->_needsLayoutWhenThawed = 0;
  }
}

- (id)description
{
  void *v3;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISearchBarSearchContainerView;
  -[UIView description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    return v3;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" layout=%p"), self->_layout);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_frozenLayout)
    return v5;
  objc_msgSend(v5, "stringByAppendingString:", CFSTR(" frozen"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_UISearchBarSearchContainerLayout)layout
{
  return self->_layout;
}

- (BOOL)frozenLayout
{
  return self->_frozenLayout;
}

- (BOOL)_isKnownUISearchBarComponentContainer
{
  return 1;
}

@end
