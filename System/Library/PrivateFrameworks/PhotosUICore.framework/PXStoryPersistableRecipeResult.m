@implementation PXStoryPersistableRecipeResult

- (PXStoryPersistableRecipeResult)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPersistableRecipeResult.m"), 16, CFSTR("%s is not available as initializer"), "-[PXStoryPersistableRecipeResult init]");

  abort();
}

- (PXStoryPersistableRecipeResult)initWithPersistableRecipe:(id)a3
{
  return -[PXStoryPersistableRecipeResult initWithPersistableRecipe:miroInfo:](self, "initWithPersistableRecipe:miroInfo:", a3, 0);
}

- (PXStoryPersistableRecipeResult)initWithPersistableRecipe:(id)a3 miroInfo:(id)a4
{
  id v7;
  id v8;
  PXStoryPersistableRecipeResult *v9;
  PXStoryPersistableRecipeResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryPersistableRecipeResult;
  v9 = -[PXStoryPersistableRecipeResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recipe, a3);
    objc_storeStrong((id *)&v10->_miroInfo, a4);
  }

  return v10;
}

- (PFStoryRecipe)recipe
{
  return self->_recipe;
}

- (PXStoryMiroMemoryConverter)miroInfo
{
  return self->_miroInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miroInfo, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
}

@end
