@implementation UIDiffableDataSourceTransaction

uint64_t __64___UIDiffableDataSourceTransaction_initialDataSourceSnapshotter__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "initialSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2 < 0)
  {
    v9 = objc_msgSend(v4, "numberOfSections");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "initialSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "numberOfItemsInSection:", v8);

  }
  return v9;
}

uint64_t __62___UIDiffableDataSourceTransaction_finalDataSourceSnapshotter__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "finalSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2 < 0)
  {
    v9 = objc_msgSend(v4, "numberOfSections");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finalSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "numberOfItemsInSection:", v8);

  }
  return v9;
}

@end
