@implementation VUIMediaEntitiesToRecentlyAddedMediaEntitiesValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0DC69D8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithDateForEntityBlock:", &__block_literal_global_53);
  objc_msgSend(v5, "setMaxEntities:", 20);
  objc_msgSend(v5, "transformedValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __81__VUIMediaEntitiesToRecentlyAddedMediaEntitiesValueTransformer_transformedValue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addedDate");
}

@end
