@implementation TVVideoElement

- (NSArray)assets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[TVViewElement childViewElements](self, "childViewElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v4, "copy");
  return (NSArray *)v5;
}

uint64_t __24__TVVideoElement_assets__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TVVideoElement assets](self, "assets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToArray:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
