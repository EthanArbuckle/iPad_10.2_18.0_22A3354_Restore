@implementation SUAssetStateMatcher

- (SUAssetStateMatcher)initWithType:(id)a3 interestedStates:(int)a4
{
  id v7;
  SUAssetStateMatcher *v8;
  uint64_t v9;
  NSString *assetType;
  NSDictionary *matcherInfo;
  void *v13;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUAssetStateMatcher;
  v8 = -[SUAssetStateMatcher init](&v14, sel_init);
  if (v8)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SUAssetStateMatcher.m"), 23, CFSTR("Asset type must be non-nil for a matcher."));

    }
    v9 = objc_msgSend(v7, "copy");
    assetType = v8->_assetType;
    v8->_assetType = (NSString *)v9;

    v8->_interestedStates = a4;
    matcherInfo = v8->_matcherInfo;
    v8->_matcherInfo = 0;

  }
  return v8;
}

- (id)findMatchFromCandidates:(id)a3 error:(id *)a4
{
  int interestedStates;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  SUAssetStateMatcher *v17;
  id v18;

  interestedStates = self->_interestedStates;
  v7 = (objc_class *)MEMORY[0x24BDBCEB8];
  v8 = a3;
  if (interestedStates)
  {
    v9 = objc_alloc_init(v7);
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __53__SUAssetStateMatcher_findMatchFromCandidates_error___block_invoke;
    v16 = &unk_24CE3B598;
    v17 = self;
    v10 = v9;
    v18 = v10;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v13);

  }
  else
  {
    v10 = (id)objc_msgSend([v7 alloc], "initWithArray:", v8);

  }
  -[SUAssetStateMatcher _findMatchFromCandidates:error:](self, "_findMatchFromCandidates:error:", v10, a4, v13, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __53__SUAssetStateMatcher_findMatchFromCandidates_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_matchesFilterType:"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)_findMatchFromCandidates:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_matchesFilterType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  v5 = v4;
  if (self->_interestedStates)
  {
    v6 = objc_msgSend(v4, "state");
    v7 = (unint64_t)(v6 - 1) <= 3 && (self->_interestedStates & dword_21297FB40[v6 - 1]) != 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (int)interestedStates
{
  return self->_interestedStates;
}

- (NSDictionary)matcherInfo
{
  return self->_matcherInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcherInfo, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
}

@end
