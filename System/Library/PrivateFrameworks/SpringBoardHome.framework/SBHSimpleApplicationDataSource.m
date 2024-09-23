@implementation SBHSimpleApplicationDataSource

- (id)allApplicationsForIconModel:(id)a3
{
  return -[SBHSimpleApplicationDataSource simpleApplicationsWithEnumeratorOptions:](self, "simpleApplicationsWithEnumeratorOptions:", 0);
}

- (id)iconModel:(id)a3 applicationWithBundleIdentifier:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0CA5870];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, 0);

  if (v7)
  {
    -[SBHSimpleApplicationDataSource makeApplicationWithRecord:](self, "makeApplicationWithRecord:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)allApplicationPlaceholdersForIconModel:(id)a3
{
  return -[SBHSimpleApplicationDataSource simpleApplicationsWithEnumeratorOptions:](self, "simpleApplicationsWithEnumeratorOptions:", 64);
}

- (id)simpleApplicationsWithEnumeratorOptions:(unint64_t)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "nextObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      -[SBHSimpleApplicationDataSource makeApplicationWithRecord:](self, "makeApplicationWithRecord:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_msgSend(v5, "addObject:", v8);

      objc_msgSend(v4, "nextObject");
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
    while (v9);
  }

  return v5;
}

- (id)makeApplicationWithRecord:(id)a3
{
  id v4;
  SBHSimpleApplication *v5;

  v4 = a3;
  if (objc_msgSend(v4, "sbh_isValidType"))
  {
    v5 = -[SBHSimpleApplication initWithApplicationRecord:]([SBHSimpleApplication alloc], "initWithApplicationRecord:", v4);
    -[SBHSimpleApplication setIconModelApplicationDataSource:](v5, "setIconModelApplicationDataSource:", self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
