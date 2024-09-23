@implementation _UITableViewHeaderFooterContentView

- (_UITableViewHeaderFooterContentView)initWithFrame:(CGRect)a3
{
  _UITableViewHeaderFooterContentView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITableViewHeaderFooterContentView;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3 && dyld_program_sdk_at_least())
    -[UIView _setHostsLayoutEngine:](v3, "_setHostsLayoutEngine:", 1);
  return v3;
}

- (UIEdgeInsets)_concreteDefaultLayoutMargins
{
  double v3;
  double v4;
  void *v5;
  double v6;
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
  objc_super v17;
  UIEdgeInsets result;

  v17.receiver = self;
  v17.super_class = (Class)_UITableViewHeaderFooterContentView;
  -[UIView _concreteDefaultLayoutMargins](&v17, sel__concreteDefaultLayoutMargins);
  v4 = v3;
  -[_UITableViewHeaderFooterContentView _headerFooterView](self, "_headerFooterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _UITableViewHeaderFooterViewConcreteDefaultLayoutMargins(v5, 1, v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (id)_headerFooterView
{
  void *v4;
  id v5;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[UIView superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableViewHeaderFooterView.m"), 271, CFSTR("UITableViewHeaderFooterView's contentView must remain a direct subview of it. Unexpected superview of the contentView: %@"), v4);

    }
    else
    {
      v8 = _headerFooterView___s_category;
      if (!_headerFooterView___s_category)
      {
        v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&_headerFooterView___s_category);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v4;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "UITableViewHeaderFooterView's contentView must remain a direct subview of it. Unexpected superview of the contentView: %@", buf, 0xCu);
      }
    }
    v5 = 0;
  }

  return v5;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[UIView backgroundColor](self, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)_UITableViewHeaderFooterContentView;
  -[UIView setBackgroundColor:](&v8, sel_setBackgroundColor_, v4);
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    -[_UITableViewHeaderFooterContentView _headerFooterView](self, "_headerFooterView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_invalidateDetailLabelBackgroundColor");

  }
}

- (void)_updateConstraintsIfNeededWithViewForVariableChangeNotifications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[UIView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIView superview](self, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  if ((*(_QWORD *)&self->super._viewFlags & 0x400000000000000) != 0
    && -[UIView _hostsLayoutEngine](self, "_hostsLayoutEngine")
    && objc_msgSend(v6, "needsUpdateConstraints"))
  {
    objc_msgSend(v6, "_updateConstraintsIfNeededWithViewForVariableChangeNotifications:", v4);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UITableViewHeaderFooterContentView;
    -[UIView _updateConstraintsIfNeededWithViewForVariableChangeNotifications:](&v7, sel__updateConstraintsIfNeededWithViewForVariableChangeNotifications_, v4);
  }

}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (!a3
    && -[UIView translatesAutoresizingMaskIntoConstraints](self, "translatesAutoresizingMaskIntoConstraints")
    && dyld_program_sdk_at_least())
  {
    v5 = setTranslatesAutoresizingMaskIntoConstraints____s_category_2;
    if (!setTranslatesAutoresizingMaskIntoConstraints____s_category_2)
    {
      v5 = __UILogCategoryGetNode("LayoutConstraints", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&setTranslatesAutoresizingMaskIntoConstraints____s_category_2);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      -[UIView superview](self, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Changing the translatesAutoresizingMaskIntoConstraints property of the contentView of a UITableViewHeaderFooterView is not supported and will result in undefined behavior, as this property is managed by the owning UITableViewHeaderFooterView. View: %@", buf, 0xCu);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)_UITableViewHeaderFooterContentView;
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](&v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, v3);
}

@end
