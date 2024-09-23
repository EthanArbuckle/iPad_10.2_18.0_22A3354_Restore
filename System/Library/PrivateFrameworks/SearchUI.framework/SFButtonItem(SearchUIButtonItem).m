@implementation SFButtonItem(SearchUIButtonItem)

- (uint64_t)_searchUIButtonItemGeneratorClass
{
  NSObject *v2;

  SearchUIGeneralLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[SFButtonItem(SearchUIButtonItem) _searchUIButtonItemGeneratorClass].cold.1(a1, v2);

  return 0;
}

- (void)_searchUIButtonItemGeneratorClass
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "Unsupported buttonItem: %@", (uint8_t *)&v5, 0xCu);

}

@end
