@implementation UITableViewAlertForLayoutOutsideViewHierarchy

void __UITableViewAlertForLayoutOutsideViewHierarchy_block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_TableViewHeadersFootersUseModernConfiguration_block_invoke_11___s_category[0];
  if (!_UIInternalPreference_TableViewHeadersFootersUseModernConfiguration_block_invoke_11___s_category[0])
  {
    v2 = __UILogCategoryGetNode("TableView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, _UIInternalPreference_TableViewHeadersFootersUseModernConfiguration_block_invoke_11___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Warning once only: UITableView was told to layout its visible cells and other contents without being in the view hierarchy (the table view or one of its superviews has not been added to a window). This may cause bugs by forcing views inside the table view to load and perform layout without accurate information (e.g. table view bounds, trait collection, layout margins, safe area insets, etc), and will also cause unnecessary performance overhead due to extra layout passes. Make a symbolic breakpoint at UITableViewAlertForLayoutOutsideViewHierarchy to catch this in the debugger and see what caused this to occur, so you can avoid this action altogether if possible, or defer it until the table view has been added to a window. Table view: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

@end
