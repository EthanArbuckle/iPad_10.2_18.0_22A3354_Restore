@implementation WBSQueryParameterFilteringData

- (WBSQueryParameterFilteringData)init
{
  WBSQueryParameterFilteringData *v2;
  uint64_t v3;
  NSMutableOrderedSet *originalAndAdjustedURLs;
  WBSQueryParameterFilteringData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSQueryParameterFilteringData;
  v2 = -[WBSQueryParameterFilteringData init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v3 = objc_claimAutoreleasedReturnValue();
    originalAndAdjustedURLs = v2->_originalAndAdjustedURLs;
    v2->_originalAndAdjustedURLs = (NSMutableOrderedSet *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)addAdjustedURL:(id)a3 originalURL:(id)a4
{
  NSMutableOrderedSet *originalAndAdjustedURLs;
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  originalAndAdjustedURLs = self->_originalAndAdjustedURLs;
  v6 = (objc_class *)MEMORY[0x1E0D89C18];
  v7 = a4;
  v8 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithFirst:second:", v7, v8);

  -[NSMutableOrderedSet addObject:](originalAndAdjustedURLs, "addObject:", v9);
}

- (void)addData:(id)a3
{
  NSMutableOrderedSet *originalAndAdjustedURLs;
  id v4;

  originalAndAdjustedURLs = self->_originalAndAdjustedURLs;
  objc_msgSend(*((id *)a3 + 1), "array");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet addObjectsFromArray:](originalAndAdjustedURLs, "addObjectsFromArray:", v4);

}

- (int64_t)numberOfFilteredQueryParameters
{
  void *v3;
  NSMutableOrderedSet *originalAndAdjustedURLs;
  id v5;
  int64_t v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  originalAndAdjustedURLs = self->_originalAndAdjustedURLs;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__WBSQueryParameterFilteringData_numberOfFilteredQueryParameters__block_invoke;
  v8[3] = &unk_1E4B3E508;
  v9 = v3;
  v5 = v3;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](originalAndAdjustedURLs, "enumerateObjectsUsingBlock:", v8);
  v6 = objc_msgSend(v5, "count");

  return v6;
}

void __65__WBSQueryParameterFilteringData_numberOfFilteredQueryParameters__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a2;
  objc_msgSend(v3, "first");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v15, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v5, "queryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "queryItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForKey:", CFSTR("name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v14);

  objc_msgSend(*(id *)(a1 + 32), "unionSet:", v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalAndAdjustedURLs, 0);
}

@end
