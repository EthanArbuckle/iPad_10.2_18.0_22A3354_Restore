@implementation UITableViewCellContentView

- (UIEdgeInsets)_concreteDefaultLayoutMargins
{
  _BOOL4 v3;
  double top;
  double trailing;
  double bottom;
  double v7;
  CGFloat leading;
  objc_super v9;
  UIEdgeInsets result;

  v3 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v9.receiver = self;
  v9.super_class = (Class)UITableViewCellContentView;
  -[UIView _concreteDefaultLayoutMargins](&v9, sel__concreteDefaultLayoutMargins);
  if ((*(_BYTE *)&self->_contentViewFlags & 2) != 0)
  {
    leading = self->_overriddenDefaultLayoutMargins.leading;
    if (!v3)
    {
      trailing = self->_overriddenDefaultLayoutMargins.leading;
      if ((*(_BYTE *)&self->_contentViewFlags & 8) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
    v7 = self->_overriddenDefaultLayoutMargins.leading;
    if ((*(_BYTE *)&self->_contentViewFlags & 8) == 0)
      goto LABEL_10;
LABEL_7:
    trailing = self->_overriddenDefaultLayoutMargins.trailing;
    v7 = leading;
    goto LABEL_10;
  }
  if ((*(_BYTE *)&self->_contentViewFlags & 8) == 0)
    goto LABEL_10;
  leading = v7;
  if (v3)
    goto LABEL_7;
LABEL_9:
  v7 = self->_overriddenDefaultLayoutMargins.trailing;
LABEL_10:
  if ((*(_BYTE *)&self->_contentViewFlags & 1) != 0)
    top = self->_overriddenDefaultLayoutMargins.top;
  if ((*(_BYTE *)&self->_contentViewFlags & 4) != 0)
    bottom = self->_overriddenDefaultLayoutMargins.bottom;
  result.right = v7;
  result.bottom = bottom;
  result.left = trailing;
  result.top = top;
  return result;
}

- (void)_setOverriddenDefaultLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  double v3;
  char v4;
  BOOL v5;
  char v6;

  v3 = fabs(a3.leading);
  self->_overriddenDefaultLayoutMargins = a3;
  v4 = 2 * (v3 >= 2.22044605e-16);
  v5 = fabs(a3.top) >= 2.22044605e-16;
  if (fabs(a3.trailing) >= 2.22044605e-16)
    v4 = (2 * (v3 >= 2.22044605e-16)) | 8;
  v6 = v4 | v5;
  if (fabs(a3.bottom) >= 2.22044605e-16)
    v6 |= 4u;
  *(_BYTE *)&self->_contentViewFlags = *(_BYTE *)&self->_contentViewFlags & 0xF0 | v6;
  -[UIView _updateInferredLayoutMargins](self, "_updateInferredLayoutMargins");
}

- (UITableViewCellContentView)initWithFrame:(CGRect)a3
{
  UITableViewCellContentView *v3;
  UITableViewCellContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITableViewCellContentView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UITableViewCellContentView _tableViewCellContentViewCommonSetup](v3, "_tableViewCellContentViewCommonSetup");
    if (dyld_program_sdk_at_least())
    {
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        -[UIView setEdgesPreservingSuperviewLayoutMargins:](v4, "setEdgesPreservingSuperviewLayoutMargins:", 10);
        -[UIView setEdgesInsettingLayoutMarginsFromSafeArea:](v4, "setEdgesInsettingLayoutMarginsFromSafeArea:", -[UIView edgesInsettingLayoutMarginsFromSafeArea](v4, "edgesInsettingLayoutMarginsFromSafeArea") & 0xA);
      }
    }
  }
  return v4;
}

- (void)_tableViewCellContentViewCommonSetup
{
  if (dyld_program_sdk_at_least())
    -[UIView _setHostsLayoutEngine:](self, "_setHostsLayoutEngine:", 1);
  if (dyld_program_sdk_at_least())
  {
    -[UIView setEdgesPreservingSuperviewLayoutMargins:](self, "setEdgesPreservingSuperviewLayoutMargins:", 15);
  }
  else if (dyld_program_sdk_at_least())
  {
    -[UIView setEdgesPreservingSuperviewLayoutMargins:](self, "setEdgesPreservingSuperviewLayoutMargins:", 10);
    -[UIView setEdgesInsettingLayoutMarginsFromSafeArea:](self, "setEdgesInsettingLayoutMarginsFromSafeArea:", -[UIView edgesInsettingLayoutMarginsFromSafeArea](self, "edgesInsettingLayoutMarginsFromSafeArea") & 0xA);
  }
}

+ (id)classFallbacksForKeyedArchiver
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("UIView"));
}

- (UITableViewCellContentView)initWithCoder:(id)a3
{
  UITableViewCellContentView *v3;
  UITableViewCellContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITableViewCellContentView;
  v3 = -[UIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[UITableViewCellContentView _tableViewCellContentViewCommonSetup](v3, "_tableViewCellContentViewCommonSetup");
  return v4;
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
    v5 = setTranslatesAutoresizingMaskIntoConstraints____s_category_1;
    if (!setTranslatesAutoresizingMaskIntoConstraints____s_category_1)
    {
      v5 = __UILogCategoryGetNode("LayoutConstraints", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&setTranslatesAutoresizingMaskIntoConstraints____s_category_1);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      -[UIView superview](self, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Changing the translatesAutoresizingMaskIntoConstraints property of the contentView of a UITableViewCell is not supported and will result in undefined behavior, as this property is managed by the owning UITableViewCell. Cell: %@", buf, 0xCu);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)UITableViewCellContentView;
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](&v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, v3);
}

- (NSDirectionalEdgeInsets)_overriddenDefaultLayoutMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_overriddenDefaultLayoutMargins.top;
  leading = self->_overriddenDefaultLayoutMargins.leading;
  bottom = self->_overriddenDefaultLayoutMargins.bottom;
  trailing = self->_overriddenDefaultLayoutMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

@end
