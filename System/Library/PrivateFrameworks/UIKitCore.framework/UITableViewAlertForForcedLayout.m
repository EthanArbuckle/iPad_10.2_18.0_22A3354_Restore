@implementation UITableViewAlertForForcedLayout

void __UITableViewAlertForForcedLayout_block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_TableViewHeadersFootersUseModernConfiguration_block_invoke_10___s_category;
  if (!_UIInternalPreference_TableViewHeadersFootersUseModernConfiguration_block_invoke_10___s_category)
  {
    v2 = __UILogCategoryGetNode("TableView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_TableViewHeadersFootersUseModernConfiguration_block_invoke_10___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Warning once only: UITableView was forced to perform an immediate layout of its visible cells and other contents, due to an API method being called on the table view while it was waiting for the next layout pass. This will cause unnecessary performance overhead, and may also cause bugs by forcing views inside the table view to load and perform layout too early. For best results, if the UITableView API must be called, you should defer it until after the table view receives -layoutSubviews during a regular layout pass. Make a symbolic breakpoint at UITableViewAlertForForcedLayout to catch this in the debugger and see which API method caused this to occur. Table view: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

@end
