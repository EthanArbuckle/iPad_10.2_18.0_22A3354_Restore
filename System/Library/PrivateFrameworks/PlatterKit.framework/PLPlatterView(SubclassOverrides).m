@implementation PLPlatterView(SubclassOverrides)

- (void)_initWithRecipe:()SubclassOverrides orRecipeNamesByTraitCollection:inBundle:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D1285000, a2, OS_LOG_TYPE_ERROR, "%{public}@: recipe and custom recipe map both specified; map will be ignored",
    (uint8_t *)&v2,
    0xCu);
}

@end
