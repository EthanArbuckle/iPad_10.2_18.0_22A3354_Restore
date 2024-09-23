@implementation SBTestRecipeRegistrar

+ (void)registerAllTestRecipes
{
  _QWORD block[5];

  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SBTestRecipeRegistrar_registerAllTestRecipes__block_invoke;
  block[3] = &__block_descriptor_40_e12_v24__0_8_B16l;
  block[4] = a1;
  objc_enumerateClasses(0, 0, (Protocol *)&unk_1EFC8F6B0, 0, block);
  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);
}

void __47__SBTestRecipeRegistrar_registerAllTestRecipes__block_invoke(uint64_t a1, void *a2)
{
  void *v4;

  v4 = (void *)MEMORY[0x1D17E5334]();
  if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(a2, "shouldRegisterTestRecipe"))
    objc_msgSend(*(id *)(a1 + 32), "_lock_registerRecipeWithClass:", a2);
  objc_autoreleasePoolPop(v4);
}

+ (void)registerWindowScene:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

void __45__SBTestRecipeRegistrar_registerWindowScene___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (id)__recipes;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "windowSceneDidUpdate:", *(_QWORD *)(a1 + 32), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);
}

+ (void)_lock_registerRecipeWithClass:(Class)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  if (!__recipes)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = (void *)__recipes;
    __recipes = (uint64_t)v4;

  }
  v6 = objc_alloc_init(a3);
  objc_msgSend((id)__recipes, "addObject:", v6);
  v7 = (void *)MEMORY[0x1E0D83030];
  objc_msgSend(v6, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __55__SBTestRecipeRegistrar__lock_registerRecipeWithClass___block_invoke;
  v18[3] = &unk_1E8E9DED8;
  v19 = v6;
  v13 = v9;
  v14 = 3221225472;
  v15 = __55__SBTestRecipeRegistrar__lock_registerRecipeWithClass___block_invoke_2;
  v16 = &unk_1E8E9DED8;
  v10 = v19;
  v17 = v10;
  objc_msgSend(v7, "recipeWithTitle:increaseAction:decreaseAction:", v8, v18, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = (void *)objc_msgSend(v10, "domainClass", v13, v14, v15, v16);
  objc_msgSend(v12, "registerTestRecipe:", v11, v13, v14, v15, v16);

}

uint64_t __55__SBTestRecipeRegistrar__lock_registerRecipeWithClass___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleVolumeIncrease");
}

uint64_t __55__SBTestRecipeRegistrar__lock_registerRecipeWithClass___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleVolumeDecrease");
}

@end
