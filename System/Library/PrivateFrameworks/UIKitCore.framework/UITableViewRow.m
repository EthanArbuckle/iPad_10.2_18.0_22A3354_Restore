@implementation UITableViewRow

+ (id)row
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (UITableViewRow)initWithCoder:(id)a3
{
  id v4;
  UITableViewRow *v5;
  uint64_t v6;
  UITableViewCell *cell;
  int v8;
  double v9;
  float v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UITableViewRow;
  v5 = -[UITableViewRow init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITableRowCell"));
    v6 = objc_claimAutoreleasedReturnValue();
    cell = v5->_cell;
    v5->_cell = (UITableViewCell *)v6;

    v8 = objc_msgSend(v4, "containsValueForKey:", CFSTR("UITableRowHeight"));
    v9 = -1.0;
    if (v8)
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UITableRowHeight"), -1.0);
      v9 = v10;
    }
    v5->_height = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  UITableViewCell *cell;
  double height;
  void *v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  cell = self->_cell;
  if (cell)
  {
    objc_msgSend(v4, "encodeObject:forKey:", cell, CFSTR("UITableRowCell"));
    height = self->_height;
    -[UITableViewCell _tableView](self->_cell, "_tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rowHeight");
    v10 = v9;

    if (height != v10)
    {
      *(float *)&v11 = height;
      objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("UITableRowHeight"), v11);
    }
  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "attempt to encode a an instance of UITableViewRow without a cell", buf, 2u);
    }

  }
  else
  {
    v12 = encodeWithCoder____s_category_0;
    if (!encodeWithCoder____s_category_0)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&encodeWithCoder____s_category_0);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "attempt to encode a an instance of UITableViewRow without a cell", v15, 2u);
    }
  }

}

- (void)setIndentationLevel:(int64_t)a3
{
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "indentationLevel property on UITableViewRow is deprecated", buf, 2u);
    }

  }
  else
  {
    v5 = setIndentationLevel____s_category;
    if (!setIndentationLevel____s_category)
    {
      v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&setIndentationLevel____s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "indentationLevel property on UITableViewRow is deprecated", v8, 2u);
    }
  }
  -[UITableViewCell setIndentationLevel:](self->_cell, "setIndentationLevel:", a3);
}

- (int64_t)indentationLevel
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "indentationLevel property on UITableViewRow is deprecated", buf, 2u);
    }

  }
  else
  {
    v3 = indentationLevel___s_category;
    if (!indentationLevel___s_category)
    {
      v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&indentationLevel___s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "indentationLevel property on UITableViewRow is deprecated", v7, 2u);
    }
  }
  return -[UITableViewCell indentationLevel](self->_cell, "indentationLevel");
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (UITableViewCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
  objc_storeStrong((id *)&self->_cell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
