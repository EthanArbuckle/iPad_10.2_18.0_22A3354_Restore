@implementation PXStoryPassthroughPersistableRecipeProducer

- (PXStoryPassthroughPersistableRecipeProducer)init
{
  return -[PXStoryPassthroughPersistableRecipeProducer initWithPersistableRecipe:](self, "initWithPersistableRecipe:", 0);
}

- (PXStoryPassthroughPersistableRecipeProducer)initWithPersistableRecipe:(id)a3
{
  id v4;
  PXStoryPassthroughPersistableRecipeProducer *v5;
  uint64_t v6;
  PFStoryRecipe *persistableRecipe;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPassthroughPersistableRecipeProducer;
  v5 = -[PXStoryPassthroughPersistableRecipeProducer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copyWithZone:", 0);
    persistableRecipe = v5->_persistableRecipe;
    v5->_persistableRecipe = (PFStoryRecipe *)v6;

  }
  return v5;
}

- (id)requestPersistableRecipeWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  void (**v5)(id, PXStoryProducerResult *);
  PXStoryPersistableRecipeResult *v6;
  void *v7;
  PXStoryPersistableRecipeResult *v8;
  PXStoryProducerResult *v9;

  v5 = (void (**)(id, PXStoryProducerResult *))a4;
  v6 = [PXStoryPersistableRecipeResult alloc];
  -[PXStoryPassthroughPersistableRecipeProducer persistableRecipe](self, "persistableRecipe");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXStoryPersistableRecipeResult initWithPersistableRecipe:](v6, "initWithPersistableRecipe:", v7);

  v9 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v8);
  v5[2](v5, v9);

  return 0;
}

- (PFStoryRecipe)persistableRecipe
{
  return self->_persistableRecipe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistableRecipe, 0);
}

@end
