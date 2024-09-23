@implementation PIParallaxStyleRecipe

- (PIParallaxStyleRecipe)init
{
  return -[PIParallaxStyleRecipe initWithParameters:foregroundFilters:backgroundFilters:matteFilters:](self, "initWithParameters:foregroundFilters:backgroundFilters:matteFilters:", MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (PIParallaxStyleRecipe)initWithParameters:(id)a3 foregroundFilters:(id)a4 backgroundFilters:(id)a5 matteFilters:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PIParallaxStyleRecipe *v13;
  uint64_t v14;
  NSDictionary *parameters;
  uint64_t v16;
  NSArray *foregroundFilters;
  uint64_t v18;
  NSArray *backgroundFilters;
  uint64_t v20;
  NSArray *matteFilters;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PIParallaxStyleRecipe;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[PIParallaxStyleRecipe init](&v23, sel_init);
  v14 = objc_msgSend(v12, "copy", v23.receiver, v23.super_class);

  parameters = v13->_parameters;
  v13->_parameters = (NSDictionary *)v14;

  v16 = objc_msgSend(v11, "copy");
  foregroundFilters = v13->_foregroundFilters;
  v13->_foregroundFilters = (NSArray *)v16;

  v18 = objc_msgSend(v10, "copy");
  backgroundFilters = v13->_backgroundFilters;
  v13->_backgroundFilters = (NSArray *)v18;

  v20 = objc_msgSend(v9, "copy");
  matteFilters = v13->_matteFilters;
  v13->_matteFilters = (NSArray *)v20;

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[PIParallaxStyleRecipe isEqualToParallaxStyleRecipe:](self, "isEqualToParallaxStyleRecipe:", v4);

  return v5;
}

- (BOOL)isEqualToParallaxStyleRecipe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a3;
  -[PIParallaxStyleRecipe parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToDictionary:", v6);

  if (!v7)
    goto LABEL_5;
  -[PIParallaxStyleRecipe foregroundFilters](self, "foregroundFilters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "foregroundFilters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToArray:", v9);

  if (!v10)
    goto LABEL_5;
  -[PIParallaxStyleRecipe backgroundFilters](self, "backgroundFilters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundFilters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToArray:", v12);

  if (v13)
  {
    -[PIParallaxStyleRecipe matteFilters](self, "matteFilters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matteFilters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToArray:", v15);

  }
  else
  {
LABEL_5:
    v16 = 0;
  }

  return v16;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PIParallaxStyleRecipe parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleRecipe foregroundFilters](self, "foregroundFilters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleRecipe backgroundFilters](self, "backgroundFilters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleRecipe matteFilters](self, "matteFilters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p parameters: %@\nforeground:%@\n background: %@\n matte: %@>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSArray)foregroundFilters
{
  return self->_foregroundFilters;
}

- (NSArray)backgroundFilters
{
  return self->_backgroundFilters;
}

- (NSArray)matteFilters
{
  return self->_matteFilters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matteFilters, 0);
  objc_storeStrong((id *)&self->_backgroundFilters, 0);
  objc_storeStrong((id *)&self->_foregroundFilters, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
