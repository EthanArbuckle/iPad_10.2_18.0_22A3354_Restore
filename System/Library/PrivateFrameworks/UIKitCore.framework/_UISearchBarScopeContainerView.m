@implementation _UISearchBarScopeContainerView

- (_UISearchBarScopeContainerView)initWithFrame:(CGRect)a3
{
  _UISearchBarScopeContainerView *v3;
  _UISearchBarScopeContainerLayout *v4;
  _UISearchBarScopeContainerLayout *layout;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UISearchBarScopeContainerView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_UISearchBarScopeContainerLayout);
    layout = v3->_layout;
    v3->_layout = v4;

    -[UIView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[UIView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupOpacity:", 0);

  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  int has_internal_diagnostics;
  _UISearchBarScopeContainerLayout *layout;
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
    v11 = sizeThatFits____s_category;
    if (!sizeThatFits____s_category)
    {
      v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&sizeThatFits____s_category);
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
  -[_UISearchBarScopeContainerLayout naturalContainerHeight](self->_layout, "naturalContainerHeight");
  v8 = v7;
  v9 = Width;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  int has_internal_diagnostics;
  _UISearchBarScopeContainerLayout *layout;
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
    v13 = _MergedGlobals_967;
    if (!_MergedGlobals_967)
    {
      v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&_MergedGlobals_967);
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
  -[_UISearchBarScopeContainerLayout applyLayout](self->_layout, "applyLayout");
  v7 = os_variant_has_internal_diagnostics();
  -[_UISearchBarScopeContainerLayout delegate](self->_layout, "delegate");
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
LABEL_22:

        return;
      }
      -[UIView recursiveDescription](self, "recursiveDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v12;
      _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Live layout with a prospective search layout. Scope Bar container layout (e.g., search scope bar size and positioning) may be incorrect. Please send to UIKit for investigation, and include the following recursive description.\n%@", (uint8_t *)&v17, 0xCu);
LABEL_21:

      goto LABEL_22;
    }
  }
  else if (v9)
  {
    v15 = qword_1ECD7CDD8;
    if (!qword_1ECD7CDD8)
    {
      v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&qword_1ECD7CDD8);
    }
    v16 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v11 = v16;
      -[UIView recursiveDescription](self, "recursiveDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v12;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Live layout with a prospective search layout. Scope Bar container layout (e.g., search scope bar size and positioning) may be incorrect. Please send to UIKit for investigation, and include the following recursive description.\n%@", (uint8_t *)&v17, 0xCu);
      goto LABEL_21;
    }
  }
}

- (void)setNeedsLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISearchBarScopeContainerView;
  -[UIView setNeedsLayout](&v3, sel_setNeedsLayout);
  -[_UISearchBarLayoutBase invalidateLayout](self->_layout, "invalidateLayout");
}

- (id)description
{
  void *v3;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UISearchBarScopeContainerView;
  -[UIView description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    return v3;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" layout=%p"), self->_layout);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_UISearchBarScopeContainerLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

- (BOOL)_isKnownUISearchBarComponentContainer
{
  return 1;
}

@end
